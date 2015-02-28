
//main image
PImage img;


//expanding bubble following mouse
int mysize = 20;
float xpos = 250;
float ypos = 200;
float huePrincipal = random(245);
int one = 0;

void setup() 
{
  size(700, 525);
  img = loadImage("bubbles.jpg");
  noStroke();
  smooth();
  //random bubbles appearing
  colorMode (HSB, 255);
}

void draw()
{
  background(255);
  image(img, 0, 0);

    one ++;
    float centroX = random (10, 200);
    float centroY = random (300, 20);
    ellipse (centroX, centroY, 100, 100);
      if (one == 1000) {
        fill (25, 50);
      }
      if (one == 50) {
        noFill ();
        one= 100;
      }
 
 //rotating 2
    pushMatrix();
    rotate(atan2(mouseY ,mouseX));
    fill(222,90);
    ellipse(200,200, 40, 40);
    popMatrix();
  
    pushMatrix();
    rotate(atan2(mouseX ,mouseY));
    fill(#34FFEC, 60);
    ellipse(200,20, 80,80);
    popMatrix();
    
    fill(222, 60);
    ellipse(xpos,ypos, mysize, mysize);
      xpos = xpos + (mouseX - xpos)/15.0;
      ypos = ypos - (mouseY - ypos)/5.0;
      
    
    fill(222, 60);
    ellipse(xpos,ypos, mysize/2, mysize/2);
      xpos = xpos + (mouseX - xpos)/5.0;
      ypos = ypos + (mouseY - ypos)/5.0;
  }


void mouseMoved(){
  if(mouseX < width/2) {
    mysize = mysize + 6;}
}


