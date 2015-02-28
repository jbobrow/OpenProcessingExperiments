
import processing.video.*;

Capture cam;

void setup() 
{ size(800,800);
background(255); 
smooth();
  cam = new Capture(this, width,height);
  cam.start();     

}


void draw()
{
 
noStroke();
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
    int loc = mouseX + mouseY*cam.width;
    color c = cam.pixels[loc];
    fill(c,170);
  }
int a =abs(pmouseY-mouseY);


    
    ellipse(pmouseX, pmouseY, a, a);
    ellipse(pmouseY,pmouseX,a,a);
    ellipse(800-pmouseY,pmouseX,a,a);
    ellipse(800-pmouseX,pmouseY,a,a);
    ellipse(pmouseX,800-pmouseY,a,a);
    ellipse(pmouseY,800-pmouseX,a,a);
    ellipse(pmouseY+800-2*pmouseY,pmouseX+800-2*pmouseX,a,a);
    ellipse(pmouseX+800-2*pmouseX,pmouseY+800-2*pmouseY,a,a);
    
}
 

void keyPressed() { 
  if ( key == 's' ) {
  int ms = millis() % 1000;
    int h = hour(); //時
    int m = minute(); //分
    int s = second(); //秒
     save("kaleidoscope" + h + m + s + ms + ".jpg");
  }
    if ( key == ' ' ) {

background(255);
    }

}








