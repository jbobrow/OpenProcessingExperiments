
public class Button {
  int x, y;
  int size;
  color baseGray;
  color overGray;
  color pressGray;
  boolean over = false;
  boolean pressed = false;
  boolean released = false;
  PImage baseImage;
  PImage pressImage;
  int id;

  Button(int xp, int yp, int s, color b, color o, color p,PImage bi, PImage pi,int ident) {
    x = xp;
    y = yp;
    size = s;
    id = ident;
    baseGray = b;
    overGray = o;
    pressGray = p;
    baseImage = bi;
    pressImage = pi;
  }

  void mouseEvent(MouseEvent event){
    if ((mouseX >= x) && (mouseX <= x+size) && (mouseY >= y) && (mouseY <= y+size)) {  
      over = true;
      overButton = this;
      switch(event.getID()){
      case MouseEvent.MOUSE_PRESSED:
        pressed = true;
        clickedButton = this;
        break;
      case MouseEvent.MOUSE_RELEASED:
        released = true;
        pressed = false;
        releasedButton = this;
        break;
      }
    } 
    else {
      over = false;
      pressed = false;
      released = false;
    }
  }


  void draw() {
     fill(baseGray);
    stroke(255);      
    if (pressed != true) {  
      rect(x, y, size, size);
       image(baseImage,x,y);
    }
    else {
      rect(x, y, size, size); 
      image(pressImage,x,y);
    
    }




  }


}




