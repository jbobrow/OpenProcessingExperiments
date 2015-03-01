
PImage logo00;

boolean over;
boolean forward;
boolean backward;
boolean fuckward;

 // String url = "http://i1310.photobucket.com/albums/s660/Mehmet_Erk/LOGO01lines_zps45df3325.png"; //declaring URL image

void setup() {
  size(389, 196);
  background(0);
  frameRate(25);
  smooth();
  logo00 = loadImage("LOWLOGO.png");
  //  String url = "http://i1310.photobucket.com/albums/s660/Mehmet_Erk/LOGO01lines_zps45df3325.png"; //declaring URL image

  //  logo00 = loadImage(url, "png");


  Lines = new LOGO(color(255, 255, 255), 0, 0, 0); // Parameters go inside the parentheses when the object is constructed.
}
void draw() {
 fill(0,0,0,50);
  rect(0,0,width,height);
  noFill();
  Lines.move();
 // Lines.display();
    tint(c);
    image(logo00, xpos, ypos);
  if (mouseX>20 && mouseX<width-20 && mouseY>20 && mouseY<height-20) {
    over=true;
  }
  else {
    over=false;
  }
}

LOGO Lines;
//LOGO myCar2; // Two objects!
  color c;
  float xpos;
  float ypos;
  float xspeed;

class LOGO { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?


  LOGO(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {

 
  }

  void move() {
    println(xpos);
    // xpos = xpos + xspeed;
    if (over==true) {
      c = color(random(100,255), random(100,255),random(100,255));
      xspeed=random(-2, 4);
      // xpos= xpos+random(xspeed-2, xspeed+2);
      // ypos=ypos+random(xspeed-2, xspeed+2);
      if (forward==false) {
        xpos= xpos+xspeed;
        ypos=ypos+xspeed;
        if (xpos>10) {
          forward=true;
        }
      }
      if (forward==true) {
        xpos=xpos-xspeed;
        //  ypos=ypos+xspeed;
        if (xpos<0) {
          backward=true;
        }
      }
      if (backward==true) {
        //  xpos= xpos-xspeed;
        ypos=ypos-xspeed;
        if (xpos<-10) {
          fuckward=true;
          // backward=false;
        }
      }
      if (fuckward==true) {
        xpos= xpos+xspeed;
        ypos=ypos-xspeed;
        if (ypos<0) {
          forward=false;
          backward=false;
          fuckward=false;
        }
      }
    }

    if (over==false) {

      xpos=0;
      ypos=0;
    }
  }//end of move
}



