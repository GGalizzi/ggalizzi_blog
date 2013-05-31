include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Tagging
include Nanoc::Helpers::Rendering
require 'pry'

require 'set'

public

def route_path(item)
    path = item[:content_filename].split('.').reverse.drop(1).reverse.join
    url = path.gsub(/^content/, '') << '/'
    url
end

def tag_set(item=nil)
    items = @items
    tags = Set.new
    items.each do |item|
        next if item[:tags].nil?
        item[:tags].each { |tag| tags << tag }
    end
    tags.to_a
end

def add_date_info
    articles = sorted_articles
    articles.each do |article|
        dia = article[:created_at].split('')[0..1].join
        if dia.split('')[0] == '0'
            article[:day] = dia.split('')[1]
        else
            article[:day] = dia
        end
        article[:date_info] = article[:created_at].split('/').drop(1).join('/').split(' ').reverse.drop(1).reverse.join
        article[:year] = article[:date_info].split('/').last
        article[:month] = int_to_month(article[:date_info].split('/').first)
    end
end

def month_set
    articles = sorted_articles
    months = Set.new
    articles.each do |article|
        months << article[:date_info]
    end
    months.to_a
end

def year_set
    articles = sorted_articles
    years = Set.new
    articles.each do |article|
        years << article[:date_info].split('/').last
    end

    years.to_a
end

def create_tag_pages
    tag_set(items).each do |tag|
        #tag = tag.split('').map! { |x| x == "ñ" ? "n" : x }.join
        items << Nanoc::Item.new(render('_tag_page', :tag => tag),
                    {title: 'tags'}, '/tags/'+ tag +'/')
    end
end

def tags_for(item, params={})
  base_url  = params[:base_url]  || 'http://technorati.com/tag/'
  none_text = params[:none_text] || '(none)'
  separator = params[:separator] || ', '

  if item[:tags].nil? or item[:tags].empty?
    none_text
  else
    item[:tags].map { |tag| %{<a href="/tags/#{tag}/">#{tag}</a>} }.join(separator)
  end
end

def create_archives
    month_set.each do |month|
        @items << Nanoc::Item.new(render('_archive_page', :month => month), {title: 'years', kind: 'archive_page' }, '/archivos/' + month + '/')
    end
end

def snippet
    self.compiled_content.split("<?snippet?>")[0]<< " [...]" + "<br />"
end

def add_class

    binding.pry
=begin
    articles = sorted_articles

    articles.each do |article|
        split_content = article.raw_content.split("^")
        for i in split_content.length.times
            if i.odd?
                split_content[i] = "<class=\"codlet\">"+split_content[i]+"</class>"
            end
        end

        article.raw_content = split_content.join

        binding.pry
    end
=end
end

private

def with_tag_list(tag)
    articles = items_with_tag(tag)
    link_to( articles.first.reps, '/' )
end

def items_with_date_info(date)
    @items.select { |i| (i[:date_info] || []).include?(date) }
end

def parse_time_test(time)
    Time.parse(time)
end

def int_to_month(int)
    case int
    when '01'
        'Enero'
    when '02'
        'Febrero'
    when '03'
        'Marzo'
    when '04'
        'Abril'
    when '05'
        'Mayo'
    when '06'
        'Junio'
    when '07'
        'Julio'
    when '08'
        'Agosto'
    when '09'
        'Septiembre'
    when '10'
        'Octubre'
    when '11'
        'Noviembre'
    when '12'
        'Diciembre'
    end
end
