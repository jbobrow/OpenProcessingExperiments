
float rot=0;
float s=10;

void setup(){
  size(1000,1000);
  frameRate(3);
 background (36, 2, 50);
  smooth();
}

void swirl(String c, float x,float y){  
  color from = color(100,102,150); 
  color to = color(25,25,50); 
  fill(lerpColor(from,to,random(0.0,1.0)),random(100,250));  
  rotate(rot);
  textSize(24);
  text(c,x,y);
}

void draw(){
  fill(random(2),200,50);
  translate(560,320);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(154,26,50);
  translate(542,408);
  rotate(rot);
 ellipse(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(103,103,50);
  translate(150,255);
  rotate(rot);
  ellipse(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(158,15,158);
  translate(501,550);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(158,20,40);
  translate(299,150);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(2,220,20);
  translate(234,456);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(58,20,150);
  translate(345,448);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
  resetMatrix();
  fill(8,25,150);
  translate(250,95);
  rotate(rot);
  rect(10+rot,0,s,s);
  rot=rot+0.5;
  
   resetMatrix();
  translate (350,350);
  swirl("You Are Getting Sleepy!",10+rot,10.0);
}
