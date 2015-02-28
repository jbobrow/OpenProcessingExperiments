
void setup(){
  size(500,500);
  background(220);
}

void draw(){

noStroke();
rectMode(CORNER);  // Default rectMode is CORNER
fill(255,mouseX,mouseY);
rect(40,50,260,260);
rect(475,375,25,125);
fill(mouseX,255,mouseY);
rect(300,50,175,130);
rect(300,0,175,50);
rect(0,375,40,125);
fill(0);
rect(40,310,130,130);
rect(170,440,130,35);
fill(mouseX,mouseY,255);
rect(300,375,175,100);


stroke(0);
strokeWeight(6);
strokeCap(SQUARE);
line(10,50,475,50);
line(40,50,40,490);
line(475,15,475,485);
line(300,10,300,475);
line(40,310,475,310);
line(40,440,300,440);
line(10,375,500,375);
line(10,180,40,180);
line(300,180,475,180);
line(170,310,170,490);
line(170,475,475,475);
line(388,180,388,310);


}



