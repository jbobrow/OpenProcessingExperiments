
color c = color(0, 0, 1);
String word = "Hölderlin";
String allwords ="Mit gelben Birnen hänget Und voll mit wilden Rosen Das Land in den See, Ihr holden Schwäne, Und trunken von Küssen Tunkt ihr das Haupt Ins heilignüchterne Wasser. Weh mir, wo nehm’ ich, wenn Es Winter ist, die Blumen, und wo Den Sonnenschein, Und Schatten der Erde? Die Mauern stehn Sprachlos und kalt, im Winde Klirren die Fahnen. ";
PVector start  =new PVector(10, 60);
int tSize =92;
ArrayList<particle> Points = new ArrayList<particle>();
int index=0;
float restZ=0;
int F = 0;
float CTime=200;
int PNum =720;
void setup() {
  size(640, 360);
  background(0);
  textSize(tSize);
  fill(c);
  text(word, start.x, start.y+tSize);
  loadPixels();
  for (int i = 0; i < PNum; i++) {
    Points.add(new particle(random(640),random(360)));
  }
}

void draw(){
  background(0);
  int Len = word.length();
  PVector RealPix;
  if (restZ==0){
    restZ=CTime;
    for (particle P : Points) {
      P.target=null;
      P.velocity.mult(CTime/600);
    }
    String[] Arr = allwords.split(" ");
    word=Arr[F];
    start.x = int(random(10,width-word.length()*tSize/1.45));
    start.y = int(random(10,height-tSize*1.3));
    //background(0);
    fill(c);
    text(word, start.x, start.y+tSize);
    loadPixels();
    F++;
    if (F>=Arr.length){F=0;};
  }else{
    restZ-=1;
  }
  for (int i = 0; i < 13*PNum/(CTime-50); i++) {
    RealPix=  new PVector(int(random(start.x, start.x+Len*tSize/1.45)),int(random(start.y, start.y+tSize*1.3)));
    int pixNr =int(RealPix.y*width + RealPix.x);
    color b= pixels[pixNr];
    if ((c == b)&&(restZ<CTime-40)&&(restZ>=10)){
      particle Aktuell = Points.get(index);
      if (Aktuell.target==null){
        Aktuell.target=RealPix;
        PVector desired = PVector.sub(Aktuell.target, Aktuell.location);
        desired.div(restZ);
        Aktuell.velocity= desired;
      }
      index++;
      index=index%PNum;
    }
  }
  runP();
}

void runP(){
  for (particle P : Points) {
    stroke(255,255/sqrt(P.velocity.mag()+1));
    P.location.add(P.velocity);
    if (P.target!=null){
      float d = PVector.dist(P.location, P.target);
      if (d < 6){
        P.velocity.mult(0.85);
      }
    }
    line(P.location.x, P.location.y, P.location.x+P.velocity.x, P.location.y+P.velocity.y);
  }
}

class particle{
  PVector location;
  PVector velocity;
  PVector steer;
  PVector target;
  particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0.0, 0.0);
    steer = new PVector(0.0, 0.0);
  }
}

