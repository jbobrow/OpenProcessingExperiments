
trait[] traits = new trait[0];
boolean neverclicked;
 
void setup(){
  size(490,490);
  stroke(255);
  smooth();
  message();
  // writing on the scene
}
 
void draw(){
  if(mousePressed){
    if(mouseX != pmouseX || mouseY != pmouseY){
      float[] vecteur = {
        mouseY-pmouseY, mouseX-pmouseX      };
      float an = atan2(vecteur[0], vecteur[1]) ;
      new trait(mouseX, mouseY, an+PI*0.9, radians(-3));
      new trait(mouseX, mouseY, an-PI*0.9, radians(3));
    }
  } 
  for (int a=0;a<traits.length;a++){
    traits[a].dessine();
  }
  nettoye();
}
 
class trait{
  float x, y, an, ray, v;
  int c;
  trait(float _x, float _y, float _an, float _v){
    c=floor(random(20,30));
    x=_x;
    y=_y;
    an=_an;
    v=_v;
    ray=1;
    traits = (trait[]) append(traits, this);
  }
  void dessine(){
    if (c>0){
      strokeWeight(c*0.1);
      c--;
      //  strokeWeight(c/10.0);
      //ray+=0.2;
      an+=v;
      //v*=1.1;
      float newx=x+cos(an)*3;
      float newy=y+sin(an)*3;
      line(x,y,newx, newy);
      x=newx;
      y=newy;
    }
  }
}
 
void nettoye(){
  trait[] newtraits = new trait[0];
  for(int a=0;a<traits.length;a++){
    if(traits[a].c>0)newtraits=(trait[]) append(newtraits, traits[a]);
  }
  traits = newtraits;
}
 
void mousePressed(){
  // to clean the first screen
  if(neverclicked){
    neverclicked=false;
    background(0);
  }
}
 
void keyPressed(){
  message();
}
 
void message(){
  background(0);
  neverclicked=true;
  PFont f = createFont("arial", 12);
  textFont(f, 12);
  textAlign(CENTER, CENTER);
  text("interactive : drag the mouse on the screen\njust press any key to clean the scene", width/2,height/2);
}



