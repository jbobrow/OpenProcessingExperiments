
int limite = 200;
int ancho = 60;
int step = 8;
int strk = 12;
float sep = 3;
float speedAdjust = 2;
float alphaAdjust = 25;
Arco[] arcs = new Arco[0];

Maxim maxim;
AudioPlayer player;
 
class Arco {
  float posicion;
  int ancho;
  color c;
  int circle;
  float largo;
  float speed;
  float direction;
   
  Arco(float posicion, int ancho, color c, int circle) {
    this.posicion = posicion;
    this.ancho = ancho;
    this.c = c;
    this.circle = circle;
    this.largo = random(65, 200);
    this.speed = random(0.1,2);
    this.direction = random(1)>0.5?1:-1;
  }
   
  void paint() {
      noFill();
      smooth();
      strokeWeight(strk);
      //strokeCap(SQUARE);
      stroke(c);
      arc(width/2, height/2, ancho+(circle*sep),ancho+(circle*sep), radians(posicion), radians(posicion+largo));
      this.posicion=posicion+speed*direction*speedAdjust;
  }
  void print() {
    println("circle:"+circle+"ancho:"+ancho+" posicion:"+posicion+" largo:"+largo); 
  }
}
 
void setup(){
  size(900,800);
     
  background(#212121);
  //noLoop();
  
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  player.setLooping(true);
  player.cue(0);

  color c;
  for(int i = 0, circle=0; circle < limite; i+=1, circle=circle+step){
    colorMode(HSB);
    c = color(circle % 255+25, 220, 220);
    float posicion = random(0, 360);
     
    Arco arco = new Arco(posicion, ancho, c, circle);
    arcs = (Arco[])append(arcs,arco);
  }
}

void mousePressed()
{
  player.play();
}
 
   
void draw(){
    
  noStroke();
  fill(0, alphaAdjust);
  rect(0, 0, width, height);
   
  for(int i = 0; i < arcs.length; i=i+1){
    arcs[i].largo = map(mouseX,0,width,0.05,1.0)*limite;
    arcs[i].paint();
    //arcs[i].print();
  }
  speedAdjust = map(mouseY, 0, height, 0, 15);
  
  float ratio = (float)mouseY / (float)height;
  if(mouseY > height/3){
    player.volume(1);
  }
  else {
    player.volume((float)mouseY / ((float)height/3));  
  }
  ratio  = ratio + 0.5;
  player.speed(ratio);
}
 
void mouseDragged() {
   speedAdjust=map(mouseX,0,width,0,4);
   alphaAdjust=map(mouseY,0,height,0,100);
}



