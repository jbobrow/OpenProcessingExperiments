




int y = 100;
int z = 100;
 
void setup() {
  size(800,800); 
  background(255);
  smooth();
   println( "Drag the mouse around. Then click and drag the mouse.");
}
 
 
void draw() {
     
  fill(255,255,255,1);
rect(0 ,0, 800 ,800);

  y = int(random(0,200));
  z = int(random(0,200));
   
 noStroke();
fill(225, 0, 0, 10); //make circle red and transparent
ellipse(mouseX, mouseY, y, z);
fill( random(3, 155), random(10, 255), random(200, 100) );
ellipse(mouseX, mouseY, 10, 10);
noFill();
strokeWeight(1);
stroke( random(255, 200), random(100, 200), random(100, 200));
ellipse(mouseX, mouseY, y, z);
 

}

void mouseDragged()
{
 
  fill(random(3, 155), random(10, 255), random(200, 100));
rect(0 ,0, 800 ,800);
  fill(255);
  ellipse(mouseX, mouseY, y, z);


}
//println( "Drag the mouse around. Then click and drag the mouse.");



