
PImage img0;

int x= 0;
int y=5;
int z=0;

void setup(){
  size(400,400);
  img0 = loadImage("3.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
    cursor(HAND);
}

void draw(){
  image (img0, 0, 0, 400, 400);
  noStroke();
  fill(20+z, 200, 125);
  ellipse(60+x, 60+y, 50, 50);
  triangle (45+x, 45+y, 35+x, 30+y, 45+x, 24+y);
  triangle (85+x, 55+y, 55+x, 85+y, 90+x, 90+y);
  strokeWeight(2);
  stroke(255, 50);
  line(43+x, 42+y, 90+x, 90+y);
  if (mousePressed == true){
          cursor(HAND);

     x+=mouseX-pmouseX;
  }   else {
    cursor(CROSS);
  }if (x>90){
     y+=5;
  } if (y>300){
     y=300;
     y+=0;
     z+=20;
  } 
    
}  


