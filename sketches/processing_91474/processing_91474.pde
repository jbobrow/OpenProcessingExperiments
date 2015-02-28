
// This sketch builds on a prior work, "PAINTING PROGRAMMING", created by Melissa Harris. I just thought that you might like this.
// http://studio.sketchpad.cc/sp/pad/view/ro.9gt6Y-9tjIJt$/rev.889
/** if anyone wants to modify this and clean the code up by deleting all the useless and unused things that would be AWESOME! I'm currently working on:
 minimap - on the top right so the users can zoom in and edit their picture with more detail.
 colorselector should be more clear what color is selected. possibly make it show what the brush size is at the same time.
 make the RGBA and HSBA editable and archivable.
 make all the actions performed append to an array and setup ctrl + z and ctrl + y for undo and redo.
 make an erase function.... sounds easy enough.
 make a grab color under mouse function.
 setup ability to save and load images.
 */
float[] mx = new float[0];
float[] my = new float[0];
buttonTable btntbl;
HScrollbar hs1;//width
HScrollbar hs2;//transparent
ColorPicker colorsel;
PGraphics drawingpic;
PImage pg = get();
int[] pointsx = new int[0];
int[] pointsy = new int[0];
int y = 30;
int x = 45;
int method=0;
 
color current;
 
void setup () {
  imageMode(CORNER);
 
 
  smooth();
  size (800, 600);
  drawingpic = createGraphics(width-210, height, P2D);
  drawingpic.stroke(current);
  drawingpic.background(255);
  colorsel = new ColorPicker(0, 0, 210, 200);
  colorsel.update();
  current = color(0);
  hs1 = new HScrollbar(0, 410+10, 150, 15, 1, "WIDTH", 1);//width
  hs2 = new HScrollbar(0, 430+10, 150, 15, 1, "OPACITY", 350/110);//transparent
  fill(100);
  noStroke();
  rect(0, 200, 210, 210);
  hs1.display();
  hs2.display();
  btntbl = new buttonTable(0, 460, "Marker");
  btntbl.addButton("Pencil");
  btntbl.addButton("Fuzzy");
  btntbl.addButton("Eraser");
 
  btntbl.addButton("EraseAll");
  btntbl.display();
  btntbl.btntab[0].selected = true;
  pg = drawingpic.get();
 
  image(pg, 0, 205, 200, 200);
  image(pg, 210, 0);
  noFill();
 
  drawingpic.strokeWeight(hs1.getPos());
  pg = get();
}
 
 
 
 
 
void mousePressed()
{
  if ( btntbl.update())
  {
  }
 
  //check to see if the mouse clicked in the color change box
  if (!colorsel.colorchoosermouse(true))
  {
    switch (btntbl._selected._listindex)
    {
    case 0:
      curveTightness(-2.5);
      //println("Marker");
      method = 0;
 
      //draw the lines
      drawingpic.strokeJoin(ROUND);
      drawingpic.curveVertex(mouseX-210, mouseY);
      break;
    case 1:
      //println("Pencil");
      drawingpic.strokeWeight(1);
      drawingpic.stroke(255, 1);
      mx = new float[0];
      my = new float[0];
      mx[0] = mouseX;
      my[0] = mouseY;
      method = 1;
      break;
    case 2:
 
 
      break;
    case 3:
      current = color(255);
      drawingpic.strokeJoin(ROUND);
      drawingpic.curveVertex(mouseX-210, mouseY);
      break;
    case 4:
      drawingpic.background(255);
      break;
    default:
      break;
    }
  }
  if (hs1.overEvent())
  {
    hs1.locked = true;
    hs1.update();
  }
  if (hs2.overEvent()) {
    hs2.locked = true;
    hs2.update();
  }
  fill(100);
  noStroke();
  rect(0, 200, 210, 210);
 
  //get(210, 0, width-210, height)
  pg = drawingpic.get();
  image(pg, 0, 205, 200, 200);
  image(pg, 210, 0);
  noFill();
 
 
  drawingpic.strokeWeight(hs1.getPos());
}
 
void mouseReleased()
{
  mx = new float[0];
  my = new float[0];
  pg = get();
  pointsx = new int[0];
  pointsy = new int[0];
  hs1.locked =false;
  hs2.locked = false;
  fill(100);
  noStroke();
  rect(0, 200, 210, 210);
 
  pg = drawingpic.get();
  image(pg, 0, 205, 200, 200);
  image(pg, 210, 0);
  noFill();
 
  drawingpic.strokeWeight(hs1.getPos());
  drawingpic.curveVertex(mouseX-210, mouseY);
 
  //fill(current);
  drawingpic.strokeWeight(0);
 
  drawingpic.curveDetail(5);
  fill(100);
  noStroke();
  rect(0, 200, 210, 210);
  pg = drawingpic.get();
  image(pg, 0, 205, 200, 200);
  image(pg, 210, 0);
  noFill();
 
  drawingpic.strokeWeight(hs1.getPos());
}
void mouseDragged() {
 
  if (!colorsel.colorchoosermouse(true) || mouseX>210) {
    if (btntbl._selected._listindex==3) {
      drawingpic.image(pg, 0, 0);
      image(pg, 210, 0);
      pointsx = append(pointsx, mouseX-210);
      pointsy = append(pointsy, mouseY);
      drawingpic.noFill();
      drawingpic.stroke(255, hs2.getPos());
      drawingpic.strokeWeight(hs1.getPos());
      drawingpic.beginShape();
 
 
      for (int i = 1;i <pointsx.length-1;i++)
      {
        stroke(255, 1);
        strokeWeight(1);
        drawingpic.vertex(pointsx[i-1], pointsy[i-1]);
        drawingpic.curveVertex(pointsx[i], pointsy[i]);
      }
      drawingpic.endShape();
    }
    if (btntbl._selected._listindex== 0)
    {
      drawingpic.image(pg, 0, 0);
      image(pg, 210, 0);
      pointsx = append(pointsx, mouseX-210);
      pointsy = append(pointsy, mouseY);
      drawingpic.noFill();
      drawingpic.stroke(current, hs2.getPos());
      drawingpic.strokeWeight(hs1.getPos());
      drawingpic.beginShape();
 
 
      for (int i = 1;i <pointsx.length-1;i++)
      {
        stroke(255, 1);
        strokeWeight(1);
        drawingpic.vertex(pointsx[i-1], pointsy[i-1]);
        drawingpic.curveVertex(pointsx[i], pointsy[i]);
      }
      drawingpic.endShape();
    }
    //println(btntbl._selected._listindex);
    if (btntbl._selected._listindex==2)
    {
         drawingpic.strokeWeight(hs1.getPos()/100);
      float dy, dx, db, dg;
      int mdx, mdy;
      db =  dist(pmouseX, pmouseY, mouseX, mouseY);
      for (int j = 0;j<db;j++) {
        mx = append(mx, lerp(pmouseX, mouseX, j/db));
        my = append(my, lerp(pmouseY, mouseY, j/db));
        if (mx.length()>2) {
          mdx = (mx[mx.length()-1]-mx[mx.length()-2]);
          mdy = (my[my.length()-1]-my[my.length()-2]);
          if (mdx != null && mdy != null && mdx !=0 && mdy != 0 ){
            drawingpic.stroke(current, hs2.getPos());
          drawingpic.line(mx[mx.length()-2]-(random(0, 40)*mdx)-210, my[mx.length()-2]-(random(0, 40)*mdy), 
          mx[mx.length()-2]-210, my[mx.length()-2]);
          drawingpic.line((mx[mx.length()-1]-noise()*10)-210, my[mx.length()-1]-noise()*10, 
          (mx[mx.length()-1]+(random(0, 40)*mdx)+noise()*10)-210, my[mx.length()-1]+(random(0, 40)*mdy)+noise()*10);
          }
        }
      }
      
      //mx = append(mx, mouseX);
      //my = append(my, mouseY);
      
    }
 
    if (btntbl._selected._listindex==1)
    {
      drawingpic.strokeWeight(hs1.getPos()/100);
      float db;
      db =  dist(pmouseX, pmouseY, mouseX, mouseY);
      for (int j = 0;j<=db;j+=2) {
        mx = append(mx, lerp(pmouseX, mouseX, j/db));
        my = append(my, lerp(pmouseY, mouseY, j/db));
      }
      for (int k = 1;k<=db;k++)
      {
 
        for (int i = mx.length-1; i >= 1; i--) {
 
          float dg = dist(mx[mx.length-k], my[mx.length-k], mx[i], my[i]); 
          if (dg < 35 && dg > 5) {
            drawingpic.stroke(current, hs2.getPos()/15);
            drawingpic.line(mx[mx.length-k]-210, my[mx.length-k], mx[i]-210, my[i]);
          }
        }
      }    
     
    }
image(drawingpic, 210, 0);
    colorsel.update();
  }
}
 
 
void draw () {
 
  if (hs1.locked && mousePressed)
  {
    hs1.update();    
    hs1.display();
    hs2.display(); 
    return;
  }
  if (hs2.locked && mousePressed)
  {
    hs2.update();    
    hs1.display();
    hs2.display();
    return;
  }
  if (mousePressed && !colorsel.colorchoosermouse(false) && !hs1.overEvent() && !hs2.overEvent()) {
    //image(drawingpic,210,0);
  }
  if (keyPressed) {
    if (key=='p') {
      current = color(150, 0, 100);
    }
  }
  if (keyPressed) {
    if (key=='g') {
      current =  color(40, 200, 0);
    }
  }
  if (keyPressed) {
    if (key=='r') {
      current =  color(200, 20, 100);
    }
  }
  if (keyPressed) {
    if (key=='o') {
      current =  color(250, 130, 0);
    }
  }
  if (keyPressed) {
    if (key=='y') {
      current =  color(200, 200, 0);
    }
  }
  btntbl.update();
  btntbl.display();
  hs1.display();
  hs2.display();
  fill(current);
  rect(170, 420, 30, 30);
  noFill();
  colorsel.update();
}
 
 
 
 
 
 
 
 
 
 
 
 
class ColorPicker
{
  PGraphics colorchooser;
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;        // x and y position of bar
  color scurrentcolor;    
  ColorPicker(float xp, float yp, int sw, int sh)
  {
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp;
    scurrentcolor = color(0);
    colorchooser = createGraphics(sw, sh, P3D);
 
    colorchooser.beginDraw();
    colorchooser.noStroke();
    colorchooser.background(255);
 
    colorchooser.colorMode(HSB, sw);
 
    for (int i=0; i<=sw; i++) {
 
      for (int j=0; j<=sh; j++) {
        colorchooser.saturation(j);
        colorchooser.stroke(i, j*2, (sh-j)*2);
 
        colorchooser.point(i, j);
      }
    }
 
    colorchooser.endDraw();
  }
  boolean colorchoosermouse(boolean setcolors) {
    //println(overEvent());
    if (overEvent())
    {
      if (setcolors)
      {
        current = colorchooser.get(mouseX, sheight-mouseY);
      }
      return true;
    } 
    else
    {
      return false;
    }
  }
  void update()
  {
    image(colorchooser, xpos, ypos);
  }
  boolean overEvent() {
    //println(xpos+","+(xpos+swidth)+",  "+ypos+","+(ypos+sheight));
    if ((mouseX > xpos) &&(mouseX <( xpos+swidth) )&&
      (mouseY > ypos) && (mouseY <( ypos+sheight))) {
      return true;
    } 
    else {
      return false;
    }
  }
}
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  String _Name;
 
  HScrollbar (float xp, float yp, int sw, int sh, int l, String n, float r) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
    _Name = n;
    ratio = r;
  }
 
  void update() {
    if (overEvent()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
    //  fill(255,0,0);
 
    //textMode(SCREEN);
    //text(_Name+" : "+round(spos*ratio),xpos,(ypos+swidth)-1);
  }
 
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
 
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }
 
  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0, 255);
    } 
    else {
      fill(102, 102, 102, 255);
    }
    rect(spos, ypos, sheight, sheight);
    fill(255, 0, 0);
    textMode(SCREEN);
    text(_Name+" : "+round(spos-sposMin*ratio), xpos, (ypos+sheight)-1);
  }
 
  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return (spos-sposMin) * ratio;
  }
}
 
 
//copy copy below this if you want to use the table button. feel free to use/modify/expand just give me a bit of credit. :)
 
class buttonTable {
  int x, y;
  PGraphics bt;
  Button[] btntab = {
  };
  Button _selected;
  int width;
  buttonTable(int _x, int _y, String _first)
  {
    Button first = new Button(_first, 0, 0, 0);
    first.setOffsets(_x, _y);
    x= _x;
    y=_y;
 
    width = first._width;
    btntab = append(btntab, first);
    this._selected = btntab[0];
    bt = createGraphics(width, (first._height+2)*btntab.length(), P2D);
    bt.beginDraw();
    first.display(bt);
    bt.endDraw();
  }
 
  boolean update()
  {
    if (mousePressed && (mouseX < x+bt.width) && (mouseX > x) && (mouseY < y+bt.height )&&( mouseY >y))
    {
      bt = createGraphics(width, (btntab[0]._height+2)*btntab.length(), P2D);
      bt.beginDraw();
 
      for (int i = 0; i <=btntab.length()-1;i++)
      {
        if (width<btntab[i]._width)
        {
          width = btntab[i]._width;
        }
        btntab[i].update();
        btntab[i].display(bt);
        if (btntab[i].selected)
        {
          this._selected = btntab[i];
        }
      }
      bt.endDraw();
      return true;
    }
    else { 
      return false;
    }
  }
  var display()
  {
    for (int i = 0; i <=btntab.length()-1;i++)
    {
      btntab[i].display(bt);
    }
    image(bt, x, y);
  }
  var addButton(String name)
  {
    //println(btntab.length());
    btntab = append(btntab, new Button(name, 0, 0, btntab.length()));
    btntab[btntab.length()-1].setOffsets(x, y);
    if (btntab[btntab.length()-1]._width > width ) {
      //println("wider");
      width = btntab[btntab.length()-1]._width;
    }
    bt = createGraphics(width, (btntab[btntab.length()-1]._height+2)*btntab.length(), P2D);
 
    bt.beginDraw();
    for (int i = 0; i <=btntab.length()-1;i++)
    {
      //println(btntab[i]._caption);
      btntab[i].update();
      btntab[i].display(bt);
    }
    bt.endDraw();
    image(bt, x, y);
  }
}
 
 
class Button {
  PGraphics btnimg;
  PGraphics btnimg2;
  String _caption;
  boolean _mouseOver = false;
  boolean selected = false;
  boolean _mouseClicked = false;
  float _height;
  float _width;
  float xoffset;
  float yoffset;
  int _x;
  int _y;
  int _listindex = 0;
  Button (String caption, int x, int y, int index)
  {
    PFont font;
    font = loadFont("FFScala.ttf");
    textFont(font, 16);
    _x = x;
    _y = y;
    _height = 24;
    _caption = caption;
    _width = textWidth(caption)+10;
 
 
    btnimg = createGraphics(int(_width), int(24), P2D);
    _listindex = index;
    btnimg.fill(00);
    btnimg.textFont(font, 16);
    btnimg.beginDraw();
    btnimg.background(255);
 
    btnimg.rect(0, 0, _width-1, _height-1, 2);
    btnimg.fill(230);
    btnimg.rect(0, 0, _width-3, _height-3, 2);
    btnimg.fill(0);
    btnimg.text(_caption, 2, 5, _width-6, _height-6);
    btnimg.smooth();
    btnimg.endDraw();
 
    btnimg2 = createGraphics(int(_width), int(24), P2D);
    btnimg2.fill(200);
    btnimg2.textFont(font, 16);
    btnimg2.beginDraw();
    btnimg2.background(255);
 
    btnimg2.rect(0, 0, _width-1, _height-1, 2);
    btnimg2.fill(0);
    btnimg2.rect(0, 0, _width-3, _height-3, 2);
    btnimg2.fill(255);
    btnimg2.text(_caption, 2, 5, _width-6, _height-6);
    btnimg2.smooth();
    btnimg2.endDraw();
  }
  void setOffsets(float XX, float YY) {
    xoffset = XX;
    yoffset = YY;
  }
  void display(PGraphics event)
  {
    if (selected)
    {
      event.image(btnimg2, _x, _y+(_listindex*(_height+1)));
    }
    else
    {
 
      event.image(btnimg, _x, _y+(_listindex*(_height+1)));
    }
  }
  boolean update()
  {
 
 
    if (mousePressed && (mouseX < xoffset+_x+_width) && (mouseX > xoffset+_x )&&( mouseY < yoffset+_y+((_listindex+1)*(_height+1))) && (mouseY > yoffset+_y+((_listindex)*(_height+1))))
    {
      selected = true;
      //println(selected);
 
 
      return true;
    }
    else {
      selected = false;
      return false;
    }
  }
}
