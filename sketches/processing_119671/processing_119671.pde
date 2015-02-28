
float start;
float count;
float _y;
PImage img;
float maxcount = 60000;
float mincount = 0;
float maxy = 480;
float miny = 200;
int _maxy = 480;
float maxy2 =760;
float miny2 =560;
float yy;

void setup(){
  size (600,800);
  img = loadImage("hourglass_front-05.png");
  start = millis();
  count = 60;
  println(count);
  frameRate = 60;
  rectMode(CORNERS);
}
  void draw(){
   timinute();
   if (!mousePressed)
    return;

timinute();}
  void timinute(){ 
  if( (millis()-start) >= 1000 ){
  start = millis();
  count--; 
  
  if (count < 0) {
    count = 0; } 
  _y = map(millis(),mincount,maxcount,miny,maxy);   //mapping the upper rect to millis
  yy = map(millis(),mincount,maxcount,maxy2,miny2);   //mapping the upper rect to millis
  
  if (_y>480){
    _y=maxy;}
  
  background(#231F20);
  fill(#DDD485);
  rect(2,_y,598,_maxy); //upper rect
  rect(2,yy,598,maxy2);//2nd rect coming from below
  image(img,0,0,600,960);
  fill(#231F20);
  }
}


