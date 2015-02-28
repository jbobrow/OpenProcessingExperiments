
/*
--------------------------------
01-02/02/2011
ISIA Urbino
Workshop 
--------------------------------
Procedure di Basic Design
La logica della programmazione 
applicata alla didattica
 
un progetto di 
Lorenzo Bravi
--------------------------------
Corso di Basic Design
prof. Nunzia Coco
--------------------------------
*/

//import controlP5.*;
//ControlP5 slider;
//float sliderVolume = 5;
char k;
float v;
PShape wall;

void setup() {
  size(500,500);
  smooth();
  //slider volume
//  slider = new ControlP5(this);
//  slider.setColorValue(color(255));
//  slider.setColorForeground(color(220));
//  slider.setColorBackground(color(240));
//  slider.setColorActive(color(200));
//  slider.setColorLabel(color(255));
//  slider.addSlider("sliderVolume",1,10,0.1,310,479,120,10);
  //credits workshop
  wall = loadShape("ISIA-credits.svg");
  setup_volume();
  k=' ';
}

void draw() {
  background(255);
  //translate(width/2, height/2);
  get_volume();
  v=volume;
  //v=volume*sliderVolume;
  if(v > 1500) {
    v=1500;
  }
  fill(255);
  stroke(0); 
  strokeWeight(1);
  rectMode(CORNER);
  ellipseMode(CENTER); 
  //credits workshop
  translate(0,0);
  if(k<49 || k>122 || (k>55 && k<97)){
  shape(wall, 0, 0, 500, 500);
  }
  
  switch(k){    
//    case 'a' :{ a(); }break;
//    case 'b' :{ b(); }break;
//    case 'c' :{ c(); }break;
//    case 'd' :{ d(); }break;
//    case 'e' :{ e(); }break;
//    case 'f' :{ f(); }break;
//    case 'g' :{ g(); }break;
//    case 'h' :{ h(); }break;
//    case 'i' :{ i(); }break;
//    case 'j' :{ j(); }break;
//    case 'k' :{ k(); }break;
//    case 'l' :{ l(); }break;
//    case 'm' :{ m(); }break;
//    case 'n' :{ n(); }break;
//    case 'o' :{ o(); }break;
    case 'p' :{ p(); }break;
//    case 'q' :{ q(); }break;
//    case 'r' :{ r(); }break;
//    case 's' :{ s(); }break;
//    case 't' :{ t(); }break;
//    case 'u' :{ u(); }break;
//    case 'v' :{ v(); }break;
//    case 'w' :{ w(); }break;
//    case 'x' :{ x(); }break;
//    case 'y' :{ y(); }break;
//    case 'z' :{ z(); }break;
    case '1' :{ _1(); }break;
//    case '2' :{ _2(); }break;
//    case '3' :{ _3(); }break;
//    case '4' :{ _4(); }break;
//    case '5' :{ _5(); }break;
//    case '6' :{ _6(); }break;
//    case '7' :{ _7(); }break;
   
    default:{}
  }

}

void keyReleased(){
  k=key;
}

