
// The catcher will follow your mouse and attempt to wither catch or dodge the falling objects
class Catcher{
  float x;// x position of the cathcer
  float y;// y position of the cathcer
  float w;// width of the cathcer
  float h;// height of the cathcer
  color c;// color of the catcher
  
  Catcher( float wid, float hei,  color col){// constructor
    w = wid;
    h = hei;
    c = col;
  }
  
  
  void display(){ // This method needs 4 if statements to be added
    fill(c);
    rect(mouseX,mouseY,w,h);
    
    if(mouseX < w/2){ // if the catcher is at the left edge of the screen, don't let it go out of the screen
      rect(w/2,mouseY,w,h);
    }
    if(mouseX > width-w/2){ // if the catcher is at the right edge of the screen, don't let it go out of the screen
      rect(width-w/2,mouseY,w,h);
    }
    if(mouseY < h/2){ // if the catcher is at the top edge of the screen, don't let it go out of the screen
    
    }
    if(mouseY > height - h/2){ // if the catcher is at the bottom edge of the screen, don't let it go out of the screen
     
    }
    if(mouseX < w/2&& mouseY < h/2){ // if the cathcer is in the top left corner of the screen, don't let it go out of the screen
      rect(w/2,h/2,w,h);
    }
    if(mouseX < w/2 && mouseY > height - h/2){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
      rect(w/2,height-h/2,w,h);
    }
    if(mouseX > width - w/2 && mouseY < h/2){ // if the catcher is at the top left corner of the screen, don't let it go out of the screen

    }
    if(mouseX > width - w/2 && mouseY > height - h/2){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
    
    }
  }    
  
  
    
}

