
PImage cat;
PImage bg;
int c;// 
int lastTime; 
int posX;
int posY;

void setup() {
  size(799, 481);
  bg = loadImage ("timesSquare.png");
}

void draw() {
  image(bg,0,0);
  posX = 0;
  posY= 0;

  String url = "feed://www.earthcam.com/rss.php";
  String[] xmlArray = loadStrings("http://www.earthcam.com/rss.php");
  for (int i = 0; i < xmlArray.length; i++) {
    String listItem = xmlArray[i]; 
    if (listItem.indexOf("camshots")>=0)
    {
      String fileName = listItem.substring(12, 94);
      println (fileName);
      cat = loadImage (fileName);
      image(cat, posX, posY, 200, 120);
      posX = posX + 200;
      if (posX>800) {
        posY= posY + 120;
        posX = 0;
      }
    }
  }
}



