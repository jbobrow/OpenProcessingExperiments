

float x1 = 25;
float x2 = 25;
float y1 = 25;
float y2 = 25;
PImage palette;
color currentColor;
float r = 0;
float s = 1.0;


void setup() {
  size(500, 500);
strokeWeight(0.5);
  smooth();
 
    palette = requestImage("Damnwheel.jpg");
  
}
 
void draw() {
   if (palette.width > 0){
    image(palette, 0, 0, 200, 180);
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT){
  
  
  fill(red(currentColor), green(currentColor), blue(currentColor));

  
  pushMatrix();


translate(mouseX, mouseY);

rotate(r);
scale(s);

triangle(0, 0, x1, -y1, -x2, -y2);




popMatrix();

    }

if (mouseButton == RIGHT){
    currentColor = get(mouseX, mouseY);
    }
}

}



void keyPressed(){
  if (key == CODED)
 {
   if (keyCode == RIGHT)
   {
     r = r + radians(3);
   }
   
   if (keyCode == LEFT)
   {
     r = r - radians(3);
   }
  if (keyCode == UP)
 {
   s = s + 0.15;
 }
 if (keyCode == DOWN)
 {
   s = s - 0.15;
 }
 }
}
 


