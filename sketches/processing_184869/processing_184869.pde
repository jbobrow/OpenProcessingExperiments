
import controlP5.*;
ControlP5 cp5;
float a;
int Rosso, Verde, Blu, Trasparenza;
int R, G, B;
void setup() {
  size(1260, 600);
  cp5=new ControlP5(this);
  cp5.addSlider("Rosso")
    .setPosition(20, 20)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)  
            .getValue();

  cp5.addSlider("Verde")
    .setPosition(20, 50)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
  cp5.addSlider("Blu")
    .setPosition(20, 80)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
  cp5.addSlider("Trasparenza")
    .setPosition(780, 110)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
  cp5.addSlider("R")
    .setPosition(780, 20)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
  cp5.addSlider("G")
    .setPosition(780, 50)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
  cp5.addSlider("B")
    .setPosition(780, 80)
      .setRange(0, 255)
        .setSize(400, 20)
          .setValue(127)
            //            .setNumberOfTickMarks(25)
            .getValue();
}
void draw() {
  background(Rosso, Verde, Blu);
  fill(R, G, B, Trasparenza);
  stroke(R, G, B, Trasparenza);
  strokeWeight(5);
  ellipse(500, 500, 50, 50);
  triangle(200, 150, 100, 300, 378, 476);
}



