



int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
  }

  void display()  {
  }

  boolean isClicked()  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}



class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } 
      else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } 
      else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}



//this has a workingish debug; text screen result

//you're some fucking eejit; println depends on serial and
//that's not coming back through usb. you. spa.
//that's about four days of mystery freakout for naught.
import ddf.minim.*;

Minim minim;
AudioPlayer pLeft, pRight, pTop, pBot, pTl, pTr, pBl, pBr;


Slider sTop, sBot, sLeft, sRight;
PFont fontA;
float tL, tR, bR, bL;


void setup()
{
  // size(displayWidth, displayHeight, P3D);
//orientation(LANDSCAPE);

size(860, 720);
displayWidth = 860;
displayHeight = 720;

  sLeft = new Slider("", 20, 0, 100, 120, displayHeight/2-10, 320, 20, HORIZONTAL);  //
  sRight = new Slider("", 20, 0, 100, displayWidth/2+20, displayHeight/2-10, 320, 20, HORIZONTAL);
  sBot = new Slider("", 20, 0, 100, displayWidth/2-10, displayHeight/2+20, 20, 320, DOWNWARDS);
  sTop = new Slider("", 20, 0, 100, displayWidth/2-10, displayHeight/2-20-320, 20, 320, UPWARDS);

  fontA = loadFont("Consolas-20.vlw");
  textFont(fontA, 20);
  
  minim = new Minim(this);
  pLeft = minim.loadFile("1.wav");
  pRight = minim.loadFile("2.wav");
  pTop = minim.loadFile("3.wav");
  pBot = minim.loadFile("4.wav");
  pTl = minim.loadFile("5.wav");
  pTr = minim.loadFile("6.wav");
  pBl = minim.loadFile("7.wav");
  pBr = minim.loadFile("8.wav");
  
  pLeft.play();
  pRight.play();
  pTop.play();
  pBot.play();
  pTl.play();
  pTr.play();
  pBl.play();
  pBr.play();
  
  pLeft.loop();
  pRight.loop();
  pTop.loop();
  pBot.loop();
  pTl.loop();
  pTr.loop();
  pBl.loop();
  pBr.loop();
  
//  pLeft.getControl(volume);
//  pRight.getControl(volume);
  
//  pLeft.setVolume(0);
//  pRight.setVolume(0);
  pLeft.setGain(-80);
  pRight.setGain(-80);
  pTop.setGain(-80);
  pBot.setGain(-80);
  pTl.setGain(-80);
  pTr.setGain(-80);
  pBl.setGain(-80);
  pBr.setGain(-80);
  
}

void draw() {

  background(sTop.get(), sBot.get(), sLeft.get(), sRight.get());
  //background(sTopR.get(), sBotR.get(), sBotR.get(), sBotL.get());

  float [] theseAngles = {
    QUARTER_PI, HALF_PI+QUARTER_PI, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI
  };

  for (int i=0; i < theseAngles.length; i++) {

    line((displayWidth/2)+(sin(theseAngles[i])*20), (displayHeight/2)+(cos(theseAngles[i])*20), 
    (displayWidth/2)+(sin(theseAngles[i])*320), (displayHeight/2)+(cos(theseAngles[i])*320));
  }
  fill(sLeft.get(), sRight.get(), sBot.get(), sTop.get());
  ellipse(displayWidth/2, displayHeight/2, 120, 120);

  diagonalBit();  //check mouseover for the diagonals

  theOtherStuff();

  
  sTop.display();
  sBot.display();
  sLeft.display();
  sRight.display();
  
    yeahDiagonals();  //final bit of displayMagic


} 


void mousePressed()
{

  sTop.mousePressed();
  sBot.mousePressed();
  sLeft.mousePressed();
  sRight.mousePressed();

}


void mouseDragged()
{

  sTop.mouseDragged();
  sBot.mouseDragged();
  sLeft.mouseDragged();
  sRight.mouseDragged();

}

void mouseReleased()
{

  sTop.mouseReleased();
  sBot.mouseReleased();
  sLeft.mouseReleased();
  sRight.mouseReleased();

}



void theOtherStuff() {

  //  float ang =  180 + degrees(atan2(mouseY-(height/2), mouseX-(width/2)));
  //float dist = dist(width/2, height/2, mouseX, mouseY);
  pushStyle();
  fill(255);
  stroke(0);
  strokeWeight(88);

  text("a+180:"+ (180+degrees(atan2(mouseY-(displayHeight/2), mouseX-(displayWidth/2)))), displayWidth/2, 20);
  text("a/d:"+ (degrees(atan2(mouseY-(displayHeight/2), mouseX-(displayWidth/2)))), displayWidth/2+30, 45);
  text("a:"+atan2(mouseY-(displayHeight/2), mouseX-(displayWidth/2)), displayWidth/2-30, 70);


  text("distance: "
    + (dist(displayWidth/2, displayHeight/2, mouseX, mouseY))
    , displayWidth/2, displayHeight-50);

  popStyle();
}

void diagonalBit() {


  //holy fucking jaysis, why isn't this arrayed up like a muthaflippa?

  float [] measureAngles = {
    degrees(QUARTER_PI), degrees(HALF_PI+QUARTER_PI), degrees(PI+QUARTER_PI), degrees(PI+HALF_PI+QUARTER_PI)
  };

  float [] outAngles = {
    QUARTER_PI, HALF_PI+QUARTER_PI, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI
  };


  float currAngle = 180+degrees(atan2(mouseY-(displayHeight/2), mouseX-(displayWidth/2)));
  float xDist = displayWidth/2-mouseX;
  float yDist = displayHeight/2-mouseY;
  
  int count = 0;
  pushStyle();
  //stroke(0, 0, 0, 255);   //this is interesting
  stroke(255);
  strokeWeight((dist(displayWidth/2, displayHeight/2, mouseX, mouseY))/10);

  for (int i=0; i < measureAngles.length; i++) {

    if (((currAngle+(currAngle/10)) > measureAngles[i]) && (measureAngles[i] > (currAngle-(currAngle/10)))) {  //this arrangement of angles is the next place it goes wrong
      fill(255, 0, 0);

      ellipse(displayWidth/2+cos(outAngles[i])*320, displayHeight/2+sin(outAngles[i])*320, 30, 30);  //ellipse(cos(radians(anotherAngleSet[i])*standardEndPoint)...

      if (count == 0) { //topLeft
        line((displayWidth/2-15), (displayHeight/2-15), 
        displayWidth/2-cos(outAngles[i])*320, displayHeight/2-(sin(outAngles[i])*320));
        
        tL = map(dist(mouseX, mouseY, displayWidth/2, displayHeight/2), 0, 340, 0, 255);
      }
      else if (count == 1) {  //topRight
        line((displayWidth/2)+15, (displayHeight/2)-15, 
        displayWidth/2-cos(outAngles[i])*320, displayHeight/2-(sin(outAngles[i])*320));

        tR = map(dist(mouseX, mouseY, displayWidth/2, displayHeight/2), 0, 340, 0, 255);

      }
      else if (count == 2) {  //botRight
        line((displayWidth/2)+15, (displayHeight/2)+15, 
        displayWidth/2-cos(outAngles[i])*320, displayHeight/2-(sin(outAngles[i])*320));
        
        bR = map(dist(mouseX, mouseY, displayWidth/2, displayHeight/2), 0, 340, 0, 255);

      }
      else if (count == 3) {   //botLeft
        line((displayWidth/2)-15, (displayHeight/2)+15, 
        displayWidth/2-cos(outAngles[i])*320, displayHeight/2-(sin(outAngles[i])*320));

        bL = map(dist(mouseX, mouseY, displayWidth/2, displayHeight/2), 0, 340, 0, 255);

        count = 0;
      }
nested();
    }
    count++;
  }

  popStyle();
  
    fill(tL, tR, bR, 150);
  ellipse(displayWidth/2, displayHeight/2, 250, 250);
  
      fill(tR, bR, bL, 150);
  ellipse(displayWidth/2, displayHeight/2, 210, 210);
  
      fill(bR, bL, tL, 150);
  ellipse(displayWidth/2, displayHeight/2, 180, 180);
  
        fill(bL, tL, tR, 150);
  ellipse(displayWidth/2, displayHeight/2, 150, 150);
}


void nested() {
  
  noStroke();
  
      fill(tL, tR, bR, 150);
  ellipse(width/2, height/2, 150, 150);
  
      fill(tR, bR, bL, 150);
  ellipse(width/2, height/2, 180, 180);
  
      fill(bR, bL, tL, 150);
  ellipse(width/2, height/2, 210, 210);
  
        fill(bL, tL, tR, 150);
  ellipse(width/2, height/2, 250, 250);
  
}
  
void yeahDiagonals() {

//  float lvol = map(sLeft.get(), 0, 100, -50.0, 14.0);
  float lvol = map(sLeft.get(), 0, 100, 14.0, -50.0);

  pLeft.setGain(lvol);
  
  float rvol = map(sRight.get(), 0, 100, -50.0, 14.0);
//  pRight.setVolume(rvol);
  pRight.setGain(rvol);

  float pTopvol = map(sTop.get(), 0, 100, -50.0, 14.0);
  pTop.setGain(pTopvol);
  
  float pBotvol = map(sBot.get(), 0, 100, -50.0, 14.0);
  pBot.setGain(pBotvol);
  
  float tLvol = map(tL, 0, 255, -50.0, 14.0);
  pTl.setGain(tLvol);
  
    float tRvol = map(tR, 0, 255, -50.0, 14.0);
  pTr.setGain(tRvol);
  
    float bLvol = map(bL, 0, 255, -50.0, 14.0);
  pBl.setGain(bLvol);
  
    float bRvol = map(bR, 0, 255, -50.0, 14.0);
  pBr.setGain(bRvol);
  
// pTl, pTr, pBl, pBr;
  /* 
  
  // background(150, 150, 150);
  THIS IS WHERE THE FINAL DISPLAY ELEMENTBIT GOES 
  load pngs- active/inactive
  display pngs- each leg has holderVariable
  colour based on snapTo value table for each leg
  
*/
}


