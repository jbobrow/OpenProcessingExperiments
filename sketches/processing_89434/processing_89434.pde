
import controlP5.*;
ControlP5 cp5;

int circleRadius = 20;

String str = "Sleepy";
Toroid doughnut;

void setup() {
  PFont font = createFont("Georgia", 30, true);
  textFont(font);
  size(500, 500);


  cp5 = new ControlP5(this);


  cp5.addTextfield("str")
    .setPosition(20, 40)
      .setSize(200, 40)
        .setFont(createFont("Arial", 20, true))
          .setFocus(true)
            .setColor(color(255, 255, 255))
              .setColorBackground(color(0, 0, 0))
                ;
  doughnut = new Toroid(width/2, height/2, 5);
}
void draw() {
  fill(255, 50); 
  background(0);
  pushMatrix();
  doughnut.build();
  popMatrix();
}


class Toroid {
  float d;
  float a = 0;
  float x = 1;
  float xpos;
  float ypos;
  Toroid(float _xpos, float _ypos, float _d) {
    xpos = _xpos;
    ypos = _ypos;
    d = _d;
  }
  void build() {
    a += map(mouseX/2, 0, width, 20, -20);
    x = map(mouseY/2, 0, width, 50, 100);
    translate(xpos, ypos);
    for (int i = 0; i < x; i ++) {
      translate(cos(radians(a))*d, sin(radians(a))*d);
      rotate(radians(360/x));
       text(str, cos(radians(a))*d, sin(radians(a))*d);
      for (int j = 0; j < x; j++) {
        
       
        translate(cos(radians(a))*d, sin(radians(a))*d);
        rotate(radians(360/x));
       
      }
    }
  }
  //  void drawSpoke() {
  //    rotate(radians(360/x));
  //    //text(str, cos(radians(a))*d, sin(radians(a))*d);
  //    //line(cos(radians(a))*d, sin(radians(a))*d, 0, 0);
  //  }
  //  void drawSubSpokes() {
  //    translate(cos(radians(a))*d, sin(radians(a))*d);
  //    //line(cos(radians(a))*d/2, sin(radians(a))*d/2, 0, 0);
  //    translate(cos(radians(a))*d, sin(radians(a))*d);
  //    rotate(radians(360/x));
  //    text(str, cos(radians(a))*d, sin(radians(a))*d);
  //    //line(cos(radians(a))*d/2, sin(radians(a))*d/2, 0, 0);
  //  }
}



