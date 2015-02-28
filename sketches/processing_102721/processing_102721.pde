
/* @pjs preload=http://a1696.phobos.apple.com/us/r1000/077/Purple2/v4/9a/08/c5/9a08c55e-d6b9-5f52-ece3-fab3ca5bddc8/mzl.pjwzbxym.100x100-75.png,http://a1512.phobos.apple.com/us/r1000/099/Purple/v4/f2/2b/86/f22b86e2-8dd1-6cbd-f0da-12d8098dff61/mzl.yhyvmucx.100x100-75.png,http://a1228.phobos.apple.com/us/r1000/077/Purple2/v4/a0/e4/46/a0e446f1-73d3-67a4-c599-71054a067896/mzl.bnbpkmjt.100x100-75.png,http://a827.phobos.apple.com/us/r1000/035/Purple4/v4/06/32/e4/0632e4a1-1418-aebc-6401-e7dddca72bfe/mzl.yhxwxatp.100x100-75.png,http://a448.phobos.apple.com/us/r1000/060/Purple/v4/d4/fd/06/d4fd06e4-5362-a048-758d-59b66edef625/mzl.oypodsqh.100x100-75.png; */
PImage[] anim = new PImage[5]; 
int currentImage = 0;
String[] images = {"http://a1696.phobos.apple.com/us/r1000/077/Purple2/v4/9a/08/c5/9a08c55e-d6b9-5f52-ece3-fab3ca5bddc8/mzl.pjwzbxym.100x100-75.png","http://a1512.phobos.apple.com/us/r1000/099/Purple/v4/f2/2b/86/f22b86e2-8dd1-6cbd-f0da-12d8098dff61/mzl.yhyvmucx.100x100-75.png","http://a1228.phobos.apple.com/us/r1000/077/Purple2/v4/a0/e4/46/a0e446f1-73d3-67a4-c599-71054a067896/mzl.bnbpkmjt.100x100-75.png","http://a827.phobos.apple.com/us/r1000/035/Purple4/v4/06/32/e4/0632e4a1-1418-aebc-6401-e7dddca72bfe/mzl.yhxwxatp.100x100-75.png","http://a448.phobos.apple.com/us/r1000/060/Purple/v4/d4/fd/06/d4fd06e4-5362-a048-758d-59b66edef625/mzl.oypodsqh.100x100-75.png"};//new String[10]; 
String[] appurl = 
{"http://target.georiot.com/Proxy.ashx?tsid=1780&GR_URL=https://itunes.apple.com/us/app/clash-of-clans/id529479190?mt=8&uo=2&partnerId=30",
"http://target.georiot.com/Proxy.ashx?tsid=1780&GR_URL=https://itunes.apple.com/us/app/the-simpsons-tapped-out/id497595276?mt=8&uo=2&partnerId=30",
"http://target.georiot.com/Proxy.ashx?tsid=1780&GR_URL=https://itunes.apple.com/us/app/hay-day/id506627515?mt=8&uo=2&partnerId=30",
"http://target.georiot.com/Proxy.ashx?tsid=1780&GR_URL=https://itunes.apple.com/us/app/candy-crush-saga/id553834731?mt=8&uo=2&partnerId=30",
"http://target.georiot.com/Proxy.ashx?tsid=1780&GR_URL=https://itunes.apple.com/us/app/despicable-me-minion-rush/id596402997?mt=8&uo=2&partnerId=30"};
//String[] appurl = new String[5];
PImage app[] = new PImage[5];
float time =0;
boolean appOver = false;
ImageButtons button;
ImageButtons[] buttons = new ImageButtons[5];
  PImage b;

// initial position for app icon
float[] appicon_x = new float[5];
float[] appicon_y = new float[5];
// how much to move the app icon on each frame
float[] move_x = new float[5]; //2
float[] move_y = new float[5]; //-2


void setup()
{
  //background (50);
  size (500, 500); 
  b = loadImage("test.png");
  //button = new ImageButtons(x,y,w,h,b);
  
  /* XML part doesn't work in JS */
  /*
  
// Load RSS feed   
String url = "https://itunes.apple.com/us/rss/topgrossingapplications/limit=10/xml?partnerId=30&LS_PARAM=http://target.georiot.com/Proxy.ashx?tsid=1780&GR;_URL=";   

XML rss = loadXML(url);   
// Get title of each element   
//XMLElement[] titleXMLElements = rss.getChildren("channel/item/title"); 
XML[] titleXMLElements = rss.getChildren("entry/im:name");
XML[] imageXMLElements = rss.getChildren("entry/im:image");
XML[] linkXMLElements = rss.getChildren("entry/id");
///////for (int i = 0; i < titleXMLElements.length; i++) { 
     */ 
     
for (int i = 0; i < 5; i++) {   
    ///String title = titleXMLElements[i].getContent();
    ///text(title, int (random (0,400)), int (random (0,400)));
     ///images[i] = imageXMLElements[i*3+2].getContent(); // 100x100 XML disabled
appicon_x[i] = random(0,400); appicon_y[i] = random(0,400);  // random start location for each
move_x[i] = random(0,5); move_y[i] = 0 - random(0,5);  // random speed & angle for each
       app[i] = loadImage(images[i]);
    /// appurl[i] = linkXMLElements[i].getContent();    // XML disabled
    /// println(i + ": " + title + images[i] + appurl[i]);    
    

}   
//link("link");
//PImage app1 = loadImage(images[1]);
//image (app[0],0,0,100,100);

///////for (int i = 0; i < titleXMLElements.length; i++) {
//for (int i = 0; i < 5; i++) {
        //image(app[i],i*100,0,100,100);
        //image(app[i],int (random (0,400)), int (random (0,400)),100,100);}

//anim = loadImages(app,10);
}


void draw()
{
  
noStroke();
fill(255,55); // fade background
rect(0,0,500,500);  


  int x = width/2 - b.width/2;
  int y = height/2 - b.height/2; 
  int w = b.width;
  int h = b.height;



  
//image(app[currentImage],int (random (0,400)), int (random (0,400))); // fill in the screen
//currentImage+=1;
//if (currentImage >= app.length) currentImage = 0;

for (int l = 0; l < 5; l++) {
 
//image(app[l],appicon_x[l],appicon_y[l]); // moving app icons

buttons[l] = new ImageButtons(int(appicon_x[l]),int(appicon_y[l]),100,100,app[l],appurl[l]); 

//button = buttons[l]; 
  
  buttons[l].update();
  buttons[l].display();
  
  
  appicon_x[l] = appicon_x[l] + move_x[l];
  appicon_y[l] = appicon_y[l] + move_y[l];
  
  if(appicon_x[l] > width-100) { //right
    appicon_x[l] = width-100;
    move_x[l] = -move_x[l];
  }
  if(appicon_y[l] > height-100) { // bottom
    appicon_y[l] = height-100;
    move_y[l] = -move_y[l];
  }
  if(appicon_x[l] < 0) { // left
    appicon_x[l] = 0;
    move_x[l] = -move_x[l];
  }
  if(appicon_y[l] < 0) { // top
    appicon_y[l] = 0;
    move_y[l] = -move_y[l];
  }


  }

}


  boolean over = false;
  boolean pressed = false; 
class Buttons {
  int x, y;
  int w, h;
  //color basecolor, highlightcolor;
  //color currentcolor;

 
  


  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) return true; else return false;
  }
}

class ImageButtons extends Buttons 
{
  PImage img;
  String url;
  ImageButtons(int ix, int iy, int iw, int ih, PImage im, String appurl) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    img = im;
    url = appurl; 
  }

  void over() {
    if( overRect(x, y, w, h) )  over = true; else over = false;
  }

  void pressed() {
    if(over && mousePressed) 
    {pressed = true; 
     link(url,"_new"); // open app link
     pressed = false;
    } 
     else pressed = false;
  }
  
  
  void update() {
    over();
    pressed();
    if(pressed) 
      {
        pressed = false;
      } else {
      pressed = false;  
      }  
  }

 void display() 
  {
    image(img, x, y);
  }

}





void mousePressed()
{

  //link("http://freelifeapps.com/top10"); 

  //currentImage = 0;
  
  //for (int i = 0; i < titleXMLElements.length; i++) {
  
  //if(dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].width/2){
    
    //link(app[i]);
  
  //link(appurl);
  //app[0].translate (int (random (5,20)), int (random (5,20)));
  
  ///translate(width/2, height/2);
  
  ///time=time+0.01;
  ///for (int i= 0; i<20; i++) {
    //pushMatrix();
///rotate(2);
  
//rect(int (random (5,20)), int (random (5,20)), 50, 50);
//popMatrix();}
}
