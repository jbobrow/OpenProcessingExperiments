
PImage img; PImage heat; 
 
void setup(){
  size(500,375);
  smooth();
  img = loadImage("5bake.jpg");
  heat = loadImage("heat.png");

  background(img);

}

void draw(){
  frameRate(5);
  smooth();
  stroke(random(100,255),0,0,random(200));
  noFill();
  imageMode(CENTER);
  if (mousePressed == false){
    
    image(heat,mouseX+random(50), mouseY+random(50));

}
}

