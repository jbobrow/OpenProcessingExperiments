
PShape pattern;
PShape pattern2;
float strkWdth=0;

void setup(){
  smooth();
  size(360,360);
  pattern = loadShape("pattern.svg");
  pattern2 =loadShape("pattern2.svg");
  background(25,25,100);
}

void draw(){
  
  drawShape1(0,0);     drawShape2(30,5);    drawShape3(90,55);      
  drawShape1(120,0);   drawShape2(150,5);   drawShape3(210,55); 
  drawShape1(240,0);   drawShape2(270,5); 
  drawShape1(0,120);   drawShape2(30,125);  drawShape3(90,175);
  drawShape1(120,120); drawShape2(150,125); drawShape3(210,175);
  drawShape1(240,120); drawShape2(270,125); 
  drawShape1(0,240);   drawShape2(30,245);  drawShape3(90,295);
  drawShape1(120,240); drawShape2(150,245); drawShape3(210,295);
  drawShape1(240,240); drawShape2(270,245); 
  
}

void drawShape1(float xpos,float ypos){
  shape(pattern,xpos,ypos,120,120);
  pattern.disableStyle();
  noFill();
  stroke(mouseX,mouseY,-mouseX);
  strokeWeight(strkWdth);
  if(mousePressed){strkWdth=strkWdth+.05;}else{strkWdth=.5;}
  xpos=0;
  ypos=0;
}

void drawShape2(float xpos,float ypos){
  shape(pattern,xpos,ypos,60,60);
  pattern.disableStyle();
  noFill();
  stroke(mouseX,mouseY,-mouseX);
  strokeWeight(strkWdth);
  if(mousePressed){strkWdth=strkWdth+.0005;}else{strkWdth=.5;}
  xpos=0;
  ypos=0;
}

void drawShape3(float xpos,float ypos){
  shape(pattern2,xpos,ypos,60,60);
  pattern2.disableStyle();
  noFill();
  stroke(mouseX,mouseY,-mouseX);
  strokeWeight(strkWdth);
  if(mousePressed){strkWdth=strkWdth+.0005;}else{strkWdth=.05;}
  xpos=0;
  ypos=0;
}


