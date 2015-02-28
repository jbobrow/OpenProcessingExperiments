
PImage myCow;
PImage myRoad;
PImage view;
PImage heli;

void setup(){
  size (900,450);
  myCow=loadImage("Cow_female_black_white.jpg");
  myRoad = loadImage("transp.gif");
  view=loadImage("vieww.jpg");
  heli =loadImage("helicopter.jpg");
}

void draw(){
  background(0,0,0);
  tint(100,170,100,60);
  image(view,mouseX,mouseY,350,250);
  tint(10330,23,23,60);
  image(view,900-mouseX,mouseY-100,250,190);
  
  
     tint (101,125,178,35);
  image(myRoad, 40,10, 900,450);}
  

  
  
 


