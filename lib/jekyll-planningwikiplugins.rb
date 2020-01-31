require "jekyll/planningwikiplugins/version"

module Jekyll
    class GitAuthorTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
  
        def lookup(context, name)
            lookup = context
            name.split(".").each { |value| lookup = lookup[value] }
            lookup
        end

        def render(context)
            `git log --pretty=format:"%an," #{lookup(context, 'page.path')} | sort | uniq`
        end
    end
    class GitAuthorAllTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
  
        def lookup(context, name)
            lookup = context
            name.split(".").each { |value| lookup = lookup[value] }
            lookup
        end

        def render(context)
            `git log --pretty=format:"%an," . | sort | uniq`
        end
    end
    class PlannerTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
    
        def render(context)
            #Split by space
            tags = @text.split(' ')
            result = "tags: "
            tags.each do |tag|
                result = "#{result} <a href=\"/ref/planners/tags/#{tag.downcase}\">#{tag}</a>"
            end
            result
        end
    end
    class CitePaperTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super

            if text.split(' ').length > 2
              @text = text.split(' ')[0..-3].join(" ")
              @paper = text.split(' ')[-2]
              @pageno = text.split(' ')[-1]
            else 
              @text = text.split(' ')[0]
              @paper = text.split(' ')[1]
              @pageno = 1
            end
        end

        def render(context)
            "<a href=\"/_citedpapers/#{@paper}.pdf#page=#{@pageno}\">#{@text}</a>"
        end
    end
end
    
Liquid::Template.register_tag('planner_tag', Jekyll::PlannerTag) 
Liquid::Template.register_tag('git_author', Jekyll::GitAuthorTag)
Liquid::Template.register_tag('git_author_all', Jekyll::GitAuthorAllTag)
Liquid::Template.register_tag('paper_link', Jekyll::CitePaperTag)
