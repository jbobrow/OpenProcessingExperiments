
import ddf.minim.*;
import processing.serial.*;
Serial port;
AudioMetaData meta[];
AudioPlayer player[];
Minim minim;
int gx=0,gy=0;
int x; int rw; int mel;
int serialIn = 0;
int playON=2,ok=1;
int sel=0,pSel=0,song=0;
PFont font;
PImage a,c,d,select;


void setup (){
  size (607, 134, P3D);
  background (#004012);
  player=new AudioPlayer[3];
  meta=new AudioMetaData[3];
  minim=new Minim(this);
  player[0]=minim.loadFile("Rock.mp3",2048);
  player[1]=minim.loadFile("feel.mp3");
  player[2]=minim.loadFile("calm.mp3");
  meta[0]=player[0].getMetaData();
  meta[1]=player[1].getMetaData();
  meta[2]=player[2].getMetaData();
  a = loadImage ("vr1_ammo.jpg"); 
  c=loadImage ("PPon.png");
  d=loadImage("Pson.png");
  select=loadImage("select.png");
//port = new Serial(this, Serial.list()[1], 9600); 
textFont(createFont("Serif", 14));
textMode(SCREEN);
font=loadFont("CourierNewPSMT-11.vlw");


}

void draw(){
  image (a, 0, 0);
player[sel].setGain(x);
playButton();
textDisplay();
fill(255);
textSize(14);
text(meta[0].author()+"-"+meta[0].title(),238,55);
text(meta[1].author()+"-"+meta[1].title(),238,75);
text(meta[2].author()+"-"+meta[2].title(),238,95);
select();
print("x");
print(mouseX);
print("y");
print(mouseY);
println();

/*if (port.available() > 0) {
 serialIn = port.read();
 x=serialIn-74;

//println(serialIn);
 }
 */
}
//==============Selected song rect
void select(){
  if (sel==0){image (select, 222,44,332,17);} 
  if (sel==1) image(select,222,64,332,17);
  if (sel==2) image(select,222,84,332,17);
}
//===============================

//===================Click Events
void mousePressed(){
//============Mouse position(x,y)
 gx=mouseX;
 gy=mouseY;
//===============================

//========================Song nr
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>44&&gy<56) sel=0;
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>64&&gy<76) sel=1;
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>84&&gy<96) sel=2;
//===============================

//==============Double click play
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>44&&gy<56&&mouseEvent.getClickCount()==2)
 {
   player[1].pause(); player[1].rewind();
   player[2].pause(); player[2].rewind();
   player[0].rewind();player[0].play(); 
   pSel=0; ok=0; playON=1; rw=0;
 }
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>64&&gy<76&&mouseEvent.getClickCount()==2)
 {
   player[0].pause(); player[0].rewind();
   player[2].pause(); player[2].rewind();
   player[1].rewind();player[1].play(); 
   pSel=1; ok=0; playON=1;rw=0;
 }
 if (mouseButton==LEFT&&gx>221&&gx<554&&gy>84&&gy<96&&mouseEvent.getClickCount()==2)
 {
   player[0].pause(); player[0].rewind();
   player[1].pause(); player[1].rewind();
   player[2].rewind();player[2].play();
   pSel=2; ok=0; playON=1;rw=0;
 }
 //=========================================
 

//=======================Play funct.(button)
if( song==0&&ok==1 &&mouseButton == LEFT){
  if (gx>29&&gx<67)
     if (gy>35&&gy<97)
        {
         player[sel].play(); 
         pSel=sel; ok=0; playON=1; rw=0; song=1;
       }  
}
//=========================================

//=====================Pause funct.(button)
if (ok==0 && mouseButton == LEFT)
{
  if (gx>76&&gx<94)
    if (gy>37&&gy<98)
    {
      //player[pSel].pause();
      player[0].pause();
      player[1].pause();
      player[2].pause(); 
      ok =1; playON=0; song=0;
    }
}  
//========================================

//===================Rewind funct. (button)
 if (mouseButton==LEFT&&gx>118&&gx<140&&gy>57&&gy<73)
 {
   player[pSel].rewind();
   player[pSel].pause();
   //player[0].rewind();
   //player[0].pause();
  //player[1].rewind();
   //player[1].pause();
  // player[2].rewind();
  // player[2].pause();
   playON=2; ok=1; rw=1; song=0;
 }
//========================================

//======================Next funct(button)
 if (mouseButton==LEFT&&sel<2&&pSel<2)
{
   pSel=sel;
   if (gx>175&&gx<199&&gy<76&&gy>56)
   { 
     player[0].rewind();player[0].pause();
     player[1].rewind();player[1].pause();
     player[2].rewind();player[2].pause();
     player[pSel].rewind();     
     player[pSel].pause();       
     sel=sel+1;
     player[sel].play();     
     
   }

}
//=======================================

//=============================Volume +/-
if (mouseButton==LEFT)
{
  if (gx>150&&gx<169)
  if (gy>25&gy<49)
  if (x<=6)
    x=x+5;
}
if (mouseButton==LEFT)
{
  if (gx>150&&gx<169)
  if (gy>83&&gy<107)
  if (x>=-55)
  x=x-5;
}
//======================================


  //if (rw==1&&mouseButton==LEFT&&gx>118&&gx<140&&gy>57&&gy<73&&sel!=0)
 // {
 //   player[sel-1].play();
 // }
  //if (ok==1&&playON==0) rw=0;
 //else if (ok==0&&playON==1) rw=1;
/*if ((mouseButton == LEFT)&& songOn==1 && gx<570 && gx> 520 && gy>180 && gy< 230){
 // player.rewind();player.pause();ok=1;}
if ((mouseButton == LEFT) && gx <570 && gx> 520 && gy>235 && gy< 285)
 {
if(songOn==1) player.pause();
  player=minim.loadFile(selectInput(),1024);
  songOn=1; ok=1;
 }}}*/}


//====================Rewind/Next/+ - text
void textDisplay()
{
 fill(0);
 textSize(11);
 //if (rw==0)
text("Rwd", 118,68);
text("Next",177,68);
text("+",157,39);
text("--",156,97);

 //if (rw==1) text("Prv",118,68); 
}
//================================

//=====Pause/play text&img display
void playButton(){
 // println(playON);
  fill(255,48,55);
  if (playON==0) {textSize(11);text("Pausing",224,39); image(d, 27,36);}
  else{
  if (playON==1){textSize(11);text("Playing",224,39);image(c, 27,36);}

}
}
//===============================

//=============Keyboard functions
void keyPressed()
{ if ( key == 'p'){player[sel].play(); playON=1;}
  if ( key == 'r' && playON==1 ) {player[sel].pause(); playON=0;}
  if ( key == 's' ) { delay(100);player[sel].rewind();delay(100); player[sel].pause();playON=2;}
 if (key == '='&&x<6){ x=x+1; ;}
 if (key == '-'&&x>-53) x=x-1;
}
//==============================

void stop()
{
  player[0].close();
  player[1].close();
  player[2].close();
  minim.stop(); 
  super.stop();
}

 


