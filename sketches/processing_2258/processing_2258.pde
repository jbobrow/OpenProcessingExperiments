
import controlP5.*;
//regler setValue
int h = 128;
int s = 128;
int b = 128;
int transp = 128;
int x;
int y;
int i = 0; //mouse check counter
boolean inaktiv = false;
int radiusi = 200;
int radiusa = 400;
boolean prev = true;
int step = 15;
int[][] kreise = new int[0][11];
int anzahl = 0;
int contfrequenz = 0;
boolean xsw = false;
boolean ysw = false;
boolean freqsw = false;
boolean hsw = false;
boolean ssw = false;
boolean bsw = false;
boolean transsw = false;
boolean radasw = false;
boolean radisw = false;
boolean klickpaint = true;
Controller contx, conty, conth, conts, contb, contfreq, conttrans, contrandoms, contradius;


ControlP5 cp5;

void setup(){
  size (800,600);//(screen.width,screen.height);
  x = width/2; y=height/2;
  background (255);
  cp5 = new ControlP5(this);
  smooth();
  navi();
}

void draw(){
  background (255);
  for(int i=0; i<kreise.length; i++) {
    if(kreise[i][0]>=0)maler(i, kreise[i]);
  }
   mousecheck();
  contx.setValue ( x );
  conty.setValue ( y );
  conth.setValue( h );
  conts.setValue( s );
  contb.setValue( b );
  contfreq.setValue( contfrequenz );
  conttrans.setValue( transp );
 // contradius.setHighValue ( radiusa );
 // contradius.setLowValue ( radiusi );

 
  if (prev) preview();
}

  void navi2(){
  colorMode(RGB);
  fill (50,50,50,150);
  rect (0,0,230,600);
  colorMode(HSB);
  fill (h,s,b,transp);
  noStroke(); 
  rect (150,95,35,35);
}

void xsw(){xsw=!xsw;}
void ysw(){ysw=!ysw;}
void freqsw(){freqsw=!freqsw;}
void hsw(){hsw=!hsw;}
void ssw(){ssw=!ssw;}
void bsw(){bsw=!bsw;}
void transsw(){transsw=!transsw;}
void radasw(){radasw=!radasw;}
void radisw(){radisw=!radisw;}

void navi(){
  contx = cp5.addKnob( "x", 0, width, x, 10, 250, 50 );
  conty = cp5.addKnob( "y", 0, height, y, 140, 250, 50 );
  contfreq = cp5.addSlider( "frequenz", 10, 99, 50, 10, 190, 150, 20 );
  conth = cp5.addSlider( "h", 0,255, h, 6, 10, 20, 120 );
  conts = cp5.addSlider( "s", 0,255, s, 42, 10, 20, 120 );
  contb = cp5.addSlider( "b", 0,255, b, 78, 10, 20, 120 );
  conttrans = cp5.addSlider( "transp", 0,255, transp, 114, 10, 20, 120 );
  contradius = cp5.addRange( "radius", 0, height, 200, 400, 10, 370, 120, 20 );
  cp5.addButton( "back", -12, 10, 575, 40, 15 );
  cp5.addButton( "prev", -12, 10, 555, 40, 15 );
  cp5.addButton( "clear", -12, 60, 575, 40, 15 );
  cp5.addButton( "zufall", -12, 60, 555, 40, 15 );
  cp5.addBang( "print", 140, 527, 50, 50 );
  cp5.addSlider( "randomslider", 0, 200, 0, 10, 450, 150, 20 );
  cp5.addToggle( "xsw" ,  10, 320, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "ysw" ,  140, 320, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "freqsw" ,  10, 215, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "hsw" ,  6, 140, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "ssw" ,  42, 140, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "bsw" ,  78, 140, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "transsw" ,  114, 140, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "radasw" ,  110, 395, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "radisw" , 10, 395, 20, 20 ).setColorActive(color(255,0,0));
  cp5.addToggle( "klickpaint" , 10, 500, 20, 20 ).setColorActive(color(255,0,0));
} 

void randomslider(int randomsl){
    clear();
    for (int i = 0; i<randomsl; i++){
      zufall();
      println(randomsl);
    }
  }

void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.controller().name().equals("radius")) {
    radiusi = int(theControlEvent.controller().arrayValue()[0]);
    radiusa = int(theControlEvent.controller().arrayValue()[1]);
  }
}

void zufall() {
  if (!xsw) x=round(random(width));
  if (!ysw) y=round(random(height));
  if (!radisw) radiusi=round(random(height));
  if (!radasw) radiusa=round(random(height-radiusi)+radiusi);
  if (radiusi>radiusa)radiusi = round(random(radiusa));
  if (!hsw) h=round(random(255));
  if (!ssw) s=round(random(255));
  if (!bsw) b=round(random(255));
  if (!transsw) transp=round(random(230)+25);
  if (!freqsw) frequenz(random(90)+9);
  print();  
}

void back(){
  kreise = (int[][])shorten(kreise);
}

void clear(){
  kreise = new int[0][11];
}

void print(){
 kreise = (int[][])append(kreise, new int[]{x,y,radiusa,radiusi,step,h,s,b,transp,radiusi,1});
}

void preview(){
  stroke (0); 
  strokeWeight (2);
  noFill();
  if (!klickpaint) {line (x-10,y,x+10,y);
  line (x, y-10,x, y+10);
  ellipse (x,y,radiusa,radiusa);
  ellipse (x,y,radiusi,radiusi);
  noStroke();
  }
  if (klickpaint) {line (mouseX-10,mouseY,mouseX+10,mouseY);
  line (mouseX, mouseY-10,mouseX, mouseY+10);
  ellipse (mouseX,mouseY,radiusa,radiusa);
  ellipse (mouseX,mouseY,radiusi,radiusi);
  noStroke();
  }
}

void frequenz(float freq){
  step = round(lerp (0, radiusa-radiusi, 1/freq));
  contfrequenz = int(freq);
}

void prev(){
  prev = !prev;
}

void maler(int i, int[] kreis){
  colorMode(HSB);
  noStroke();
  fill(kreis[5],kreis[6],kreis[7],kreis[8]);
  int rad=step(i, kreis[2],kreis[3],kreis[9],kreis[4],kreis[10]);
  ellipse(kreis[0],kreis[1],rad,rad);
}

int step(int i, int rada, int radi,int radius, int schritt, int updown) {
  if(radi>rada) kreise[i][10]=0;
  if(radi<radius) kreise[i][10]=1;
  updown=kreise[i][10];
  if(updown==1) radi=radi+schritt; 
  else radi-=schritt;
  kreise[i][3]=radi;
  return radi; 
}

void mouseClicked(){
i=0;

if (!(mouseX<230 && mouseY<600)&&klickpaint){
xsw = true;
ysw=true;
x= mouseX; y= mouseY;
zufall();
xsw=false;
ysw=false;
}
}

void mousecheck(){
if (pmouseX == mouseX && pmouseY == mouseY )
  i++; 
else i=0;

if (i >=150) inaktiv = true;
else inaktiv = false;

if (inaktiv) cp5.hide ();
if (!inaktiv) {navi2();cp5.show ();}
}

