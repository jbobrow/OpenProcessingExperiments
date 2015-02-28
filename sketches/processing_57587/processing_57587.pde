
Flower[]flora;

void setup(){
  smooth();
  size(800,600);
  flora=new Flower[6];
  frameRate(5);
  
  }


void draw(){
  background(#A8877E);
   for (int i=0;i<flora.length;i++) {
    flora[i]= new Flower(150*i,width/2,int(random(50,100)),color(255,random(50,255),116),color(200,random(0,255),120));
  }
 
  for (int i=0;i<flora.length;i++) {
    flora[i].drawflora();
  }
  
}
class Flower {
  
  float fx,fy,rpistil;
  color colorpistil;
  color small;


Flower (
  float _fx,
  float _fy,
  float _rpistil,
  color _colorpistil,
  color _small)
  {fx=_fx;
   fy=_fy;
   rpistil=_rpistil;
   colorpistil= _colorpistil;
   small=_small;
}


void drawflora(){
  noStroke();
   fill(colorpistil);
    ellipse(fx,fy,rpistil,rpistil);
  fill(small);
   ellipse(fx,fy,rpistil/3,rpistil/3);
 
    
}
}
