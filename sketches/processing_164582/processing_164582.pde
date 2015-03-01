
PImage img1, img2;
void setup() {
  frameRate(24);
  size(1300,700);
  // Images must be in the "data" directory to load correctly
  img1 = loadImage("sea1.jpg");
  img2 = loadImage("sea2.jpg");

  image(img1, 0, 0);
  fill(0);
  textSize(14);
  text("Press q, place mouse on which animal you want to focus on",490,60);
 
  
}

void draw() {


if (key == 'q'|| key == 'Q'){
  focus();
}
if (key == 'w'|| key =='W' ){
  colors();
}
if (key == 'r'|| key == 'R'){
  rec();
}
  if(mousePressed){
  circle();
  }
  if(key=='e'||key=='E'){
    clears();
  }
}



  
  
  void focus(){
   background(255); 
  float x = mouseX;
  float y = mouseY;
  float d = dist (375,450, mouseX, mouseY);
  pictureone();
  picturetwo();
  textSize(14);
  text("Press q, place mouse on which animal you want to focus on",490,60);
  println(d);
  if(d<=100){
    pictureone();
    textSize(14);
    text("Press q, place mouse on which animal you want to focus on",490,60);
  }
  float c = dist(1000,150, mouseX, mouseY);
  println(d);
  if(c<=100){
    picturetwo();
    textSize(14);
     text("Press q, place mouse on which animal you want to focus on",490,60);
  }
  
  
  
}

void picturetwo(){
  image(img2, 0, 0);
  }
  
void pictureone(){
  image(img1, 0, 0);

}
void colors(){
  background(4,4,4);
  noStroke();
fill(#58C1AF);
rect(400,200,100,100);
rect(400,400,100,100);
fill(#F08827);
ellipse(800,250,100,100);
ellipse(800,455,100,100);

}
void rec (){
  noFill();
  strokeWeight(1);
  stroke(#AA590C);
  float i=0;
  while (i<800){
  rect(0, 900, 100+i*2, 100-i*4);
  i=i+5;
}
}
void circle(){
  strokeWeight(1);
  stroke(#49897D);
  float a=0;
  while (a<1800){
  ellipse(650,0,100+a*2,100-a*4);
  a=a+9;
  }
}
void clears(){
  size(1300,700);
colorMode(HSB);
background(#272B34);
noFill();
stroke(255,100);
float i=0;
while(i<180){
  ellipse(width/2, height/2, 100+i*2, 100-i*4);
  i=i+3.2;
}
fill(255);
textSize(18);
  text("Press r then click screen.",950,60); 
  text("Press e to reset.",950,110); 

}





