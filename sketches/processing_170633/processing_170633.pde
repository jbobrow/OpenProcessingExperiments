
PImage fondo;
int cant = 80;
Pelota[] pelotas = new Pelota[cant];
void setup(){
 size(800,600);
 //colorMode(HSB);
 fondo = loadImage("aurora.png");
 for(int i=0;i<cant;i++){
  pelotas[i] = new Pelota(); 
 }
 background(0);

}
void draw(){
image(fondo,0,0);
 for(int i=0;i<cant;i++){
pelotas[i].dibujar();
pelotas[i].mover();
}
for(int i=0;i<cant;i++){
  for(int j=0;j<cant;j++){
    pelotas[i].conectar(pelotas[j]);
  }
}

fill(0,60);
rect(0,0,width,height);
}
class Pelota {
  float px, py, dirx, diry;
  float radio;
  Pelota() {
    radio = random(20, 40);
    px = random(radio, width-radio);
    py = random(radio, height-radio);
    dirx = random(-2, 4);
    diry= random(-2, 4);
  }
  void dibujar() {
    noFill();
    stroke(map(radio, 8, 16, 150, 250), 128);
    //ellipse(px,py,radio*2,radio*2);
  }
  void mover() {
    px = px>width+radio ? -radio : px; //antes del ? pregunta despues responde
    py = py>height/1.5+radio ? -radio : py;
    px = px<-radio ? width+radio : px;
    py = py<-radio ? height+radio : py;
    px += dirx;
    py += diry;
  }
  //instancias de la misma clase
  void conectar(Pelota otra) {
   if (dist(px, py, otra.px, otra.py)<radio+otra.radio) {
      strokeWeight(2);
      stroke(0,random(0,180),random(0,180),40);
      line(px, py, otra.px, otra.py);
      line(px+2, py+2, otra.px, otra.py);
      line(px+4, py+4, otra.px, otra.py);
      line(px+6, py+6, otra.px, otra.py);


    }
  }
}


