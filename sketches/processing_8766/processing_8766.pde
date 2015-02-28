
import controlP5.*;

ControlP5 controles;

int ancho = 950;
int alto = 500;
float radio = 100;
float lados = 5;
float grad = 360/lados;
float rotar = 0;
float x1, x2, y1, y2;


void setup (){
  size (ancho,alto);
  smooth();
  controles = new ControlP5(this); 
  controles.addSlider("radio",20,240,100,10,10,200,10);
  controles.addSlider("lados",3,24,5,10,25,200,10);
  Slider l_ = (Slider) controles.controller("lados");
  l_.setNumberOfTickMarks(22);
  controles.addSlider("rotar",0,360,0,10,48,200,10);
  controles.addTextlabel("mensaje","Creado por Elias Leyton ",10,70);
  frameRate(64);
}

void draw () {
  grad = 360/lados;
  stroke(#333333);
  background(#999999);
  pushMatrix();
  translate(ancho/2,alto/2);
  rotate(radians(rotar));
  for(int i = 1; i < lados; i++){
    x1 = radio*sin(radians(grad)*i);
    y1 = radio*cos(radians(grad)*i);
    x2 = radio*sin(radians(grad)*(i+1));
    y2 = radio*cos(radians(grad)*(i+1));
    line(x1,y1,x2,y2);
    //line(0,0,radio*sin(radians(grad)*i),radio*cos(radians(grad)*i));
    println("r_"+radio);
    println("l_"+lados);
  }
  line(x2,y2,radio*sin(radians(grad)*1),radio*cos(radians(grad)*1));
  popMatrix();
}



