module ApplicationHelper
    def flash_background_color(type)
        case type.to_sym
        when :success then "bg-success"
        when :alert  then "bg-error"
        else "bg-gray-500"
        end
    end

    def page_title(page_title= '')
        base_title = 'My Coffee Diary'
        page_title.empty? ? base_title : page_title + ' | ' + base_title
    end


    def default_meta_tags
        {
            site: '',
            title: '',
            reverse: true,
            charset: 'utf-8',
            description: 'My Coffee Diaryは今日楽しんだコーヒーを記録するアプリです',
            keywords: 'コーヒー,カフェラテ,投稿',
            canonical: request.original_url,
            separator: '|',
            og: {
                site_name: :site,
                title: :title,
                description: :description,
                type: 'website',
                url: request.original_url,
                image: image_url('ogp.png'),
                local: 'ja-JP'
            },
            twitter: {
                card: 'summary_large_image', 
                image: image_url('ogp.png')
            }
        }
    end
end
