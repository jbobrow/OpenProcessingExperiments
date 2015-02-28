
float y;
float h1;
float h2;
float h3;
float h4;



void setup(){
  size(800,600);
  background(0);
  smooth();
  colorMode(HSB,100);
  frameRate(15);
}
void draw(){
  noCursor();
  y = random(40,400);
  h1 = random(0,800);
  h2 = random(0,600);
  h3 = random(0,800);
  h4 = random(0,600);
  if (mousePressed == true){
    noStroke();
    fill(mouseX/8,100,100,mouseY/-6 + 100);
    ellipse(mouseX,mouseY,y,y);
    noStroke();
    fill(100,0,100,mouseY/-6 + 100);
    ellipse(mouseX,mouseY,y/1.428,y/1.428);
    noStroke();
    fill(0);
    ellipse(mouseX,mouseY,y/2,y/2);
    noStroke();
    fill(mouseX/8,100,100,mouseY/-6 + 100);
    rect(h1,h2,h3,h4);
  }
fill(0,25);
rect(0,0,width,height);
}

   


