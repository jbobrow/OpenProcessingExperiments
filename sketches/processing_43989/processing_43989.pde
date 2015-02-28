
PImage scene;

void setup(){
  size(300,600);
  smooth();
  scene = loadImage("scene.JPG");
  image(scene,0,0,300,600);
  fill(255,5);
  noStroke();
  for(int x=0; x<100; x+=5) {
  ellipse(200,100,x+20,x+20);
  ellipse(200,100,x+40,x+40);
  ellipse(200,100,x+60,x+60);
  ellipse(200,100,x+20,x-20);
  ellipse(200,100,x,x);
  ellipse(200,100,x-40,x-40);
  ellipse(200,100,x-60,x-60);
  ellipse(200,100,x-80,x-80);
  ellipse(200,100,x-100,x-100);
  ellipse(200,100,x-120,x-120);
  ellipse(200,100,x-140,x-140);
  ellipse(200,100,x-160,x-160);
  ellipse(200,100,x-180,x-180);
  ellipse(200,100,x-200,x-200);
  ellipse(200,100,x-220,x-220);
  ellipse(200,100,x-240,x-240);
  }
  fill(255,50);
  ellipse(150,350,60,60);
  ellipse(100,300,70,70);  
  ellipse(80,350,80,80);
  fill(200,200,255,120);
  stroke(200,200,255,200);
  ellipse(200,150,60,60);
  ellipse(55,450,20,20);
  fill(255,200,200,70);
  stroke(255,200,200,200);
  strokeWeight(3);
  ellipse(170,200,100,100);
  ellipse(80,400,30,30);
  fill(255,255,200,70);
  stroke(255,255,200,200);
  ellipse(170,200,230,230);
  ellipse(120,310,50,50);
}

void draw() { 
}

