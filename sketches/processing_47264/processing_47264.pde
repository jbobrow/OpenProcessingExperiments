

void setup() {
  size(500, 500);
  smooth();
  background(0);
  colorMode(HSB, width);
  noFill();
}

int x=50; //used to determine the revolution around the center
int y=0; //used for determining the rotation of the objects
int a=50; //the width of the central ellipses
int b= floor(random(150)); //random value determining the height of the central ellipses

void draw() {
    //background(0);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(y*100));
      strokeWeight(2);
      stroke(300, random(0,height/2), height); //random color genorator
      ellipse(0, 0, b/10, b*2);
      popMatrix();
      a--;
      b--;
      
      if(a>=-6100){
        if(a<=-6000){
      translate(250,450);
      stroke(200, random(height/4,height), height);
      line(0,0,random(-200,200),random(-25,25));
      }      
      }
      

  if (mousePressed) { //restarts the sketch with the click of a mouse
    background(0);
    x=50;
    y=0;
    a=50;
    b=floor (random(150));
  }

  x++;
  y+=5;
}


