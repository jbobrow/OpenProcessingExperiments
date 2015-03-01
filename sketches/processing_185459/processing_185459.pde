
void setup(){
  size(200, 300);

}

void draw(){
  background(156, 217, 255);
  
  //argument for following mouse
drawbee (mouseX, mouseY);

//argument for being in center
drawbee (100, 100);

//argument for placing randomly
drawbee (random(width), random(height));
frameRate(15);
}

void drawbee(float x, float y){
//bottom black stripe
fill(0);
noStroke();
arc(x, y, 24, 24, PI+QUARTER_PI, TWO_PI+QUARTER_PI);
 
//bottom yellow stripe
fill(255, 288, 0);
noStroke();
arc(x, y, 24, 24, QUARTER_PI, PI+QUARTER_PI);
 
//top black stripe
fill(0);
noStroke();
arc(x+12, y-13, 24, 24, QUARTER_PI, PI+QUARTER_PI);
 
//top yellow stripe
fill(255, 288, 0);
noStroke();
arc(x+12, y-13, 24, 24, PI+QUARTER_PI, TWO_PI+QUARTER_PI);
 
//head
fill(0);
noStroke();
ellipse(x+20, y-21, 16, 16);
 
//antenna
strokeWeight(1);
stroke(0);
line(x+20, y-21, x+20, y-37);
line(x+20, y-21, x+36, y-21);
 
//antenna dots
fill(0);
noStroke();
ellipse(x+20, y-37, 3, 3);
ellipse(x+36, y-21, 3, 3);
 
//wings
fill(255);
noStroke();
bezier(x, y-10, x-40, y-30, x, y-55, x, y-10);
bezier(x+12, y, x+60, y+15, x+20, y+40, x+12, y);

}



