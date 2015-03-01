
objetADeplacer[] objets;
objetADeplacer selected=null;
 
void setup() {
  size(500, 500);colorMode(HSB);noStroke();
  objets = new objetADeplacer[9];
  objets[0]=new objetADeplacer(100, 100);
  objets[1]=new objetADeplacer(100, 250);
  objets[2]=new objetADeplacer(100, 400);
  objets[3]=new objetADeplacer(255, 100);
  objets[4]=new objetADeplacer(255, 250);
  objets[5]=new objetADeplacer(255, 400);
  objets[6]=new objetADeplacer(400, 100);
  objets[7]=new objetADeplacer(400, 250);
  objets[8]=new objetADeplacer(400, 400);
}
 
void draw() {
  background(0);
  for (int a=0; a<objets.length; a++) {
    objets[a].affiche();
  }
}
 
class objetADeplacer {
  float x, y;color c;
  objetADeplacer(float _x, float _y) {
    x=_x;y=_y;c=color(random(255),240,255);
  }
  void affiche() {
    fill(c);
    if(selected==this){
      x=mouseX;y=mouseY;
    }
    ellipse(x,y,50,50);
  }
}
 
void mousePressed(){
  float minimu=1000;
  int choisi=-1;
  for(int a=0;a<objets.length;a++){
    float d=dist(objets[a].x,objets[a].y,mouseX,mouseY);
    if(d<minimu){minimu=d;choisi=a;}
  }
  if(minimu<25){
    selected=objets[choisi];
  }
}
 
void mouseReleased(){
  selected=null;
}
