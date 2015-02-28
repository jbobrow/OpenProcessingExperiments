
float y=50.0;
float speed = 3.0;
float radius = 10.0;
float radius2 = 5.0;
float radius3 = 2.0;
int direction=1;

void setup(){
size(250,250);
smooth();
noStroke();
ellipseMode(RADIUS);


}

void draw(){
  
  stroke(255);
line (20,0,20,250);
line (30,0,30,250);
line (40,0,40,250);

line (0,20,250,20);
line (0,30,250,30);
line (0,40,250,40);//lines
  
  noStroke();
fill(255,209,209,40);
rect(0,0,width,height);
fill(255);
y+=speed*direction;
ellipse(100,y,radius, radius);
fill(91,139,84);
ellipse(125,y,radius3, radius3);
fill(139,84,85);
ellipse(150,y,radius2, radius2);
fill(139,84,85);
ellipse(75,y,radius2, radius2);
fill(91,139,84);
ellipse(50,y,radius3, radius3);
fill(255);
ellipse(50,y,radius3, radius3);
fill(91,139,84);
ellipse(25,y,radius, radius);
fill(91,139,84);
ellipse(175,y,radius3, radius3);
fill(255);
ellipse(175,y,radius ,radius);// first set of circles

ellipse(y,100,radius, radius);
fill(139,84,85);
ellipse(y,125,radius3, radius3);
fill(91,139,84);
ellipse(y,150,radius2, radius2);
fill(139,84,85);
ellipse(y,75,radius2, radius2);
fill(255);
ellipse(y,50,radius3, radius3);
fill(91,139,84);
ellipse(y,50,radius3, radius3);
fill(91,139,84);
ellipse(y,25,radius, radius);
fill(255);
ellipse(y,175,radius3, radius3);
fill(139,84,85);
ellipse(y,175,radius ,radius);//second set of circles (sideways)

if((y>height-radius) ||(y<radius)) {
direction = -direction;
 if (mousePressed == true) {
    fill(255);
  } else {
    fill(255,209,209,40);
  }
  rect(0,0,width,height);//causes the screen to flash white
}
}

