
/* Impluvium, Molène - Pol Guezennec 2012           */
/* bien étayé par l'étude de pluie de J.N.Lafargue  */

float w; float h;
int nombre;
int limite = 255;
ArrayList drops;

void setup() {
  size(800,450);
  drops = new ArrayList();//par defaut, 10
  drops.add(new Drop());
  w = floor(random(1,7));
}
void draw() {
  frameRate(20);
  background(120);
  noFill();
  int n = int(random(1,6));
  for(int i = 0; i < n; i++){ drops.add(new Drop());}
  for(int i = drops.size()-1; i >= 0; i--){
    Drop drop = (Drop) drops.get(i);
    drop.display();
    drop.dripple();
    drop.update();  
  }
}


class Drop {
  float x = int(random(width));
  float y = int(random(height));
  float div1 = .89;
  float div2 = 1.1;
  int w = 1; float h;
  int inc = floor(random(1,3));

  void dripple() { w+=inc;  w*= 1.08;}

  void display() {
    h = w*.3;
    strokeWeight(1);
    line(x+y*.2,0,x,y);
    float wmapped = map(w,0,255,60,0);
    stroke(255, wmapped);
    ellipse(x,y,w,h);
    ellipse(x,y, w*div1, h*div1);
    ellipse(x,y, w*div2, h*div2);
    }
    void update() {
    if(w >= limite) { 
      w = floor(random(1,20));
      x = random(width); 
      y = random(width);
      drops.remove(this);
    }}
  }




