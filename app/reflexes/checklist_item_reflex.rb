# frozen_string_literal: true

class ChecklistItemReflex < ApplicationReflex

  def create
    # binding.pry
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    checklist = page.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.new(checklist_items_params)
    checklist_item.status = 'not-started'
    checklist_item.save

    # target_id = "#checklist-items-for-#{checklist.id}"
    # morph target_id, ApplicationController.render(
    #   partial: "checklists/items", locals:{
    #     notebook:notebook,
    #     page: page,
    #     checklist: checklist
    #     }
    #   )
  end

  def change_status
    checklist_item = ChecklistItem.includes(:checklist).find(element.dataset.id)
    checklist_item.update(status: element.dataset.status)
    morph "#checklist-#{checklist_item.checklist_id}", ApplicationController.render(
      partial: 'checklists/checklist',
      locals: { checklist: checklist_item.checklist }
    )
  end

  private

  def checklist_items_params
    params.required(:checklist_item).permit(:checklist_id, :title, :status)
  end


end
