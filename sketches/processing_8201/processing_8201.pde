
void setup () {
  size (ancho, alto);
  background(#FFFFFF);
  frameRate(10);
  smooth();
}

int ancho = 900;
int alto = 500;
int puntos = (int)random(15);
float x = random(ancho);
float x1, x2;
float y = random(alto);
float y1, y2;
float Rx, Ry;

void draw () {
  for(int i = 0; i <= puntos; i++){
    fill(#000000);
  //  x = random(ancho);
  //  y = random(alto);
    x1 = x;
    y1 = y;
    ellipse(x,y,10,10); 
    x = random(ancho);
    y = random(alto);
    x2 = x;
    y2 = y;
    ellipse(x,y,10,10);
    if (x1 > x2){
      Rx = x1 - x2;
    } else if(x2 > x1){
      Rx = x2 - x1;
    }
    if (y1 > y2){
      Ry = y1 - y2;
    } else if(y2 > y1){
      Ry = y2 - y1;
    }  
    
    float radio = sqrt(Rx*Rx+Ry*Ry);
    noFill();
    //line(x1,y1,x2,y2);
  
    if (x1 > x2 && y1 > y2){
      ellipse(Rx/2+x2,Ry/2+y2,radio,radio);
      println("OK");
    }
    if (x2 > x1 && y2 > y1){
      ellipse(Rx/2+x1,Ry/2+y1,radio,radio);
      println("OK2");
    }
    if (x1 > x2 && y2 > y1){
      ellipse(Rx/2+x2,Ry/2+y1,radio,radio);
      println("OK3");
    }
    if (x2 > x1 && y1 > y2){
      ellipse(Rx/2+x1,Ry/2+y2,radio,radio);
      println("OK4");
    }
    println("1_ "+x1+" - "+y1);
    println("2_ "+x2+" - "+y2);
    println(Rx+" "+Ry);
    println("radio_"+radio);
    
  }
  noLoop();
}

void mouseReleased(){ 
  background(#FFFFFF);
  redraw();
}


