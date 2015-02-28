

Eye[] eyeballs = new Eye[10];

float body_x, body_y;


void setup(){
  size(600, 600);
  smooth();

  body_x = width / 2;
  body_y = height * 0.8;

  for(int i = 0; i < eyeballs.length; i++){
    color eyeColor = color(random(255), 0, 0);
    eyeballs[i] = new Eye(random (0, width), random(0, height), eyeColor);
  }
}


void draw(){
  background(73, 183, 73);

  body_x += random(-1, 1);
  body_y += random(-1, 1);

  for(int i = 0; i < eyeballs.length; i++){
    eyeballs[i].draw();
  }
}


class Eye {
  float x;
  float y;
  color eye_color;

  Eye(float init_x, float init_y, color init_color){
    x = init_x;
    y = init_y;
    eye_color = init_color;
  }  

  void draw(){
    
    x = x + random(-1, 1);
    y = y + random(-1, 1);
    
    
    stroke(165, 35, 142);
    strokeWeight(20);
    line(body_x, body_y, x, y);

    pushMatrix();
    translate(x, y);

    stroke(165, 35, 142);
    strokeWeight(5);
    fill(255);
    ellipse(0, 0, 100, 100);

    float angle = atan2(mouseY - y, mouseX - x);

    rotate(angle);
    translate(25, 0);
    stroke(0);
    fill( eye_color);
    ellipse(0, 0, 50, 50);
    popMatrix();

  }

}











