
PGraphics babyFlies;

void setup(){
 size(1000, 850, P2D);
 babyFlies = createGraphics(1000, 850, P2D);

}

void draw(){
  background(18, 0, 135);
noStroke();

fill(40, 110, 5);
rect(0, 700, 1000, 400);
ellipse(200, 800, 800, 250);
ellipse(700, 800, 900, 250);
fill(250, 250, 200);
ellipse(100, 100, 100, 100);
fill(255, 0, 255);
ellipse(300, 750, 5, 6);
ellipse(320, 780, 5, 6);
fill(242, 255, 0);
ellipse(mouseX, mouseY, 20, 10);
fill(0, 0, 0);
ellipse(mouseX-15, mouseY-5, 30, 20);
fill(100);
strokeWeight(1);
ellipse(mouseX-23, mouseY-10, 20, 20);
fill(255, 255, 255);
stroke(0, 0, 0);
ellipse(mouseX-27, mouseY-12, 5, 5);
ellipse(mouseX-19, mouseY-12, 5, 5);
arc(mouseX-23, mouseY-5, 10, 10, 0, PI);
if(mousePressed){
babyFlies.beginDraw();
babyFlies.noStroke();
babyFlies.fill(242, 255, 0, random(200, 250));
babyFlies.ellipse(mouseX+random(-50, 50), mouseY+random(-50, 10), random(1, 10), random(1, 10));
babyFlies.endDraw();
  }
  image(babyFlies, 0, 0);
}
