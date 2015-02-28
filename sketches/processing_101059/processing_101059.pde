
final int ONLYX = -1;
final int ONLYY =  1;
final int BOTH  =  0;

class GUI {

  //  final boolean ON = true;
  //  final boolean OFF= false;
  //Styles
  final int BASIC = 0;
  final int OLLIO = 1;
  
  int style;
  ArrayList<Button> buttons;
  ArrayList<Switch> switches;
  ArrayList<Scroll> scrolls;
  ArrayList<Draggon> draggons;
  boolean mouseLocked = false;

  GUI() {
    buttons  = new ArrayList();
    switches = new ArrayList();
    scrolls  = new ArrayList();
    draggons = new ArrayList();
    style    = BASIC;
  }

  Button addButton(String text, int x, int y, int w, int h) {
    buttons.add(new Button(text, x, y, w, h));
    return buttons.get(buttons.size()-1);
  }

//  Button addButton(String text, int x, int y, int w, int h, boolean multi) {
//    buttons.add(new Button(text, x, y, w, h, multi));
//    return buttons.get(buttons.size()-1);
//  }

  Draggon addDraggon(int x, int y, int w, int h, String text) {
    draggons.add(new Draggon(x, y, w, h, text));
    return draggons.get(draggons.size()-1);
  }
  
  Draggon addDraggon(int x, int y, int w, int h, String text, int orientation) {
    draggons.add(new Draggon(x, y, w, h, text, orientation));
    return draggons.get(draggons.size()-1);
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

  Scroll addScroll(int x, int y, int w, int h, float min, float max, float start) {
    scrolls.add(new Scroll(x, y, w, h, min, max, start));
    return scrolls.get(scrolls.size()-1);
  }

  //  void removeSwitch(Switch swtch) {
  //    swtch.pressed=false;
  //    swtch.hover=false;
  //    for (int i=switches.size()-1; i>=0; i--) {
  //      if (switches.get(i) == swtch) {
  //        switches.remove(i);
  //      }
  //    }
  //  }


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

    //all draggons
    for (int i=0; i<draggons.size(); i++) {
      Draggon s = draggons.get(i);
      if (!mouseLocked && mouseX>s.x-s.w/2 && mouseY>s.y-s.h/2 && mouseX<s.x+s.w/2 && mouseY<s.y+s.h/2) {
        s.hover=true;
        mouseLocked=true;
      }
      else if(!mousePressed) {
        s.hover=false;
        s.pressed=false;
      }
      if (mousePressed && s.hover) {
        s.x = s.orientation==ONLYY? s.x : mouseX;
        s.y = s.orientation==ONLYX? s.y : mouseY;
        s.pressed=true;
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

    //SCROLLS
    for (int i=0; i<scrolls.size(); i++) {
      Scroll s = scrolls.get(i);
      if (!mouseLocked && mouseX>s.x+s.h && mouseY>s.y && mouseX<s.x+s.w-s.h && mouseY<s.y+s.h) {
        s.hover=true;
        if(mousePressed) {
          s.value=(mouseX-s.x-s.h)*(s.max-s.min)/(s.w-2*s.h);
        }
      }
      else {
        s.hover=false;
      }
      if (s.lowBtn.clicked) {
        s.value-=0.01*(s.max-s.min);
        s.pressStartTime=-1;
      }
      if (s.hiBtn.clicked) {
        s.value+=0.01*(s.max-s.min);
        s.pressStartTime=-1;
      }
      if (s.lowBtn.pressed || s.hiBtn.pressed) {
        if (s.pressStartTime==-1) {
          s.pressStartTime=millis();
        }
        else if (millis()-s.pressStartTime>s.pressDelay) {
          s.value += s.lowBtn.pressed? -(s.max-s.min)*s.speed/frameRate : (s.max-s.min)*s.speed/frameRate;
        }
      }
      if(s.drg.pressed) {
        s.value=(s.drg.x-s.x-s.h)*(s.max-s.min)/(s.w-2*s.h);
      }
      s.value = s.value<s.min? s.min : s.value;
      s.value = s.value>s.max? s.max : s.value;
      s.drg.x = int(s.value*(s.w-2*s.h)/(s.max-s.min)+s.x+s.h);
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
    for (int i=0; i<scrolls.size(); i++) {
      Scroll s = scrolls.get(i);
      drawScroll(s);
    }
    for (int i=0; i<buttons.size(); i++) {
      Button b = buttons.get(i);
      drawButton(b);
    }
    for (int i=0; i<switches.size(); i++) {
      Switch s = switches.get(i);
      drawSwitch(s);
    }
    for (int i=0; i<draggons.size(); i++) {
      Draggon s = draggons.get(i);
      drawDraggon(s);
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
      //      println("T:"+text);
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
    boolean multi;
    Button(String text, int x, int y, int w, int h) {
      //      println("T:"+text);
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      hover   = false;
      pressed = false;
      clicked = false;
      multi   = false;
    }
    Button(String text, int x, int y, int w, int h, boolean multi) {
      //      println("T:"+text);
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      hover   = false;
      pressed = false;
      clicked = false;
      multi   = true;
    }
  }

  class Draggon extends Element {
    boolean pressed;
    int orientation;
    String text;
    Draggon(int x, int y, int w, int h, String text) {
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      this.orientation = BOTH;
      hover   = false;
      pressed = false;
    }
    Draggon(int x, int y, int w, int h, String text, int orientation) {
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.text = text;
      this.orientation = orientation;
      hover   = false;
      pressed = false;
    }
  }

  class Scroll extends Element {
    int pressDelay=500;
    float speed = 0.1;         //speed in (max-min) per second
    boolean pressed;
    Button lowBtn;
    Button hiBtn;
    Draggon drg;
    float value;
    float min;
    float max;
    float start;
    int pressStartTime;
    Scroll(int x, int y, int w, int h, float min, float max, float start) {
      //      println("T:"+text);
      this.x=x;
      this.y=y;
      this.w=w;
      this.h=h;
      this.min = min;
      this.max = max;
      this.value = start;
      pressStartTime=-1;
      hover   = false;
      pressed = false;
      lowBtn = addButton("<", x, y, h, h);
      hiBtn  = addButton(">", x+w-h, y, h, h);
      drg    = addDraggon(int(x+w*value/(max-min)),y+h/2,10,h, "", ONLYX);
//      drg    = addDraggon(100,y,10,h,ONLYX);
    }
  }


  //Styles - skins
  void drawButton(Button b) {
    switch(style) {
    case BASIC:
      smooth();
      pushStyle();
      textAlign(CENTER, CENTER);
      fill(230);
      stroke(150);
      strokeWeight(2);
      if (b.hover) {
        fill(255);
      }
      if (b.pressed) {
        fill(120);
        stroke(255);
      }
      rect(b.x, b.y, b.w, b.h);
      fill(0);
      text(b.text, b.x+b.w/2, b.y+b.h/2);
      popStyle();
      break;
    }
  }
  void drawSwitch(Switch b) {
    switch(style) {
    case BASIC:
      pushStyle();
      textAlign(CENTER, CENTER);
      fill(230);
      stroke(150);
      strokeWeight(2);
      if (b.pressed) {
        fill(120);
        stroke(255);
      }
      if (b.hover) {
        fill(255);
      }
      rect(b.x, b.y, b.w, b.h);
      fill(0);
      text(b.text, b.x+b.w/2, b.y+b.h/2);
      popStyle();
      break;
    }
  }
  void drawScroll(Scroll b) {
    switch(style) {
    case BASIC:
      pushStyle();
      textAlign(CENTER, CENTER);
      fill(120);
      if(b.hover) {
        fill(200);
      }
      stroke(150);
      strokeWeight(2);
      rect(b.x, b.y, b.w, b.h);
      fill(0);
      popStyle();
      break;
    }
  }
  void drawDraggon(Draggon b) {
    switch(style) {
    case BASIC:
      smooth();
      pushStyle();
      rectMode(CENTER);
      textAlign(CENTER, CENTER);
      fill(230);
      stroke(150);
      strokeWeight(2);
      if (b.hover) {
        fill(255);
      }
      if (b.pressed) {
        fill(120);
        stroke(255);
      }
      rect(b.x, b.y, b.w, b.h);
      fill(0);
      text(b.text, b.x, b.y);
      popStyle();
      break;
    }
  }
}


