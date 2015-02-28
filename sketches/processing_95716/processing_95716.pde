
int hp=60;
int x=100;
int y=140;
void setup(){
  size (400,250);
  smooth();
}
void draw() {
  background(#FFDED1);
  noStroke();
  //eye left
  fill(250);
  ellipse (100,150,150,120);
  fill(#1980B2);
  ellipse (x,y,90,90);
  fill(29,161,224,179);
  ellipse(x,y,70,70);
  fill(164,216,109,127);
  //ellipse(100,140,50,50);
  fill(#030303);
  ellipse(x,y,40,40);
  
  //eyeright
  fill(250);
  ellipse (300,150,150,120);
  fill(#1980B2);
  ellipse (x+200,y,90,90);
  fill(29,161,224,179);
  ellipse(x+200,y,70,70);
  fill(164,216,109,127);
  //ellipse(100,140,50,50);
  fill(#030303);
  ellipse(x+200,y,40,40);
  
  
  //blinking
  fill(#FFDED1);
  rect(0,0,400,hp);
  if ((mousePressed==true)&&(hp<220)){
    hp=hp+5;
  }
  else if (hp>210){
    hp=60;
  }
  

  
}
  


