
// The catcher will follow your mouse and attempt to wither catch or dodge the falling objects
class Catcher{
  float x;// x position of the cathcer
  float y;// y position of the cathcer
  int w;// width of the cathcer
  int h;// height of the cathcer
  String catcherName;// stringName of the catcher
  PImage catchImage;
  
  Catcher( int wid, int hei, String catc){// constructor
  catcherName = catc;
  catchImage = loadImage(catc);
    w = wid;
    h = hei;
   
    catchImage.resize(w,h);
  }
  
  
  void display(){ // This method needs 4 if statements to be added
    
   image(catchImage, mouseX, mouseY);
    
    if(mouseX < 0){ // if the catcher is at the left edge of the screen, don't let it go out of the screen
      image(catchImage,0,mouseY);
    }
    if(mouseX > width-w){ // if the catcher is at the right edge of the screen, don't let it go out of the screen
      image(catchImage,width-w,mouseY);
    }
    if(mouseY < 0){ // if the catcher is at the top edge of the screen, don't let it go out of the screen
     image(catchImage,mouseX,0);
    }
    if(mouseY > height-h){ // if the catcher is at the bottom edge of the screen, don't let it go out of the screen
       image(catchImage,mouseX,height-h );
    }
    if(mouseX < 0&& mouseY < 0){ // if the cathcer is in the top left corner of the screen, don't let it go out of the screen
      image(catchImage,0,0);
    }
    if(mouseX < 0 && mouseY > height - h){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
      image(catchImage,0,height-h);
    }
    if(mouseX > width - w && mouseY < 0){ // if the catcher is at the top left corner of the screen, don't let it go out of the screen
        image(catchImage,width - w,0);
    }
    if(mouseX > width - w && mouseY > height - h){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
       image(catchImage,width - w,height - h);
    }
  }  
