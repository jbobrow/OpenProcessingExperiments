
//This piece of code uses transformations
//to draw spirals inspired by the sunflower
void setup () {
  size(500, 500);
  background (0);
  smooth();
}
void draw () {
}

float circle = random(1, 10);  
int radius = 300;

void mousePressed() {
  translate(width/2, height/2);  //move the origin to the center
  for (int i = 0; i < 360; i+=circle) {
    int colour = floor(random(1, 100));

    if (colour <=10) {        //gray lines
      pushMatrix();   
      rotate(radians(i));    //rotate the origin
      translate(radius, 0);   //move the origin out to the radius
      noFill();
      stroke(random(0, 255));
      ellipse(0, 0, width, height);  //draw circle
      ellipse(width/2, height/2, width/2, height/2);
      popMatrix();    //reset (back to width/2, height/2)
      ellipse(0, 0, 600, 600);
    }
    if (colour ==50) {       //red lines of random thickness
      pushMatrix();   
      rotate(radians(i));    //rotate the origin
      translate(radius, 0);   //move the origin out to the radius
      noFill();
      stroke(255, 0, 0);
      strokeWeight(random(0, 3));
      ellipse(0, 0, width, height);  //draw circle
      ellipse(width/2, height/2, width/2, height/2);
      popMatrix();    //reset (back to width/2, height/2)
      ellipse(0, 0, 600, 600);
    }
    if (colour ==50) {       //smaller random red circles 
      pushMatrix();   
      rotate(radians(i));    //rotate the origin
      translate(radius/2, 0);   //move the origin out to the radius
      noFill();
      stroke(255, 0, 0);
      ellipse(0, 0, 20, 20);  //draw circle
      ellipse(width/2, height/2, width/2, height/2);
      popMatrix();    //reset (back to width/2, height/2)
      ellipse(0, 0, 600, 600);
    }
    if (colour ==10) {       //smaller circles with black circle of width and height
      pushMatrix();   
      rotate(radians(i));    //rotate the origin
      translate(3*radius/4, 0);   //move the origin out to the radius
      fill(0);
      stroke(255, 0, 0);
      ellipse(0, 0, 600, 600);  //draw circle
      ellipse(width, height, width, height);
      popMatrix();    //reset (back to width/2, height/2)
      ellipse(0, 0, 600, 600);
    }
  }
}


