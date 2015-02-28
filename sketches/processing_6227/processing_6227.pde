

class BigRobot {
  
  float inc = 0.0; //mustache
  PImage eyes, mouth, body;

  //constructor
  BigRobot() {

    eyes = loadImage("eyes_layer_final.png");// eyes
    mouth = loadImage("lips_layer_final.png"); // mouth
    body = loadImage("rb_body_small.png"); // body
    float angle = 0.0; 
    stroke(0);//mustache
  }
  
  void display () {
    image(body, 160,50);//body
    image(eyes, 150, 70); //eyes
    image(mouth, 200, 130); //mouth 
    float speed = mouseX/2000.0; //mustache
    int units = (int) mouseY/10; //mustache
    mustache(speed, units);  //mustache
  }
  
    void mustache (float speed, int units) {

    inc += speed;
    float angle = sin(inc) / mouseY*10 + sin(inc*1.2) / mouseY*20;
    //float angle = sin(inc) / 10.0 + sin(inc*1.2) / 20.0;
    tail(220, 120, mouseX/20, angle, 1);
    tail(220, 120, mouseX/20, angle, -1);

    tail(220, 120, mouseY/20, angle, 1);
    tail(220, 120, mouseY/20, angle, -1);
  }
  void tail(int x, int y, int units, float angle, int d) {
    pushMatrix();
    translate(x,y);
    for (int i = units; i > 0; i--) {
      strokeWeight(i);
      line(5,3,0,-8);
      translate(-8*d,0);
      rotate(angle*d);  
    }  
    popMatrix();
  }
}

