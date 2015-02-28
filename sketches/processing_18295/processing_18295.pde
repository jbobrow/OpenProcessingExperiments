
class Button
{
  int x, y;
  int w, h,alfa;

 /// color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   


  /* 
   void mousePressed() {
   if (over) { 
   pressed = true;
   link("http://www.processing.org");
   } else {
   pressed = false;
   }}
   */

  void pressed() {
    if(over  && mousePressed) {
      pressed = true;
     // alfa = 222; 


    } 
    else {
      pressed = false;
      alfa = 50;
    }
  }

//overRect(x, y, w, h)
  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class ImageButtons extends Button 
{
  PImage base;
  //  PImage roll;
  // PImage down;
  color currentimage;
  //  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;


   // currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if(pressed) {
     // currentimage = down;


      ///link ("http://www.google.com.pe" );
    } 
    else if (over) {
     // currentimage = roll;
      alfa = 252; 
      //alfa = alfa +1;     
    } 
    else {
      //currentimage = base;
       alfa = 150; 
      // alfa = alfa-1;
    }
  }



  void move (float posX, float posY, float damping) {

    float dif = y - posY;
    if (abs(dif) > 1) {
      y -= (dif/damping)*2;
    }
    dif = x - posX;
    if (abs(dif) > 1) {
      x -= (dif/damping)*2;
    }
    
     
  }


  void over() 
  {
    if( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display(int tamX, int tamY) 
  {
    int tamFotoX = tamX;
    int tamFotoY = tamY;

    tint (255,alfa);
    image(base, x, y,tamFotoX, tamFotoY);
        
   
  }
}



