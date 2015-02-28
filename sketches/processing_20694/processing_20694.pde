
float x,y;
float easing=0.5;

void setup() {
  size(600,600);
  background(255);
  smooth();
  //fill(255,120);
}
void draw() {
  float r = random(10,40);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX-x)*easing;
  y += (targetY-y)*easing;
  frameRate(10);
  
  noStroke();
  fill(random(100,150),random(100),random(150),100);
  ellipse(x,y,r,r);

if(keyPressed){
    if (key == 's'){
    fill(random(140,255),random(150),random(0,42),100);
    ellipse(x,y,r,r);
    noStroke();
    ellipse(x+20,y-20,r-10,r-10);
    ellipse(x+25,y+25,9,9);
    ellipse(x-15,y-5,7,7);
    ellipse(x+15,y,15,15);
    ellipse(x,y+25,5,5);
    ellipse(x+30,y+30,9,9);
    ellipse(x,y+40,7,7);
    fill(random(100),random(100),random(100),100);
    ellipse(x+40,y-40,20,20);
 

}
}
}

