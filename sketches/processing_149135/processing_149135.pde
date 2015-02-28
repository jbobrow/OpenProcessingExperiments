
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an ifram

PShape MouseShape;
PShape mright;
PShape mleft;
PShape mwheel;
PShape mcursor;
//PShape[] Children;
//---------------
boolean Lflag, Rflag;
//----------------
float mW;
void setup() {
  size(400, 300);
  MouseShape = loadShape("bot.svg");
  //  Children = MouseShape.getChildren();
  //  mleft    = MouseShape.getChild(Children[0].getName());
  //  mright   = MouseShape.getChild(Children[1].getName());
  //  mwheel   = MouseShape.getChild(Children[2].getName());
  //  mcursor  = MouseShape.getChild(Children[3].getName());  
  mleft    = MouseShape.getChild("Layer_1");
  mright   = MouseShape.getChild("Layer_2");
  mwheel   = MouseShape.getChild("Layer_3");
  mcursor  = MouseShape.getChild("Layer_4");
}

void draw() {
  background(-1);
  scale(0.5);
  translate(width/4, 0);
  noStroke();
  fill(0);
  MouseShape.disableStyle();
  shape(MouseShape, 0, 0);

  if (Rflag) {
    mright.disableStyle();
    fill(#FF0000);
    shape(mright, 0, 0);
  }
  if (Lflag) {
    mleft.disableStyle();
    fill(#FF0000);
    shape(mleft, 0, 0);
  }
  //-----------------------------
  mwheel.disableStyle();
  if (mW>0)fill(#5000FF);
  else if (mW<0)fill(#00FF28);
  else fill(0);
  shape(mwheel, 0, 0);
  //-----------------------------
  mcursor.disableStyle();
  fill(-1);
  shape(mcursor, 0, mW*20);
}

void mousePressed() {
  if (mouseButton==LEFT) Lflag = true;
  else Lflag = false;
  if (mouseButton==RIGHT) Rflag = true;
  else Rflag = false;
}

void mouseReleased() {
  Rflag = false;
  Lflag = false;
}

void mouseWheel(MouseEvent event) {
  mW = event.getCount();
  println(mW);
}
// this is the hack :) 
void mouseScrolled()
{
  if (mouseScroll > 0)
  {
    mW = 1; // Do whatever for positive scroll
  }
  else
  {
    mW = -1; // Do whatever for negative scroll
  }
}


