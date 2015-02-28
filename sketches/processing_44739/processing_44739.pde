
PImage scene;

void setup(){
  size(600,600);
  smooth();
  scene = loadImage("scene.JPG");
  image(scene,0,0,600,600);
  fill(255,5);
  noStroke();
  for(int x=0; x<100; x+=5) {
  ellipse(width-100,100,x+20,x+20); //Creates Blurry Bright Area
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
  float d = dist(450, 150, mouseX, mouseY);  //Tracks distance from mouse location to anchor point
  noStroke();
  image(scene,0,0,600,600);
  fill(255,70);
  ellipse(450-(d/4),150+(d/4),60,60);  //Each ellipse location is being added/subtracted from anchor point by different inverals based on the "dist" from above 
  ellipse(450-(d/4.5)-40,150+(d/4.5)+40,70,70);  
  ellipse(450-(d/4.5),150+(d/4.5),80,80);
  fill(200,200,255,140);
  stroke(200,200,255,200);
  ellipse(450-(d/2.5),150+(d/2.5),60,60);
  ellipse(450-(d/1.65),150+(d/1.65),20,20);
  fill(255,200,200,90);
  stroke(255,200,200,200);
  strokeWeight(3);
  ellipse(450-(d/8),150+(d/8),100,100);
  ellipse(450-(d/2),150+(d/2),30,30);
  fill(255,255,200,90);
  stroke(255,255,200,200);
  ellipse(450,150,230,230);
  ellipse(450-(d/1.5),150+(d/1.5),50,50);
}

