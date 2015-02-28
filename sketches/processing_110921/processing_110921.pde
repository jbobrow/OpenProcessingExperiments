
boolean mouseIsDown = false;
 
void setup() {
size(500, 500);
background(0, 0, 50);

}
 
void draw() {

print(mouseIsDown);

stroke(0, 0, 0);
line(mouseX, height-mouseY, 250, 250);
noStroke();

float bingo = round(random(1,60));
 println(bingo);
 
  if(bingo >>2)
  
  {
fill(100, 255, 150, 2);
    ellipse(250, 250, 250, 250);
    
    fill(100, 200, 0, 100);
     text( "" + char( int( random(33,126) ) ), random(width), random(height) );
    
  }
}
