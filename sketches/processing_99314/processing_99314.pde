
//Aviva Silberstein
//Final 
//May 16, 2013

PImage title;
PImage butterbottle;
PImage essiebottle;
PImage opibottle;
PImage chinaglazebottle;
PImage butterinfo;
PImage opiinfo;
PImage essieinfo;
PImage chinaglazeinfo;
PImage butterlid;
Brush butterbrush; 
PImage essielid;
Brush essiebrush;
PImage opilid;
Brush opibrush;
PImage chinaglazelid;
Brush chinaglazebrush;




void setup() {
  butterlid = loadImage("butterbrush.png");
  butterbottle = loadImage("butter.png");
  essielid = loadImage("essiebrush.png");
  essiebottle = loadImage("essie.png");
  opilid = loadImage("opibrush.png");
  opibottle = loadImage("opi.png");
  chinaglazelid = loadImage("chinaglazebrush.png");
  chinaglazebottle = loadImage("chinaglaze.png");
  butterinfo = loadImage("butterinfo.png");
  opiinfo = loadImage("opiinfo.png");
  essieinfo = loadImage("essieinfo.png");
  chinaglazeinfo = loadImage("chinaglazeinfo.png");
  title = loadImage("title.png");
  size(800, 500);
  background(255);
  butterbrush = new Brush(50, 250, 100, 200, butterlid, butterinfo);
  essiebrush = new Brush(250, 250, 100, 200, essielid, essieinfo);
  opibrush = new Brush(450, 250, 100, 200, opilid, opiinfo);
  chinaglazebrush = new Brush(650, 250, 100, 200, chinaglazelid, chinaglazeinfo);
}

void draw() {
  background(255);
  image(title, 0, 0);
  butterbrush.display();
  image(butterbottle, butterbrush.xPos, 350);
  //don't normally do this!
  fill(255);
  noStroke();
  rect(butterbrush.xPos, 431, 100, 30);
  //this is bad
  essiebrush.display();
  image(essiebottle, essiebrush.xPos, 340);
  opibrush.display();
  image(opibottle, opibrush.xPos, 350);
  chinaglazebrush.display();
  image(chinaglazebottle, chinaglazebrush.xPos, 350);
  image(title, 0, 0);
}

void mouseClicked() {
  if (mouseX>butterbrush.xPos && mouseX<butterbrush.xPos+butterbrush.w && mouseY>butterbrush.yPos && mouseY<butterbrush.yPos+butterbrush.h) {
    if (butterbrush.open == false) {
      butterbrush.open = true;
      butterbrush.yPos = butterbrush.yPos-200;
    }
    else if (butterbrush.open == true) {
      butterbrush.yPos = butterbrush.yPos+200;
      butterbrush.open = false;
    }
  }
  println("click");
  println(butterbrush.open);

  if (mouseX>essiebrush.xPos && mouseX<essiebrush.xPos+essiebrush.w && mouseY>essiebrush.yPos&& mouseY<essiebrush.yPos+essiebrush.h) {
    if (essiebrush.open == false) { 
      essiebrush.open = true;
      essiebrush.yPos = essiebrush.yPos-200;
    }
    else if (essiebrush.open == true) { 
      essiebrush.yPos = essiebrush.yPos+200;
      essiebrush.open = false;
    }
  }
  println("click");
  println(essiebrush.open);

  if (mouseX>opibrush.xPos && mouseX<opibrush.xPos+opibrush.w && mouseY>opibrush.yPos && mouseY<opibrush.yPos+opibrush.h) { 
    if (opibrush.open == false) {
      opibrush.open = true;
      opibrush.yPos = opibrush.yPos-200;
    }
    else if (opibrush.open == true) { 
      opibrush.yPos = opibrush.yPos+200;
      opibrush.open = false;
    }
  }

  println("click");
  println(opibrush.open);

  if (mouseX>chinaglazebrush.xPos && mouseX<chinaglazebrush.xPos+chinaglazebrush.w && mouseY>chinaglazebrush.yPos && mouseY<chinaglazebrush.yPos+chinaglazebrush.h) {
    if (chinaglazebrush.open == false) {
      chinaglazebrush.open = true;
      chinaglazebrush.yPos = chinaglazebrush.yPos-200;
    }
    else if (chinaglazebrush.open == true) {
      chinaglazebrush.yPos = chinaglazebrush.yPos+200;
      chinaglazebrush.open = false;
    }
  }

  println("click");
  println(chinaglazebrush.open);
}
class Brush {
  float xPos;
  float yPos;
  float w;
  float h;
  PImage brush;
 PImage info;
  boolean open;

  Brush(float tempX, float tempY, float tempW, float tempH, PImage tempBrush, PImage tempinfo) {
    xPos = tempX;
    yPos = tempY; 
    w = tempW;
    h = tempH;
    brush = tempBrush;
    info = tempinfo;
    open = false;
  } 

  void display() {
    image(brush, xPos, yPos, w, h);
    if (open == true) {
      //display information card
    image(info, xPos, yPos + 200);
    }
  }
}
