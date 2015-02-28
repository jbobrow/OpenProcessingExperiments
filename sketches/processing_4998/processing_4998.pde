
// bunch of eyes 
// By : Ms. Bea 
// Made : Oct 4th, 2009 
// Where : Processing workshop @ Gray Area Foundation For The Arts, San Francisco, CA 


Eye[] eyeballz = new Eye[30];

float body_x, body_y; // initialize 2 vars at once
float pupil_x, pupil_y;

void setup() {
  size(750,500);
  smooth();
  frameRate(12);

  body_x = width / 2;
  body_y = height * 2.5;


  for(int i = 0;i < eyeballz.length; i++) {
    color eyeColor = color(random(255), 0, 0);
    eyeballz[i] = new Eye(random(0, width), random(0,height), eyeColor);
  }


}

void draw() {
  background(0);

  body_x += random(-15,15);
  body_y += random(-15,15);


  for(int i = 0;i < eyeballz.length; i++) {
    eyeballz[i].draw();
  }
}

class Eye {
  float x;
  float y;
  color eye_color;

  Eye(float init_x, float init_y, color init_color) { //set initial position of eye
    x = init_x;
    y = init_y;
    eye_color = init_color;
  } 

  void draw() {
    x = x + random(-25,25);
    y = y + random(-25,25);

    // draw stalk
    stroke(255);
    strokeWeight(3);
    line(body_x, body_y, x, y); //vars will be avail at any instance

    //draw eyeball
    pushMatrix();
    translate(x,y);
    
    //white eye
    noStroke();
    fill(255);
    ellipse(0, 0, 100, 100); 

    float angle = atan2(mouseY - y, mouseX - x); // mouse position from the eye pow, rotate pupil
    pupil_x = lerp(pupil_x, 25 * sin(angle), 0.1);
    pupil_y = lerp(pupil_y, 25 * cos(angle), 0.1);

    translate(pupil_x,pupil_y);
    fill(eye_color);
    ellipse(0, 0, 40, 40);
    stroke(255);
    strokeWeight(3);
    ellipse(0, 0, 40, 40);
    
    stroke(100);
    strokeWeight(8);
    noFill();
    ellipse(0, 0, 35, 35);  

    popMatrix();

  }

}





