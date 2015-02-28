

void makeGUI() {
  controlP5 = new ControlP5(this);
  controlP5.addSlider("total_Points", 100000, 2000000).linebreak();
  controlP5.controller("total_Points").setValue(1000000);
  controlP5.addSlider("points_Drawn", 10000, 500000).linebreak();
  controlP5.controller("points_Drawn").setValue(100000);
  controlP5.addSlider("range", 0.001, 10).linebreak();
  controlP5.controller("range").setValue(1);
  controlP5.addSlider("functions", 1, 20).setNumberOfTickMarks(20);
  controlP5.controller("functions").linebreak();
  
  controlP5.controller("functions").setValue(4);
  controlP5.controller("range").setValue(1);
  controlP5.addSlider("speed", 0, 10).linebreak();
  controlP5.controller("speed").setValue(map(.01, .001, .02, 0, 10));
  controlP5.addToggle("animate");
  controlP5.addToggle("blur");
  controlP5.addToggle("antialiasing");
  controlP5.addToggle("background").linebreak();
  controlP5.addButton("Rand_All");
  controlP5.addButton("Rand_Colors");

  controlP5.addButton("Rand_Functions").linebreak();
  controlP5.addButton("Picture");
  controlP5.addButton("Movie").linebreak();
  controlP5.addSlider("rotations", 0, 20).setNumberOfTickMarks(21);
  controlP5.controller("rotations").setValue(5);
  controlP5.addButton("Hide_Menu", 7, 10, height-30, 70, 20);
  func=controlP5.addGroup("function_Editor", 10, 295);


  func.close();
  r = controlP5.addRadioButton("radioButton", 0, 5);
  r.setColorForeground(color(120));
  r.setColorActive(color(255));
  r.setColorLabel(color(255));
  r.setItemsPerRow(3);
  r.setSpacingColumn(60);
  r.setGroup(func);
  for (int x=0;x<20;x++) {
    addToRadioButton(r, "function "+x, x);
  }
  r.setGroup(func);
  controlP5.addSlider("a", -1, 1, 0, 100, 60, 10).setGroup(func);
  controlP5.addSlider("b", -1, 1, 70, 100, 60, 10).setGroup(func);
  controlP5.addSlider("c", -1, 1, 140, 100, 60, 10).setGroup(func);
  controlP5.addSlider("d", -1, 1, 0, 115, 60, 10).setGroup(func);
  controlP5.addSlider("e", -1, 1, 70, 115, 60, 10).setGroup(func);
  controlP5.addSlider("f", -1, 1, 140, 115, 60, 10).setGroup(func);
  controlP5.controller("a").setValue(a[dispFunctionOpts][0]);
  controlP5.controller("b").setValue(a[dispFunctionOpts][1]);
  controlP5.controller("c").setValue(a[dispFunctionOpts][2]);
  controlP5.controller("d").setValue(a[dispFunctionOpts][3]);
  controlP5.controller("e").setValue(a[dispFunctionOpts][4]);
  controlP5.controller("f").setValue(a[dispFunctionOpts][5]);
  colors=controlP5.addGroup("color_Editor", 120, 295);
  grad=new Gradient(10, 410, 162, 10);
  r2 = controlP5.addRadioButton("radioButton2", -110, 5);
  r2.setColorForeground(color(120));
  r2.setColorActive(color(255));
  r2.setColorLabel(color(255));
  r2.setItemsPerRow(3);
  r2.setSpacingColumn(60);
  r2.setGroup(func);
  for (int x=0;x<20;x++) {
    addToRadioButton(r2, "color "+x, x);
  }
  r2.setGroup(colors);
  controlP5.addSlider("colorSelector", 0, 255, -110, 100, 162, 10).setSliderMode(Slider.FLEXIBLE);
  controlP5.controller("colorSelector").setGroup(colors);
  controlP5.controller("colorSelector").setValue(cf[0]);
  colors.activateEvent(true);
  func.activateEvent(true);
  p1 = controlP5.addDropdownList("variations1", 10, 20, 100, 120);
  p1.captionLabel().set("variations");
  for (int i=0;i<options.length;i++) {
    p1.addItem(options[i], i);
  }
  customize(p1);
  p2 = controlP5.addDropdownList("variations2", 140, 20, 100, 120);
  p2.captionLabel().set("variations");
  for (int i=0;i<options.length;i++) {
    p2.addItem(options[i], i);
  }
  customize(p2);
  modeList =controlP5.addDropdownList("render_mode", 10, 275, 100, 120);
  customize(modeList);
  modeList.captionLabel().set("Render Mode");
  for (int i=0;i<modes.length;i++) {
    modeList.addItem(modes[i], i);
  }
  symList =controlP5.addDropdownList("Symmetry", 140, 275, 100, 120);
  customize(symList);
  symList.captionLabel().set("Symmetry Type");
  for (int i=0;i<syms.length;i++) {
    symList.addItem(syms[i], i);
  }
}
void customize(DropdownList ddl) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}
void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  Toggle t = theRadioButton.addItem(theName, theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2, 0, -1, 2);
  t.captionLabel().style().moveMargin(-2, 0, 0, -3);
  t.captionLabel().style().backgroundWidth = 56;
}

void controlEvent(ControlEvent theEvent) {
  // PulldownMenu is if type ControlGroup.
  // A controlEvent will be triggered from within the ControlGroup.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message from controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    String name=theEvent.group().name();
    int val=int(theEvent.group().value());
    if (name=="variations1") {
      v=val;
    }
    else if (name=="variations2") {
      v2=val;
    }
    else if (name=="render_mode") {
      mode=val;
    }
    else if (name=="Symmetry") {
      symmetry=val;
    }
    else if (name=="radioButton") {
      dispFunctionOpts=val;
      controlP5.controller("a").setValue(a[dispFunctionOpts][0]);
      controlP5.controller("b").setValue(a[dispFunctionOpts][1]);
      controlP5.controller("c").setValue(a[dispFunctionOpts][2]);
      controlP5.controller("d").setValue(a[dispFunctionOpts][3]);
      controlP5.controller("e").setValue(a[dispFunctionOpts][4]);
      controlP5.controller("f").setValue(a[dispFunctionOpts][5]);
    }
    else if (name=="radioButton2") {
      dispColorOpts=val;
      controlP5.controller("colorSelector").setValue(cf[val]);
    }
    else if (name=="color_Editor") {
      if (theEvent.group().isOpen()) {
        func.close();
      }
    }
    else if (name=="function_Editor") {
      if (theEvent.group().isOpen()) {
        colors.close();
      }
    }
  } 
  else if (theEvent.isController()) {
    String name=theEvent.controller().name();
    float val=theEvent.controller().value();
    if (name=="total_Points") {
      points=int(val);
    }
    else if (name=="points_Drawn") {
      drawPoints=int(val);
    }
    else if (name=="range") {
      range=val;
    }
    else if (name=="rotations") {

      reflections=int(val);
      theta=TWO_PI/reflections;
      ctheta=cos(theta);
      stheta=sin(theta);
    }
    else if (name=="functions") {

      functions=int(val);
      i=0;

      dra=new int[width*2][height*2]; 
      col=new int[width*2][height*2];
      for (int k=0;k<6;k++) {
        a[functions][k]=random(-range, range);
      }
      cf[functions]=random(255);
    }
    else if (name=="a") {
      a[dispFunctionOpts][0]=val;
    }
    else if (name=="b") {
      a[dispFunctionOpts][1]=val;
    }
    else if (name=="c") {
      a[dispFunctionOpts][2]=val;
    }
    else if (name=="d") {
      a[dispFunctionOpts][3]=val;
    }
    else if (name=="e") {
      a[dispFunctionOpts][4]=val;
    }
    else if (name=="f") {
      a[dispFunctionOpts][5]=val;
    }
    else if (name=="speed") {
      timeStep=map(val, 0, 10, 0.001, 0.03);
    }
    else if (name=="colorSelector") {
      cf[dispColorOpts]=val;
    }
  }
}

class Gradient {
  int x, y, w, h, ax, ay, cx, cy, c2x, c2y, tagLength=5;
  color[][] c=new color[256][256];
  ColorTag[] cT=new ColorTag[10];
  ColorChooser colorChoose;
  boolean closed=true;
  Gradient(int X, int Y, int WIDTH, int HEIGHT) {
    x=X;
    y=Y;
    w=WIDTH;
    h=HEIGHT;
    ax=width/2+130;
    ay=height/2+180;
    cx=width/2-150;
    cy=height/2-200;
    c2x=width/2+150;
    c2y=height/2+200;
    cT[1]=new ColorTag(0, cx+20, cy+10, c2x-cx-40, h*2, color(255, 0, 0), false, true);
    cT[2]=new ColorTag(60, cx+20, cy+10, c2x-cx-40, h*2, color(255, 0, 255), true, false);
    cT[3]=new ColorTag(120, cx+20, cy+10, c2x-cx-40, h*2, color(0, 255, 255), true, false);
    cT[4]=new ColorTag(180, cx+20, cy+10, c2x-cx-40, h*2, color(255, 255, 0), true, false);
    cT[0]=new ColorTag(255, cx+20, cy+10, c2x-cx-40, h*2, color(255, 0, 0), false, false);
    colorChoose=new ColorChooser(cx+20, cy+50, 260, color(255, 0, 0));
    update();
  }
  void draw() {
    noSmooth();
    for (int i=x;i<x+w;i++) {
      stroke(c[floor(map(i, x, x+w, 0, 255))][255]);
      line(i, y, i, y+h);
    }
    if (closed) {
      if (mouseInRect(x, y, w, h)) {
        pushStyle();
        noFill();
        stroke(255);
        rect(x, y, w, h);
        popStyle();
        if (mousePressed) {
          closed=false;
          background=false;
        }
      }
    }
    else {
      fill(0);
      stroke(255);
      rect(cx, cy, 300, 400);
      rect(ax, ay, 10, 10);
      line(ax+10, ay, ax, ay+10);
      line(ax, ay, ax+10, ay+10);
      fill(0, 69, 102);
      stroke(0, 124, 158);
      ellipse(cx+30, cy+310, 16, 16);
      line(cx+30, cy+304, cx+30, cy+316);
      line(cx+24, cy+310, cx+35, cy+310);

      ellipse(cx+265, cy+310, 16, 16);
      line(cx+260, cy+304, cx+270, cy+316);
      line(cx+260, cy+316, cx+270, cy+304);
      if (mouseInRect(427, 342, 16, 16) && mousePressed) {
        if (tagLength>1) {
          for (int i=2;i<tagLength;i++) {
            if (cT[i].isActive) {
              cT[i]=cT[tagLength-1];
              tagLength--;
            }
            cT[i].isActive=false;
          }
          cT[0].isActive=true;
          colorChoose.setColor(cT[0].c);
        }
        update();
      }
      if (mouseInRect(192, 342, 16, 16) && mousePressed) {
        if (tagLength<10 && !pmousePressed) {
          tagLength++;
          cT[tagLength-1]=new ColorTag(120, cx+20, cy+10, c2x-cx-40, h*2, color(0, 255, 255), true, false);
        }
        update();
      }
      for (int i=cx+20;i<c2x-20;i++) {
        stroke(c[floor(map(i, cx+20, c2x-20, 0, 255))][255]);
        line(i, cy+20, i, cy+h*2+20);
      }
      colorChoose.draw();
      for (int i=0;i<tagLength;i++) {
        cT[i].draw();
      }
      if (mouseInRect(ax, ay, 10, 10)&&mousePressed)closed=true;
    }
  }
  void update() {
    if (background) {
      closed=true;
      backgroundColor=bgColor.c;
    }
    for (int j=1;j<tagLength;j++) {
      int c1=cT[j].i;
      int index=0;
      int c2=257;
      for (int d=0;d<tagLength;d++) {
        if (cT[d].i<c2 && cT[d].i>c1) {
          c2=cT[d].i;
          index=d;
        }
      }
      for (int d=c1;d<c2;d++) {
        c[constrain(d, 0, 255)][255]=lerpColor(cT[j].c, cT[index].c, norm(d, c1, c2));
      }
    }
    for (int j=254;j>=0;j--) {
      for (int d=0;d<256;d++) {
        c[d][j]=lerpColor(c[d][255], backgroundColor, norm(j, 254, 0));
      }
    }
  }
}

class ColorTag {
  int i, x, y, w, h;
  int posX, posY;
  color c;
  boolean isDraggable, isActive, mouseOver, dragging;
  ColorTag(int I, int X, int Y, int W, int H, color C, boolean drag, boolean act) {
    i=constrain(I, 0, 255);
    x=X;
    y=Y;
    w=W;
    h=H;
    c=C;
    isDraggable=drag;
    isActive=act;
    posX=(int)map(i, 0, 255, x, x+w);
  }
  void draw() {
    pushStyle();
    fill(c);
    stroke(0);
    rect(posX, y, 10, 10);
    mouseOver=(mouseInRect(posX, y, 10, 20) || mouseInRect(posX, y+15, 1, 10));
    fill((isActive)?((mouseOver)?127:0):
    255);
    triangle(posX, y+10, posX, y+20, posX+10, y+10);
    popStyle();
    if (mousePressed && mouseOver) {
      if (!isActive) {
        for (int x=0;x<grad.tagLength;x++) {
          grad.cT[x].isActive=false;
        }

        isActive=true;
        grad.colorChoose.setColor(c);
      }
      else if (isDraggable) {
        dragging=true;
        posX=constrain(posX+mouseX-pmouseX, x, x+w);
        i=(int)map(posX, x, x+w, 0, 255);
        grad.update();
      }
    }
    if (dragging) {

      if (mousePressed) {
        dragging=true;
        posX=constrain(posX+mouseX-pmouseX, x, x+w);
        i=(int)map(posX, x, x+w, 0, 255);
        grad.update();
      }
      else {
        dragging=false;
      }
    }


    if (isActive) {
      c=grad.colorChoose.c;
    }
  }
}
class ColorChooser {
  int x, y, w, h, wide;
  float red, green, blue;
  color c;
  ColorChooser(int X, int Y, int W, color C) {
    x=X;
    y=Y;
    w=W;
    c=C;
    wide=int((w-20)*norm(255, 0, 270));
    red=red(c);
    green=green(c);
    blue=blue(c);
  }
  void draw() {
    pushStyle();
    noStroke();
    fill(c);
    rect(x, y, w, wide+20);
    loadPixels();
    for (int z=x+10;z<x+wide+10;z++) {
      for (int j=y+10;j<y+10+wide;j++) {
        pixels[constrain(z+j*width, 0, pixels.length-1)]=color(map(z, x+10, x+wide+10, 0, 255), map(j, y+10, y+10+wide, 0, 255), blue);
      }
    }
    updatePixels();
    for (int z=y+10;z<y+10+wide;z++) {
      stroke(red, green, map(z, y+10, y+10+wide, 0, 255));
      line(x+wide+15, z, x+wide+25, z);
    }
    if (mousePressed) {
      if (mouseInRect(x+10, y+10, wide, wide)) {
        red=map(mouseX, x+10, x+10+wide, 0, 255);
        green=map(mouseY, y+10, y+10+wide, 0, 255);
        grad.update();
      }
      if (mouseInRect(x+15+wide, y+10, 10, wide)) {
        blue=map(mouseY, y+10, y+10+wide, 0, 255);
        grad.update();
      }
      c=color(red, green, blue);
    }
    stroke((brightness(c)>127)?0:255);
    int r=(int)map(red, 0, 255, x+10, x+10+wide);
    int g=(int)map(green, 0, 255, y+10, y+10+wide);
    int b=(int)map(blue, 0, 255, y+10, y+10+wide);
    line(x+10, g, x+10+wide, g);
    line(r, y+10, r, y+10+wide);
    line(x+15+wide, b, x+25+wide, b);
  }
  void setColor(color C) {
    c=C;
    red=c>>16&0xFF;
    green=c>>8&0xFF;
    blue=c&0xFF;
  }
}

boolean mouseInRect(int c1, int c2, int c3, int c4) {
  boolean truth=(mouseX>c1 &&mouseX<(c1+c3)&&mouseY>c2 &&mouseY<(c2+c4));
  return truth;
}


