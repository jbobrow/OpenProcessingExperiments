
int randomRed = round(random(0,30));
int randomBlue = round(random(155,255));
int randomGreen = round(random(0,105));
float controlParam = 0.7;

void placeRubberStamp (float px, float py, float controlParam){ 
  /*controlParam will control the shade of blue that the TARDIS is,
  and will be a float between 0 and 1 (not inclusive)*/
  smooth();
  strokeWeight(2);
  int r = round(controlParam*randomRed);
  int b = round(controlParam*randomBlue);
  int g = round(controlParam*randomGreen);
  fill(r,g,b);
  int w = 200; //width
  int h = 350; //height
  rect(px,py,w,h);
  line(px+(w/2),py, px+(w/2),py+h);
  fill(0);
  int bannerHeight = 20;
  int bannerDepth = 30;
  rect(px,py+bannerDepth,w,bannerHeight);
  fill(255);
  text("POLICE PUB CALL BOX",px+2*bannerHeight,py+1.5*bannerDepth);
  int lightWidth = 20;
  int lightHeight= 30;
  int margin = 50;
  rect(px+(w/2)-(lightWidth/2),py-margin+lightHeight,lightWidth,lightHeight);
  int windowWidth = 70;
  int windowHeight = 100;
  int windowMargin = 20;
  rect(px+windowMargin,py+.7*windowHeight,windowWidth,windowHeight);
  rect(px+2*windowMargin+windowWidth,py+.7*windowHeight,windowWidth,windowHeight);
  rect(px+windowMargin,py+1.7*windowHeight+windowMargin,windowWidth,windowHeight);
}

void setup(){
  size(850,850);
}

void draw(){
  smooth();
}

 int w = 200; //width
 int h = 350; //height
  
void mousePressed(){
  placeRubberStamp(mouseX-(w/2),mouseY-(h/2),controlParam);
  controlParam = random(0.1,0.9);
}
