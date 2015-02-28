

///////////////////////////////////////////
// ORIGINALMENTE DISEÑADO PARA COVER ART // 
///////////////////////////////////////////

void setup(){
  size(ancho,alto);
  background(#FFFFFF);
  smooth();
  frameRate(10);
}

int alto = 450;
int ancho = 900;

void draw () {
  int space = (int)random(20,100);
  for(int x = 0; x < alto; x++){
    stroke(colorSelector((int)random(0,4)));
    for(int y = 0; y < ancho; y++){
     line(x,y,y,x);
     y++;
     y++;
     y++;
     
    }
    x = x + space;
 }

/*
 noStroke();
 fill(#FFFFFF);
 rect(100+4,300+4,94,300+4);
 */
 noLoop();
}

color colorSelector(int i) {
  color [] colores =  { #81D8E3,#6CD41C,#EDEF10,#FF12C4,#BC20D4 };
  return  colores[i];
}

void mouseReleased(){ 
  //save((month()+""+day()+""+hour()+""+minute()+""+second())+".PNG");
  //println((month()+""+day()+""+hour()+""+minute()+""+second())+".PNG");
  background(#FFFFFF);
  redraw();
}


