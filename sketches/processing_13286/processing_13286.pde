
PFont reloj;
int lastsecond = 0;

void setup(){
  reloj = loadFont("Commodore-64-Pixelized-48.vlw");
  size(700,100);
  textFont (reloj);
}

void draw(){

  int h = hour();
  int m = minute();
  int s = second();

  int dia = day();
  int mes = month();
  int anio = year();

  if (lastsecond != s){
    background(0);
    String anio2 = nf(anio,2);
    String anio3 = anio2.substring(2,4);
    String date = nf(h,2)+":"+nf(m,2)+":"+nf(s,2)+" "+nf(dia,2)+"/"+nf(mes,2)+"/"+anio3;
    println (date);
    fill(114,234,183);
    text(date,23,60);
    filter(DILATE);
    filter(BLUR,8);
    fill(176,242,215);
    text(date,20,60);
    filter(BLUR,1);


    for (int y = 0; y <= height; y+= 5){
      strokeWeight(0.1);
      stroke(20,200,20,20);
      line (0, y, width, y);
    }
    //saveFrame("fecha-####.png");
  }
  lastsecond = s;
  fill(0,random(0,3));
  rect(0,0,width,height);
}






