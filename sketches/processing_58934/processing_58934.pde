

  
float xc,yc;
color Pcolor;


  
void setup(){
  size(700,500, P3D);
  PImage b;
b = loadImage("word5.jpg");

}
void draw(){
  translate(width/2,height/2);
  rotateX(mouseY/30.0);
  rotateY(mouseX/30.0);
  translate(-width/2, -height/2);
 
  xc = map (noise(frameCount/10.0),0,1,0,width/4);
  yc = map (noise(frameCount/10.0),0,1,0,height/4);
   
  Pcolor=color (random(0,255),random(0,255),random(0,255),random(0,200));
   
  pushMatrix();
  translate(xc,yc);
  fill(Pcolor);
  frameRate(30.0);
  rectMode(CENTER);
  stroke(255);
  box(xc,yc,random(0,50));
  popMatrix();
  stroke(255);

 PImage b;
b = loadImage("word5.jpg");
background(30,40);

color from = color(204, 102, 0);
color to = color(0, 102, 153);
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);
fill(from);
rect(10, 20, 20, 60);
fill(interA);
rect(30, 20, 20, 60);
fill(interB);
rect(50, 20, 20, 60);
fill(to);
rect(70, 20, 20, 60);
stroke(255);

 PImage bc;
b = loadImage("word5.jpg");


  translate(width/2,height/2);
  rotateX(mouseY/30.0);
  rotateY(mouseX/30.0);
  translate(-width/2, -height/2);
 
  xc = map (noise(frameCount/10.0),0,1,0,width/4);
  yc = map (noise(frameCount/10.0),0,1,0,height/4);
   
  Pcolor=color (random(0,255),random(0,255),random(0,255),random(0,200));
   
  pushMatrix();
  translate(xc,yc);
  fill(Pcolor);
  frameRate(30.0);
  rectMode(CENTER);
  stroke(255);
  box(xc,yc,random(0,50));
  popMatrix();
  stroke(255);
  
 
  fill(mouseX, 20, pmouseX, 80);
color interAb = lerpColor(from, to, .33);
color interBc = lerpColor(from, to, .66);
fill(from);
rect(10, 200, 230, 160);
fill(interA);
rect(30, 20, 20, 60);
fill(interB);
rect(50, 620, 20, 600);
fill(to);
rect(70, 20, 20, 60);
translate(width/2,height/2);
  rotateX(mouseY/30.0);
  rotateY(mouseX/30.0);
  translate(-width/2, -height/2);
 
  xc = map (noise(frameCount/10.0),0,1,0,width/4);
  yc = map (noise(frameCount/10.0),0,1,0,height/4);
   
  Pcolor=color (random(0,255),random(0,255),random(0,255),random(0,200));
   
  pushMatrix();
  translate(xc,yc);
  fill(Pcolor);
  frameRate(30.0);
  rectMode(CENTER);
  stroke(255);
  box(xc,yc,random(0,50));
  popMatrix();
  stroke(255);


color interAd = lerpColor(from, to, .33);
color interBf = lerpColor(from, to, .66);
fill(from);
rect(10, 20, 20, 60);
fill(interA);
rect(30, 20, 20, 60);
fill(interB);
rect(50, 20, 20, 60);
fill(to);
rect(70, 20, 20, 60);
stroke(255);

  translate(width/2,height/2);
  rotateX(mouseY/30.0);
  rotateY(mouseX/30.0);
  translate(-width/2, -height/2);
 
  xc = map (noise(frameCount/10.0),0,1,0,width/4);
  yc = map (noise(frameCount/10.0),0,1,0,height/4);
   
  Pcolor=color (random(0,255),random(0,255),random(0,255),random(0,200));
   
  pushMatrix();
  translate(xc,yc);
  fill(Pcolor);
  frameRate(30.0);
  rectMode(CENTER);
  stroke(255);
  box(xc,yc,random(0,50));
  popMatrix();
  stroke(255);
  

  fill(mouseX, 20, pmouseX, 80);
color interAbf = lerpColor(from, to, .33);
color interBcu = lerpColor(from, to, .66);
fill(from);
rect(10, 200, 230, 160);
fill(interA);
rect(30, 20, 20, 60);
fill(interB);
rect(50, 620, 20, 600);
fill(to);
rect(70, 20, 20, 60);
  size(700,500, P3D);
 

}


