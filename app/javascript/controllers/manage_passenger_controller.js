import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { passengerNumber: Number, id: Number }
  static targets = ["addButton"]
  add() {
    const template = this.element.querySelector('template')
    const clone = document.importNode(template.content, true)

    clone.querySelectorAll('input').forEach(input => {
      input.id = input.id.replace("2", `${this.idValue}`)
      input.name = input.name.replace("2", `${this.idValue}`)
      console.log(input.id, input.name)
    })  
    clone.querySelectorAll('label').forEach(label => {
      label.htmlFor = label.htmlFor.replace("2", `${this.idValue}`)
    })
    this.element.insertBefore(clone, this.addButtonTarget)
    this.updatePassengerNumber()
    this.idValue++
  }

  remove(event) {
    const passengerFields = event.target.closest('.passenger-fields')
    if (passengerFields && this.passengerNumberValue > 1) {
      passengerFields.remove()
      this.updatePassengerNumber()
    }
  }

  updatePassengerNumber() {
    const currentPassengerFields = this.element.querySelectorAll('.passenger-fields')
    this.passengerNumberValue = currentPassengerFields.length
  }
}
