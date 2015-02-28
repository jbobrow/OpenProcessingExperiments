
ArrayList<Pulse> pulse = new ArrayList();

int x = 458;
int y = 386;
PImage img;

void setup() {
  img = loadImage("pmt_photo_lres.jpg");
  size(889, 667);
  smooth();
}

void draw() {
  image(img, 0, 0);
  if(pulse.size() >0 ){
    for(int i = 0; i < pulse.size(); i++){
      Pulse p = pulse.get(i);
        if( p.fade <= 0) {
         pulse.remove(p);
     }
          p.display();
          p.grow();
     }  
   }
 }  
void mousePressed() {
pulse.add(new Pulse(x, y));
}

void keyPressed(){ 
if (key == CODED) {
    if (keyCode == SHIFT){
     saveFrame("pulse-##.jpg"); 
    } 
  }
}


class Pulse {
  float x = 458;
  float y = 386;
  float pSize;
  float fade = 255;
  
  Pulse(float _x, float _y) {
    x = _x;
    y = _y;
 }  
    
   void display () {
     stroke(255, fade);
        strokeWeight(30);
          noFill();
           ellipse(x, y, pSize, pSize);
 }
 
 void grow() {
   pSize+=6;
   fade--;
   if (fade <= 0) {
     fade = 0; 
    }
  }
}
