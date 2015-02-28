
PImage p;
float seeX;
float seeY;
boolean whether;
void setup(){
  p=loadImage("paint.jpg");
  size(800,400);
  smooth();
  textAlign(CENTER, CENTER);
}
void draw(){
  if(mouseX>470 && mouseX<580 && mouseY>330 && mouseY<height){
  whether=true;
  }
  //inside the area, set it as yes
  
  if(mouseX<470|| mouseX>580 || mouseY<330 || mouseY>height){
  whether= false;
  }
  //question, why it dosent work when i use else{whether=false} 
  
  image(p,0,0);
  //load image
  
  fill(0,80);
  seeX=mouseX;
  seeY=mouseY;
  stroke(255,255,0);
  strokeWeight(3);
  line(seeX+11,seeY+11,seeX+20,seeY+20);
  ellipse(seeX,seeY,30,30);
  //draw magnifier
  
  if(whether== true){
  fill(255,255,0,50);
  rect(0,0,width,height);
  fill(255,255,0);
  ellipse(width/2,height/2,170,170);
  fill(0);
  textSize(30);
  text("You Got It!",width/2,height/2);
  }
  //find it
  
  if(mouseX<470|| mouseX>580 || mouseY<330 || mouseY>height){
  textSize(19);
  fill(255,255,0);
  arc(width/2,0,170,170,0,PI);
  fill(0);
  text("Find the Glasses",width/2,20);
  //not find
  }
}


