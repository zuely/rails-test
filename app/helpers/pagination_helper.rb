module PaginationHelper
  extend ActiveSupport::Concern

  def pagination_param(page, items_per_page, total_items)
    page = page.present? ? page.to_i : 0
    items_per_page = items_per_page.present? ? items_per_page.to_i : 6

    total_pages = (total_items / items_per_page.to_f).ceil
    page = total_pages - 1 if page >= total_pages
    page = 0 if page.negative?

    {
      page:,
      items_per_page:,
      total_pages:
    }
  end
end
