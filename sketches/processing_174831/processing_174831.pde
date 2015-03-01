
// 前と同じで、やるべきことは二つの関数を用意する
// あとはKAMEコマンドを呼ぶだけ
int j;
float x=180;


 void setup(){
  size(360,360);
  frameRate(10);
  scale(1);
              }
              
 void draw() {
  loop();
  background(#ffffff);
  strokeWeight(mouseY/60);//
  iro(#ffffff);//
  x += (mouseX - x) / 180;
 
   saisho(width/2.,height/2.-30);
   for (int len=30;len<180;len++) { 
   akarusa(len*1.1);
   nami(len,5,3);//nami(len,5,3);//nami(長さ, 振動する幅, 波の数);
   migi(x);
   janpu(-len);
                                  }
              }
                                  
void mousePressed(){j++;if(j%2!=0) {noLoop();println(mouseX);println(x);}else{loop();}}
/*void mousePressed() {println(frameCount);}*/
/*  Program: 2DKAME Command Libraly

     Author: Classiclll
             Mail classiclll_jp@yahoo.co.jp
             Blog http://blogs.yahoo.co.jp/classiclll_jp
             Web  http://www.geocities.jp/classiclll/

 Turtle cmds: draws a footprint as you say             
             He can understand the following commands.
             
             usagi()        :   Make all moves in one frame
             kame()         :   Make each move for each frame(fastest)
             kame(speed)    :   Make each move for some frame at rate(1 is slowest)
             janpu(steps)   :   Move "steps" in the current direction without lines
             muki(degree)   :   Turn "degrees" (plus->to left, minus->to right)
             hidari(degrees):   Turn "degrees" left (minus->to right)
             migi(degrees)  :   Turn "degrees" right(minus->to left)
             koko()         :   Remember the current position and direction
             sakki()        :   Recall the latest position and direction in memory 
             saisho(x,y,dir):   Forget all, and Locate the specified position and direction
             mannaka()      :   Forget all, and jump to the center position
             kesu()         :   Erase all drawings (to a white paper)
             kami()         :   Erase all drawings (to a white paper)
             kami(clr)      :   Erase all drawings (to a colored paper)
             kami(r,g,b)    :   Erase all drawings (to a colored paper)
             iro(clr)       :   Set the line color by color value
             iro(r,g,b)     :   Set the line color by Red,Green,Blue
             iroai(h)       :   Set the line's hue (saturation & brightness are not chaged)
             azayakasa(s)   :   Set the line's saturation (hue & brightness are not chaged)
             akarusa(b)     :   Set the line's brightness (hue & saturation are not chaged)
             futosa(width)  :   Set the line boldness, based by pixels.
*/
  

//Turtle command
float currentHue=0, currentSaturation=255, currentBrightness=255;
long toDrw=0;
boolean toSlow = false;
float kameRate = 1;

  void usagi()  {  //   Make all moves in one frame
    toSlow = false;
  }
  void kame()  {  //   Make each move for each frame(fastest)
    kame(30);
  }
  void kame(int speed)  {  //   Make each move for some frame at rate(1 is slowest)
    kameRate = 30./max(1., speed);
    toSlow = true;
  }
  void mae(float step)  {  //   Move "steps" in the current direction with a line
    if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
      line(0,0,0,step);
    }
    toDrw++;
    janpu(step);
  }
  void janpu(float step)  {  //   Move "steps" in the current direction without lines
    translate(0, step);
  }
  void muki(float degree) { //  Turn "degrees" (plus->to left, minus->to right)
    if ( toSlow && int(frameCount/kameRate)==toDrw ) {
      kameDraw(0);toDrw++;
    }
    rotate(radians(degree));
  }
  void migi(float degree){ //  Turn "degrees" left (minus->to right)
    muki(degree);
  }
  void hidari(float degree){//  Turn "degrees" right(minus->to left)
    muki(-degree);
  }
  void koko()  {  //   Remember the current position and direction
   pushMatrix();
  }
  void sakki()  {  //   Recall the latest position and direction in memory 
   popMatrix();
  }
  void saisho(float xloc, float yloc, float dir) {
                   //   Forget all, and Locate the specified position and direction
    saisho(xloc, yloc);
    rotate(radians(dir));
  }
  void saisho(float xloc, float yloc) {
                   //   Forget all, and Locate the specified position and direction
   resetMatrix();
   translate(xloc, yloc);
   toDrw = 0;
  }
  void mannaka() {   //  Forget all, and jump to the center position
   saisho(width/2,height/2,0);
  }
  void kesu() { // Erase all drawings
   kami(255);
  }
  void kami() { // Erase all drawings
   kami(255);
  }
  void kami(int cl) { // Erase all drawings
   background(cl);
  }
  void kami(int r, int g, int b) { // Erase all drawings
   background(r, g, b);
  }
  void iro(int cl) { // Pen color
   setRGBtoHSB(cl);
   stroke(cl);
  }
  void iro(int r, int g, int b) { // Pen color
   setRGBtoHSB(r, g, b);
   stroke(getRGBfrmHSB());
  }
  void iroai(float h) { // Pen color, Hue
   currentHue = h;
   stroke(getRGBfrmHSB());
  }
  void azayakasa(float s) { // Pen color, Saturation
   currentSaturation = s;
   stroke(getRGBfrmHSB());
  }
  void akarusa(float b) { // Pen color, Brightness
   currentBrightness = b;
   stroke(getRGBfrmHSB());
  }
  void futosa(float width) { // Pen weight
   strokeWeight(width);
  }
  void setRGBtoHSB(int cl) {
    color cll=cl;
    currentHue = hue(cll);
    currentSaturation = saturation(cll);
    currentBrightness = brightness(cll);
  }
 private void setRGBtoHSB(int r, int g, int b) {
    color cl = color(r,g,b);
    currentHue = hue(cl);
    currentSaturation = saturation(cl);
    currentBrightness = brightness(cl);
  }
 private color getRGBfrmHSB() {
    colorMode(HSB);
    color toRet = color(currentHue,currentSaturation,currentBrightness);
    colorMode(RGB);
    return toRet;
  }

private void kameDraw(float step) {
  ellipse(0, step+1, 4, 4);
  ellipse(0, step-6, 8, 10);
  ellipse(0, step-6, 4, 5);
//
  ellipse(-4,step-2,2,2);
  ellipse(4,step-2,2,2);
  ellipse(-5,step-8,2,2);
  ellipse(5,step-8,2,2);
//
  line(0,step-10,0,step-13);
}
 /*
 
        Author:chestnut
          Blog http://blogs.yahoo.co.jp/re_chestnut
               http://blogs.yahoo.co.jp/chestnut_chipmunk
          Web  http://www.geocities.jp/chestnut_chipmunk/index.html
 
                        
                     -----Library for KAME-----
          void nami(float step, float sinpuku, int syuuhasuu);
          void cycloid(float step, int num);
          void bane(float step, int num, float nejire);
          void koch(float step, float len);
          void fnami(float step, float sinpuku, int num);           */



void nami(float step, float sinpuku, int syuuhasuu) {
  float seido = 8;
  if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
    noFill();
    beginShape();
    curveVertex(0, 0);
    for(float i = 0; i <= syuuhasuu * seido; i++){
        curveVertex(sinpuku * sin(i * TWO_PI / seido),
                    i * step / syuuhasuu / seido);
    }
    curveVertex(0, step);
    endShape();
  }
  toDrw++;
  janpu(step);
}

void cycloid(float step, int num) {
  float seido = 8;
  float radian = step / (num * TWO_PI);
  if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
    noFill();
    beginShape();
    curveVertex(0, 0);
    for(float i = 0; i <= num * TWO_PI;i += TWO_PI / seido){
        curveVertex(radian * (1 + cos(i - PI)),
                    radian * (i + sin(i - PI)));
    }
    curveVertex(0, step);
    curveVertex(0, step);
    endShape();
  }
  toDrw++;
  janpu(step);
}

void bane(float step, int num, float nejire) {
  float seido = 8 * nejire;
  float radian = step / (num * TWO_PI);
  if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
    noFill();
    beginShape();
    curveVertex(0, 0);
    for(float i = 0; i <= num * TWO_PI;i += TWO_PI / seido){
        curveVertex(radian * (1 + cos(nejire * i - PI)),
                    radian * (i + sin(nejire * i - PI)));
    }
    curveVertex(0, step);
    curveVertex(0, step);
    endShape();
  }
  toDrw++;
  janpu(step);
}

void koch(float step, float len) {
    if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
      kochCalculate(0, 0, 0, step, len);
    }
    toDrw++;
    janpu(step);
}

void kochCalculate(float startx, float starty, float endx, float endy, float len) {
  float x1, y1, x2, y2, x3, y3;
  if(len <= dist(startx, starty, endx, endy)) {
    x1 = startx + (endx - startx) / 3; y1 = starty + (endy - starty) / 3;
    x2 = endx - (endx - startx) / 3;  y2 = endy - (endy - starty) / 3;
    x3 = x1 + (x2 - x1) * cos(PI / 3) - (y2 - y1) * sin(PI / 3);
    y3 = y1 + (x2 - x1) * sin(PI / 3) + (y2 - y1) * cos(PI / 3);
    kochCalculate(startx, starty, x1, y1, len);
    kochCalculate(x1, y1, x3, y3, len);
    kochCalculate(x3, y3, x2, y2, len);
    kochCalculate(x2, y2, endx, endy, len);
  }
  else line(startx, starty, endx, endy);
}
  
void fnami(float step, float sinpuku, int num) {
    if ( !toSlow || int(frameCount/kameRate)>toDrw ) {
      for(float i=1; i <= step; i ++)
      line(sinpuku * f(step, i - 1, num), i - 1,
           sinpuku * f(step, i, num), i);
    }
    toDrw++;
    janpu(step);
}

float f(float step, float x, int num){
  float y=0;
  for(float i = 0; i <= num; i++){
    y+=pow(2, -i) * sin(pow(2, i) * TWO_PI * (x / step));
  }
  return y;
}


