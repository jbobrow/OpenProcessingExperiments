
//atan2
float xpos, ypos;
PImage bkgd;
PShape icon;
PShape type;

void setup(){
size (960 ,540);
bkgd = loadImage ("bkgd.jpg");
icon = loadShape ("LOGO2FULL.svg");
type = loadShape ("type.svg");

xpos = width/2;
ypos = height/2;
smooth();
rectMode(CENTER);
}
void draw(){
  background(0);
 image(bkgd, 0, 0, width, height);
 shapeMode(CENTER);
 shape(type, width/2, height/2, 960,540);
  
  for(int i =0; i<=width; i+=96){
    for(int j=0; j<=height; j+= 54){
 
      pushMatrix();
  float angle = atan2(mouseY-j,mouseX-i); //y, x
 // float ang = map (angle+(PI/2), 0, 360, 200,400);
 float mapperx = map(mouseX,0, width,350,750);
 float mappery = map(mouseY, 0, height, 150, 370);
 float scaler = map(mappery,150,370, 1,.2);
  
translate(i, j);
  rotate(angle+(PI/2));
  scale(scaler);
  shape(icon,0, 0, 200, 200);
  popMatrix();
  
  noCursor();
  
}
  }
}

//push and popMatrix: isolates every transformation, if you turn it off the translate and rotates stack up

