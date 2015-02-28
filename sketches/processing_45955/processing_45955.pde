
import controlP5.*;
ControlP5 slides;

ArrayList snakes;

// 5 réglages de l'anim accessibles avec controlP5
public float accCoef = 10;
public float limiteDist = 180;
public float vitMax = 12;
public float coefPulse = 7;
public float rayMax = 70;

// slider simplifiés
int sliders_x = 30;
int sliders_y = 555;
int sliders_dist = 15;
int slider_L = 200;

int drawSwitch = 0;

void setup(){
  size(640, 640);
  frameRate(25);
  smooth();
  
  snakes = new ArrayList();
  
  Reset();
  add_snake();
  add_snake();
  add_snake();
  add_snake();
  add_snake();
  add_snake();
  
  slides = new ControlP5(this);
  
  slider("Vitesse de deplacement", "vitMax", vitMax, 0, 25);
  slider("Taille des cercles", "rayMax", rayMax, 4, 250);
  slider("Instablilite du cercle", "coefPulse", coefPulse, 0, 20);
  slider("Instabilite des deplacements", "accCoef", accCoef, 0, 20);
  //slider("Rayon de la zone d'affichage", "limiteDist", limiteDist, 0, 300);
  
  btn("add_snake", 530, 30);
  btn("remove_snake", 530, 50);
  btn("Toggle_Drawing", 30, 30);
  btn("Reset", 30, 50);
}
void draw(){
  if(drawSwitch == 1) background(#cccccc);
  
  for(int i=0; i<snakes.size(); i++){
    Snake snak = (Snake) snakes.get(i);
    snak.drawSnake();
  }
}

void slider(String titre, String varName, float val, int _min, int _max){
  
  Slider t = slides.addSlider(varName, _min, _max, val, sliders_x, sliders_y, slider_L, 10);
  t.setLabel(titre);
  t.setColorValue(color(0, 0, 0));
  t.setColorBackground(color(100, 100, 100));
  t.setColorForeground(color(255, 255, 255));
  t.setColorActive(color(230, 230, 230));
  t.captionLabel().style().margin(0, 0, 0, 7);
  t.setColorLabel(color(0, 0, 0));
  
  // mise en page auto des sliders
  sliders_y += sliders_dist;
  slider_L += sliders_dist;
}

void btn(String nomVar, int x, int y){
  Button t = slides.addButton(nomVar,0,x,y,80,15);
  t.setColorValue(color(0, 0, 0));
  t.setColorBackground(color(100, 100, 100));
  t.setColorForeground(color(150, 150, 150));
}

void Reset(){
    background(#cccccc);
    while(snakes.size()>0){
      snakes.remove(0);
    }
    snakes.add(new Snake(width/2, height/2-100));
}

void Toggle_Drawing(){
    if(drawSwitch ==0){
      drawSwitch = 1;
    } else {
      drawSwitch = 0;
    }
}

void add_snake(){
  snakes.add(new Snake(width/2, height/2-100));
}
void remove_snake(){
  snakes.remove(0);
}

void keyPressed(){
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png"); 
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

