
//  Grey Awesomeness in processing.js

float theta;
float seed1;
float seed2;

int p_mouseX;
int p_mouseY;

int pos_x, pos_y, ppos_x, ppos_y;

int timestamp;

color fill1;
color fill2;


void setup() {

  size(512, 512);
  background(0);
  fill2 = color(255, 255, 255, 3);
  fill1 = color(0, 0, 0, 10);
  ellipseMode(CENTER);

  ppos_y = 100;
  ppos_x = 100;
  pos_y = 100;
  pos_x = 100;
}

void draw() {


  stroke(0);


  if (mouseX < 5 || mouseY < 5 || mouseX > width-5 || mouseY > height-5) {

    if (millis() > timestamp) {
   
      timestamp = millis() + 130;
      ppos_x = pos_x;
      ppos_y = pos_y;
      pos_y = 100 + int(sin(millis())*sin(theta/10)*height/2);
      pos_x = 100 + int(cos(millis()/3)*sin(theta/5)*width/2);


      theta+=PI/2000;
      seed1+=pos_x/width/10;
      seed2+=pos_y/height/10;
      float speed = dist(pos_x, pos_y, ppos_x, ppos_y);//die distanz zwischen der aktuellen und der letzen mausposition
      float diameter = sqrt(pos_x*pos_x)+(pos_y*pos_y);


      for (float i = 0; i<1;i+=0.0025)
      {
        pushMatrix();
        translate( lerp(pos_x, ppos_x, i), lerp(pos_y, ppos_y, i));
        fill(fill1);
        noStroke();
        theta+=TWO_PI/1000;
        //rotate(theta);
        rotate(lerp(0, TWO_PI, i));
        ellipse(0, 0, speed/100, speed*3);
        popMatrix();
        stroke(fill1);
        line(lerp(pos_x, ppos_x, i), lerp(pos_y, ppos_y, i), lerp(pos_x, ppos_x, i+0.001), lerp(pos_y, ppos_y, i+0.001));
      }
    }
  } 
  else {

    if (p_mouseX != mouseX && p_mouseY != mouseY) {

     
      theta+=PI/200;
      seed1+=mouseX/width/10;
      seed2+=mouseY/height/10;
      float speed = dist(mouseX, mouseY, pmouseX, pmouseY);//die distanz zwischen der aktuellen und der letzen mausposition
      float diameter = sqrt(mouseX*mouseX)+(mouseY*mouseY);
      
      
      for (float i = 0; i<1;i+=0.0025) 
      {
        pushMatrix();
        translate( lerp(mouseX, pmouseX, i), lerp(mouseY, pmouseY, i));
        fill(fill1);
        noStroke();
        theta+=TWO_PI/1000;
        //rotate(theta);
        rotate(lerp(0, TWO_PI, i));
        ellipse(0, 0, speed/100, speed*3);
        popMatrix();
        stroke(fill1);
        line(lerp(mouseX, pmouseX, i), lerp(mouseY, pmouseY, i), lerp(mouseX, pmouseX, i+0.001), lerp(mouseY, pmouseY, i+0.001));

        p_mouseX = mouseX;
        p_mouseY = mouseY;
      }
    }
  }
  fill(fill2);
  rect(0, 0, width, height);

}               
