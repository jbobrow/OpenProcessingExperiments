

/*
Hackpact Arte Generativo 2011
Dia 10

Martin Zumaya Hernandez
*/


import toxi.sim.automata.*;
import toxi.math.*;
import toxi.color.*;
int step = 50;
CAMatrix ca;
ToneMap toneMap;

void setup() {
  size(600,600);
  byte[] birthRules=new byte[] {1,5};
  byte[] survivalRules=new byte[] {7};
  ca=new CAMatrix(width,height);
  CARule rule=new CARule2D(birthRules,survivalRules,80,true);
  rule.setAutoExpire(true);
  ca.setRule(rule);
  ColorGradient grad=new ColorGradient();
  grad.addColorAt(0,NamedColor.GREY);
  grad.addColorAt(64,NamedColor.YELLOW);
  grad.addColorAt(128,NamedColor.ORANGE);
  grad.addColorAt(192,NamedColor.LIGHTGOLDENRODYELLOW);
  grad.addColorAt(240,NamedColor.RED);
  grad.addColorAt(255,NamedColor.GREY);
  toneMap=new ToneMap(0,rule.getStateCount()-1,grad);
}

void draw() {
  loadPixels();
  for( int i = 0; i < width; i += step){
   ca.drawBoxAt(i,i,10,1); 
   ca.drawBoxAt(i,height-i,10,1); 
  }
  ca.update();
  int[] m=ca.getMatrix();
  for(int i=0; i<m.length; i++) {
    pixels[i]=toneMap.getARGBToneFor(m[i]);
  }
  updatePixels();
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

