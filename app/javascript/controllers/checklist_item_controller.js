import ApplicationController from "./application_controller";

/* This is the custom StimulusReflex controller for ChecklistItemReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  afterCreate(element, reflex) {
    element.querySelector(".form-control").value = "";
  }
}
