
/**
 * Made by Guigui - 3/12/2009<br>
 * inspired by<br>
 * <a href="http://www.contextfreeart.org/gallery/view.php?id=2135" title="Shady Illusion">Shady Illusion</a><br>
 * itself inspired by<br>
 * <a href="http://www.fogonazos.es/2009/11/no-es-una-ilusion-optica-es-que-tu.html" title="fogonazos">This page</a><br>
 * <br>
 * Press any key to french it ;^)<br>
 * Press the spacebar to toggle the background.<br>
 * <br>
 * It seems to work well with brightness value:<br>
 * I can easily see the difference beetween the colored bars with no line where I don't with it.<br>
 * Also the illusion get stronger if I focus a while.<br>
 * And, it's working better with the middle bars.<br>
 * <br>
 * With saturation, it's almost hard to see the difference with no line.<br>
 * (± 7.5% is my limit (with the line))<br>
 * <br>
 * And small hue variation seems to be more easy to catch, just a litle bit harder with the line.<br>
 * (± 3% is my limit)<br>
 * <br>
 * The limitation of the illution may depend of a lot of things:<br>
 * not only our personal sensibility (itself dependant of our eyestrain) but also the screen used, etc…<br>
 * But not the color used (for me).<br>
 * <br>
 * If you have the time, you can tell your limits in the comments (particularly the brightness one).
 */
PFont Andale;
slideBar[] controls;
String[] tx;
color    C_Fd    = color(0)              ;    // background color
color    C_Tr    = color(255)            ;    // fill color
color    C_TM    = color(255)            ;    // temp buffer color
boolean  Fr      = false                 ;    // langue
float    Anim    = 0.0001                ;    // to animate the opening of the sketch (from 0 to 100)
int      Sat     = 100                   ;    // start anim time (in millis)
int      Eat     = 600                   ;    // end anim time
int      clic    = 0                     ;    // for the mouse management
int      nb_C    = 5                     ;    // number of colored bars
float    line_CP = -20                   ;    // the current vertical position for the line
float    line_TP = -20                   ;    // the target vertical position for the line
// -------------------------------------------------------------
void setup() {
  size(900, 600);
  colorMode(HSB, 360, 1, 1);
  Andale = loadFont("AndaleMono-15.vlw");
  textFont(Andale, 15);
  smooth();
  controls    = new slideBar[4];
  controls[0] = new slideBar( 1 , (width/2)-100 ,        65 ,               200 ,   16 ,   -10 ,  10 , 6  , (width/2)    );
  controls[1] = new slideBar( 2 , (width/2)-100 ,        85 ,               200 ,   16 ,   -10 ,  10 , 8  , (width/2)    );
  controls[2] = new slideBar( 3 , (width/2)-100 ,       105 ,               200 ,   16 ,   -10 ,  10 , 10 , (width/2)-30 );
  controls[3] = new slideBar( 4 , (width/4)     , height-36 ,   width-(width/2) ,   16 ,     0 , 360 , 12 , width/3      );
  tx     = new String[14];
  tx[0]  = "Because of the line, your eye may not see the difference between the color around it.";
  tx[1]  = "De chaque coté de la ligne, la variation de couleur peut nous échapper.";
  tx[2]  = "There must be a limit for this optical illusion. Let's find yourse.";
  tx[3]  = "Il y a un niveau de tolérance à cette illusion d'optique. Quelle-est la votre?";
  tx[4]  = "Maybe the color used is important.";
  tx[5]  = "Et avec une autre teinte?";
  tx[6]  = "hue(±10 %)";
  tx[7]  = "teinte(±10 %)";
  tx[8]  = "saturation(±10 %)";
  tx[9]  = "saturation(±10 %)";
  tx[10] = "brightness(±10 %)";
  tx[11] = "luminosité(±10 %)";
  tx[12] = "hue(360°)";
  tx[13] = "teinte(360°)";
}
// -------------------------------------------------------------
void draw() {
  Anim = (millis() < Eat) ? sin( (millis() < Sat) ? 0.0001 : 0.0001+float(millis()-Sat)/(Eat-Sat)*PI/2)*100 : 100;
  // useless, of course…
  fill(C_Fd);
  noStroke();
  translate(0, (100-Anim)*float(height)/200);
  scale(1,Anim/100);
  rect(0, 0, width,height);
  for(int a=0;a<nb_C;a++){
    fill(
    controls[3].val+(a-nb_C/2)*controls[0].val*3.6,
    .5+(a-nb_C/2)*controls[1].val/100,
    .5+(a-nb_C/2)*controls[2].val/100
      );
    rect(
    10+a*(width-20)/nb_C,
    height/4.2,
    (width-20)/nb_C,
    height/1.6
      );
  }
  fill(C_Tr);
  textAlign(CENTER);
  text (tx[0+int(Fr)], width/2, 28);
  text (tx[2+int(Fr)], width/2, 46);
  text (tx[4+int(Fr)], width/2, height-50);
  for(int a=0;a<controls.length;a++){ 
    controls[a].dessine(); 
  }
  if(mouseY>height/4.2 && mouseY<height/4.2+height/1.6){ 
    line_TP = constrain(10+mouseX+(width-20)/(2*nb_C)-((mouseX+(width-20)/(2*nb_C)) % ((width-20)/nb_C)),10+(width-20)/nb_C,width-(width-20)/nb_C-10);
    // urgl, what a f#%*ing mess …
  }
  line_CP = (2*line_CP+line_TP)/3;
  stroke(C_Tr);
  strokeWeight(18);
  line(line_CP, height/4.2, line_CP, height/4.2+height/1.6);
}
// -------------------------------------------------------------
void keyPressed() {
  switch(key) {
  case ' ':
    C_TM = C_Fd; 
    C_Fd = C_Tr; 
    C_Tr = C_TM;
    // is there a simplier way to say A = B & B = A (something like 'flip(A, B)')?
    break;
  default:
    Fr =! Fr;
    break;
  }
}
// -------------------------------------------------------------
void mousePressed() {
  for(int a=0;a<controls.length;a++){ 
    controls[a].check(); 
  }
}
void mouseReleased() {
  clic = 0;
}
// -------------------------------------------------------------
// based on the Jean-no's quick and dirty slidebar, now instanced as: 
// new slideBar ( num, x, y, width, height, minimum value, maximum value, text number, default pos/value); 
// the output is stuck in (mySlidebar).val 
class slideBar{

  int     num, x, y, h, l, txt;
  float   mi, ma, val, pos, tot; 
  boolean caught;

  slideBar(int _num, int _x, int _y, int _l, int _h, float _mi, float _ma, int _txt, float _pos){
    num    = _num           ;
    x      = _x             ;
    y      = _y             ;
    h      = _h             ;
    l      = _l             ;
    mi     = _mi            ;
    ma     = _ma            ;
    txt    = _txt           ;
    tot    = (ma-mi)/l      ;
    caught = false          ;
    pos    = _pos           ;
    val    = mi+(pos-x)*tot ;
  }

  void check(){
    if(mouseX>x && mouseX<x+l && mouseY>y && mouseY<y+h){ 
      clic=num; 
    }  
  }

  void dessine(){ 
    if(clic==num){ 
      pos=constrain(mouseX, x, x+l);
      val =  mi+(pos-x)*tot  ;
    } 
    fill(C_Tr);
    noStroke();
    rect(x,y,l,h);
    stroke(C_Fd);
    strokeWeight(2);
    line(pos,y,pos,y+h);
    textAlign(RIGHT);
    text(tx[txt+int(Fr)], x-5, y+12);
    textAlign(LEFT);
    text(val, x+l+5, y+12);
  }
}


