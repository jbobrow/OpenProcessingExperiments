
void setup() {
  size(600, 600);
  smooth();

  
bg();
}

void bg(){
  background(0);
  PImage b;
  b = loadImage("Texture6.jpg");
  tint(80,50);
  image(b, 0, 0);
  
  
  PFont font;
  font = loadFont("ArialNarrow-16.vlw"); 
  textFont(font); 
  fill(50);
  text("Press DEL to Clear All", 460, 590);
}
void draw() {
  PImage cur;
  cur = loadImage("greyBrush.png");
  cursor(cur, 0, 0);
  
  if (mousePressed && (mouseButton == LEFT)) {
    int r = int(random(0, 255));
    int g = int(random(0, 255));
    int b = int(random(0, 255));
    int alphaVal = int(random(0, 100));
    noStroke();
    fill(r,g,b,alphaVal);
    
      int rad = int(random(0, 200));
      ellipse(mouseX, mouseY, rad, rad);
      delay(30);
  } 
  
  else if (keyPressed){
    if (key == DELETE) {
  bg();}
 }
  
  else {
    noStroke();
    noFill();
  }
  

  

}

