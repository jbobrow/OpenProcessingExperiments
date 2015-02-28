
float clocksize;
float clockposX;
float clockposY;
float ms;
float speed;

float buttonx;
float buttony;
float buttonsize;
float map_y;
float slidermax;
float slidermin;

//earth
float eday = 24;
float etime;
float elast;

float eyear = 8760;
float eytime;
float eylast;

int edaycount;
int eyearcount;
//mercury
float mday = 1392;
float mtime;
float mlast;

float myear = 2088;
float mytime;
float mylast;

int mdaycount;
int myearcount;

//venus
float vday = 5832;
float vtime;
float vlast;

float vyear = 5376;
float vytime;
float vylast;

int vdaycount;
int vyearcount;
//mars
float maday = 24.75;
float matime;
float malast;

float mayear = 16464;
float maytime;
float maylast;

int madaycount;
int mayearcount;
//jupiter
float jday = 10;
float jtime;
float jlast;

float jyear = 103968;
float jytime;
float jylast;

int jdaycount;
int jyearcount;
//saturn
float sday = 10.5;
float stime;
float slast;

float syear = 258216;
float sytime;
float sylast;

int sdaycount;
int syearcount;
//uranus
float uday = 17.25;
float utime;
float ulast;

float uyear = 736440;
float uytime;
float uylast;

int udaycount;
int uyearcount;
//neptune
float nday = 16;
float ntime;
float nlast;

float nyear = 1444536;
float nytime;
float nylast;

boolean buttonyon = false;
boolean start = false;

int ndaycount;
int nyearcount;
void setup(){
  size(500, 300);
  background(255);
  smooth();
  
  clockposX = width/8;
  clockposY = height/4;
  clocksize = width/12;
  elast=millis();
  
  buttonsize = clocksize/3;
  slidermax = width - width/3;
  slidermin = width/3;
  buttonx = width/2;
  buttony = height-height/5 - buttonsize/2;
  
}

void draw(){
  
  
  background(0);
   ms = millis();
  noStroke();
 if (start == true){ 
  ////////////////////////////////////////////////////////////////////////////////////////
  //slider////////////////////////////////////////////////////////////////////////////////////////
  
   if ((mouseX>=buttonx)&&(mouseX<=buttonx+buttonsize)&&(mouseY>=buttony)&&(mouseY<= buttony+buttonsize)){
   
   cursor(HAND);
}

else{
  
  cursor(ARROW);
}

if ((mousePressed)&&(mouseX>=buttonx)&&(mouseX<=buttonx+buttonsize)&&(mouseY>=buttony)&&(mouseY<= buttony+buttonsize)){
  buttonyon = true;
}
if (buttonyon == true){
  buttonx = mouseX;
}

if (buttonx < slidermin-buttonsize/2){
  
  buttonx = slidermin - buttonsize/2;
}

if (buttonx > slidermax- buttonsize/2){
  
  buttonx = slidermax - buttonsize/2;
}
  println(buttonx);


map_y = (map(buttonx, width/3 - buttonsize/2, width - width/3 - buttonsize/2, 5, 0.01));

  speed = map_y;
   int sped = int(10/speed);
 //////////////////////////////////////////////////////////////////////////////////////// 
 //clocks//////////////////////////////////////////////////////////////////////////////////////// 
  //earth clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-elast>100) {
   etime = etime + 360/eday/speed;
    elast=ms;
    }
    
    if (etime> 360) {
      etime = 0;
      edaycount += 1;
    }
 fill(#1A8625);
    arc(clockposX, clockposY, clocksize, clocksize,radians(270), radians(270 + etime));
}  
     //earth clock years//////////////////////////////////////////////////////////////////

    if(ms-eylast>100) {
   eytime = eytime + 360/eyear/speed;
    eylast=ms;
    }
    
    if (eytime> 360) {
      eytime = 0;
      eyearcount += 1;
    }
 fill(#1A8625,100);
    arc(clockposX, clockposY, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + eytime));
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //mercury clock//////////////////////////////////////////////////////////////////

    if(ms-mlast>100) {
   mtime = mtime + 360/mday/speed;
    mlast=ms;
    }
    
    if (mtime> 360) {
      mtime = 0;
      mdaycount += 1;
    }
 fill(#838390);
    arc(clockposX*3, clockposY, clocksize, clocksize,radians(270), radians(270 + mtime));

     //mercury clock years//////////////////////////////////////////////////////////////////

    if(ms-mylast>100) {
   mytime = mytime + 360/myear/speed;
    mylast=ms;
    }
    
    if (mytime> 360) {
      mytime = 0;
      myearcount += 1;
    }
 fill(#838390,100);
    arc(clockposX*3, clockposY, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + mytime));
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////     
     //Venus clock//////////////////////////////////////////////////////////////////

    if(ms-vlast>100) {
   vtime = vtime - 360/vday/speed;
    vlast=ms;
    }
    
    if (vtime< -360) {
      vtime = 0;
      vdaycount += 1;
    }
fill(#F2DB84);
    arc(clockposX*5, clockposY, clocksize, clocksize,radians(270 + vtime),radians(270));
     //venus clock years//////////////////////////////////////////////////////////////////

    if(ms-vylast>100) {
   vytime = vytime + 360/vyear/speed;
    vylast=ms;
    }
    
    if (vytime> 360) {
      vytime = 0;
      vyearcount += 1;
    }
 fill(#F2DB84,100);
    arc(clockposX*5, clockposY, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + vytime));
      //mars clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-malast>100) {
   matime = matime + 360/maday/speed;
    malast=ms;
    
    }
    
    if (matime> 360) {
      matime = 0;
      madaycount += 1;
    }
 fill(#E80C05);
    arc(clockposX*7, clockposY, clocksize, clocksize,radians(270), radians(270 + matime));
}
         //mars year clock//////////////////////////////////////////////////////////////////

    if(ms-maylast>100) {
   maytime = maytime + 360/mayear/speed;
    maylast=ms;
    }
    
    if (maytime> 360) {
      maytime = 0;
      mayearcount += 1;
    }
 fill(#E80C05,100);
    arc(clockposX*7, clockposY, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + maytime));
 //jupiter clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-jlast>100) {
   jtime = jtime + 360/jday/speed;
    jlast=ms;
    
    }
    
    if (jtime> 360) {
      jtime = 0;
      jdaycount += 1;
    }
fill(#FF7605);
    arc(clockposX, clockposY*2.5, clocksize, clocksize,radians(270), radians(270 + jtime));
}
   //jupiter clock years//////////////////////////////////////////////////////////////////

    if(ms-jylast>100) {
   jytime = jytime + 360/jyear/speed;
    jylast=ms;
    }
    
    if (jytime> 360) {
      jytime = 0;
      jyearcount += 1;
    }
 fill(#FF7605,100);
    arc(clockposX, clockposY*2.5, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + jytime));
      
 //saturn clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-slast>100) {
   stime = stime + 360/sday/speed;
    slast=ms;
    }
    
    if (stime> 360) {
      stime = 0;
      sdaycount += 1;
    }
fill(#FFC800);
    arc(clockposX*3, clockposY*2.5, clocksize, clocksize,radians(270), radians(270 + stime));
}
//saturn clock years//////////////////////////////////////////////////////////////////

    if(ms-sylast>100) {
   sytime = sytime + 360/syear/speed;
    sylast=ms;
    }
    
    if (sytime> 360) {
      sytime = 0;
      syearcount += 1;
    }
 fill(#FFC800,100);
    arc(clockposX*3, clockposY*2.5, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + sytime));
             
 //Uranus clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-ulast>100) {
   utime = utime - 360/uday/speed;
    ulast=ms;
    }
    
    if (utime< -360) {
      utime = 0;
      udaycount += 1;
    }
 fill(#83B3B7);
    arc(clockposX*5, clockposY*2.5, clocksize, clocksize,radians(270 + utime),radians(270));
}
      //uranus clock years//////////////////////////////////////////////////////////////////

    if(ms-uylast>100) {
   uytime = uytime + 360/uyear/speed;
    uylast=ms;
    }
    
    if (uytime> 360) {
      uytime = 0;
      uyearcount += 1;
    }
 fill(#83B3B7,100);
    arc(clockposX*5, clockposY*2.5, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + uytime));
  
  //neptune clock//////////////////////////////////////////////////////////////////
if(sped<48){
    if(ms-nlast>100) {
   ntime = ntime + 360/nday/speed;
    nlast=ms;
    }
    
    if (ntime> 360) {
      ntime = 0;
      ndaycount += 1;
      
    }
fill(#19259B);
    arc(clockposX*7, clockposY*2.5, clocksize, clocksize,radians(270), radians(270 + ntime));
}
   //neptune clock years//////////////////////////////////////////////////////////////////

    if(ms-nylast>100) {
   nytime = nytime + 360/nyear/speed;
    nylast=ms;
    }
    
    if (nytime> 360) {
      nytime = 0;
      nyearcount += 1;
    }
 fill(#19259B,100);
    arc(clockposX*7, clockposY*2.5, clocksize*1.5, clocksize*1.5,radians(270), radians(270 + nytime));       
  //////////////////////////////////////////////////////////////////////////////////////
  //text////////////////////////////////////////////////////////////////////////////////
 
 
 PFont font;
 font = loadFont("Helvetica-100.vlw");
 textFont(font);

 textSize(clocksize/2);
 fill(250);
 textAlign(LEFT);
 
 

 
 textAlign(CENTER);
 
 fill(200);
 textSize(clocksize/4);
 text("Earth", clockposX, clockposY-clocksize);
 text("Mercury",clockposX*3, clockposY-clocksize);
 text("Venus",clockposX*5, clockposY-clocksize);
 text("Mars",clockposX*7, clockposY-clocksize);
 text("Jupiter",clockposX, clockposY*2.5-clocksize);
 text("Saturn",clockposX*3, clockposY*2.5-clocksize);
 text("Uranus",clockposX*5, clockposY*2.5-clocksize);
 text("Neptune",clockposX*7, clockposY*2.5-clocksize); 
 
 


fill(200);
 textSize(clocksize/4);
 float sped2 = float(sped);
 int sped3 = int(sped2/24);
 
 String h = "hours or";
 String c =  Integer.toString(sped);
 String d = Integer.toString(sped3);
 float cw = textWidth(c);
 float hw = textWidth(h);
 float dw = textWidth(d);

 textAlign(RIGHT);
 text("1 second =", width/2-buttonsize/10, height-height/5+buttonsize+10);
 textAlign(LEFT);
 text (c, width/2, height-height/5+buttonsize+10);
 text(h,width/2+cw+buttonsize/10,height-height/5+buttonsize+10);
 text(d, width/2+cw+buttonsize/10*2+hw,height-height/5+buttonsize+10);
 text("days", width/2+cw+buttonsize/10*3+hw+dw,height-height/5+buttonsize+10);
 
 
 

 
 
 textSize(clocksize/6);
 fill(200);
 
 
 pushMatrix();
 translate(clockposX, clockposY);
 rotate(radians(270));
 text("Day",0, 0);
 text("Year",clocksize/2, 0);
 translate(0, clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
  translate(0, clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
  translate(0, clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
   translate(-clockposY*1.5, 0);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
   translate(0, -clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
  translate(0, -clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
   translate(0, -clockposX*2);
 text("Day",0, 0);
  text("Year",clocksize/2, 0);
 popMatrix();

 stroke(255);
 fill(255);
 line(slidermax, height-height/5, slidermin, height-height/5);
 rect(buttonx, buttony, buttonsize , buttonsize); 
 }
 
}
void mousePressed(){
  start = true;
}

void keyPressed() {
  start = false;
}

void mouseReleased(){
  
  buttonyon = false;
  
}


