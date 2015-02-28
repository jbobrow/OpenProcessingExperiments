
class GUI {

  final boolean ON = true;
  final boolean OFF= false;
  ArrayList<Button> buttons;
  ArrayList<Switch> switches;
  boolean mouseLocked = false;

  GUI() {
    buttons  = new ArrayList();
    switches = new ArrayList();
  }

  Button addButton(String text, int x, int y, int w, int h) {
    buttons.add(new Button(text, x, y, w, h));
    return buttons.get(buttons.size()-1);
  }

  void removeButton(Button button) {
    button.pressed=false;
    button.hover=false;
    for (int i=buttons.size()-1; i>=0; i--) {
      if (buttons.get(i) == button) {
        buttons.remove(i);
      }
    }
  }

  Switch addSwitch(String text, int x, int y, int w, int h) {
    switches.add(new Switch(text, x, y, w, h));
    return switches.get(switches.size()-1);
  }

  void removeSwitch(Switch swtch) {
    swtch.pressed=false;
    swtch.hover=false;
    for (int i=switches.size()-1; i>=0; i--) {
      if (switches.get(i) == swtch) {
        switches.remove(i);
      }
    }
  }


  void run() {
    //first we run for all buttons
    for (int i=0; i<buttons.size(); i++) {
      Button b = buttons.get(i);      //get a current button

      if (b.clicked) {                //click takes only one frame, so if the button was clicked
        b.clicked = false;            //now we have to unclick it
      }

      //If mouse is not locked on other place and we are inside of the button... 
      if (!mouseLocked && mouseX>b.x && mouseY>b.y && mouseX<b.x+b.w && mouseY<b.y+b.h) {
        b.hover=true;                 //...then we hover the button...
        if (mousePressed) {           //...and if the mouse is pressed
          b.pressed=true;             //...we have pressed button!
        }
      }
      //Otherwise, if the button have been pressed, but in this frame mouse is not pressed...
      //...and we are inside of the button, we know that the button was clicked
      else if (b.pressed && !mousePressed && mouseX>b.x && mouseY>b.y && mouseX<b.x+b.w && mouseY<b.y+b.h) {
        b.clicked = true;              //so set that!
      }
      //In any other case the button is not under hover.
      else {
        b.hover=false;
      }

      //If mouse is not pressed and neither is button - remove pressed label
      if (!mousePressed) {
        b.pressed=false;
      }
    }
    //first we run for all switches
    for (int i=0; i<switches.size(); i++) {
      Switch s = switches.get(i);      //get a current button
      //If mouse is not locked on other place and we are inside of the button... 
      if (!mouseLocked && mouseX>s.x && mouseY>s.y && mouseX<s.x+s.w && mouseY<s.y+s.h) {
        s.hover=true;                 //...then we hover the button...
        if (mousePressed) {           //...and if the mouse is pressed
          s.pressed=!s.pressed;             //...we have pressed button!
        }
      }
      else {
        s.hover=false;
      }
    }
    
    
    //If mouse is pressed we have to lock. 
    if (mousePressed) {
      mouseLocked = true;
    }
    else if (!mousePressed) {
      mouseLocked = false;
    }
  }

  void draw() {
    for (int i=0; i<buttons.size(); i++) {
      doStyle();
      Button b = buttons.get(i);
      if (b.hover) {
        fill(255);
      }
      if (b.pressed) {
        fill(200);
        stroke(150);
      }
      rect(b.x, b.y, b.w, b.h);
      fill(0);
      text(b.text, b.x+b.w/2, b.y+b.h/2);
      resetStyle();
    }
    for (int i=0; i<switches.size(); i++) {
      doStyle();
      Switch s = switches.get(i);
      if (s.hover) {
        fill(255);
      }
      if (s.pressed) {
        fill(200);
        stroke(150);
      }
      rect(s.x, s.y, s.w, s.h);
      fill(0);
      text(s.text, s.x+s.w/2, s.y+s.h/2);
      resetStyle();
    }
  }

  class Element {
    boolean state;
    int x, y, w, h;
    boolean hover;
  }

  class Switch extends Element {
    String text;
    boolean pressed;
    Switch(String text, int x, int y, int w, int h) {
      println("T:"+text);
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      hover   = false;
      pressed = false;
    }
  }

  class Button extends Element {
    String text;
    boolean pressed;
    boolean clicked;
    Button(String text, int x, int y, int w, int h) {
      println("T:"+text);
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      hover   = false;
      pressed = false;
      clicked = false;
    }
  }

  void doStyle() {
    pushStyle();
    strokeWeight(2);
    stroke(255);
    rectMode(CORNER);
    fill(200);
    textSize(12);
    textAlign(CENTER, CENTER);
  }

  void resetStyle() {
    popStyle();
  }
}


