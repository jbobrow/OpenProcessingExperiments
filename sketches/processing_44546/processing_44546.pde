
PImage scene;

void setup(){
  size(600,600);
  smooth();
  scene = loadImage("scene.JPG");
  image(scene,0,0,600,600);
  fill(255,5);
  noStroke();
  for(int x=0; x<100; x+=5) {
  ellipse(width-100,100,x+20,x+20);
  ellipse(width-100,100,x+40,x+40);
  ellipse(width-100,100,x+60,x+60);
  ellipse(width-100,100,x+20,x-20);
  ellipse(width-100,100,x,x);
  ellipse(width-100,100,x-40,x-40);
  ellipse(width-100,100,x-60,x-60);
  ellipse(width-100,100,x-80,x-80);
  ellipse(width-100,100,x-100,x-100);
  ellipse(width-100,100,x-120,x-120);
  ellipse(width-100,100,x-140,x-140);
  ellipse(width-100,100,x-160,x-160);
  ellipse(width-100,100,x-180,x-180);
  ellipse(width-100,100,x-200,x-200);
  ellipse(width-100,100,x-220,x-220);
  ellipse(width-100,100,x-240,x-240);
  }
}

void draw() { 
  float d = dist(550, 50, mouseX, mouseY);
  noStroke();
  image(scene,0,0,600,600);
  fill(255,70);
  ellipse(mouseX+(d/5),mouseY-(d/5),60,60);
  ellipse(mouseX+(d/4.5)+40,mouseY-(d/4.5)-40,70,70);  
  ellipse(mouseX+(d/4.5),mouseY-(d/4.5),80,80);
  fill(200,200,255,140);
  stroke(200,200,255,200);
  ellipse(mouseX+(d/3.5),mouseY-(d/3.5),60,60);
  ellipse(mouseX+(d/2.5),mouseY-(d/2.5),20,20);
  fill(255,200,200,90);
  stroke(255,200,200,200);
  strokeWeight(3);
  ellipse(mouseX+(d/6),mouseY-(d/6),100,100);
  ellipse(mouseX+(d/4),mouseY-(d/4),30,30);
  fill(255,255,200,90);
  stroke(255,255,200,200);
  ellipse(mouseX+(d/2),mouseY-(d/2),230,230);
  ellipse(mouseX,mouseY,50,50);
}

