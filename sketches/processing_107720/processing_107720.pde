
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

ArrayList<Flake> flakes;

void setup(){
 
   size(800, 600, P3D); 
   frameRate(20);
   flakes = new ArrayList<Flake>();
   minim = new Minim(this);
   player = minim.loadFile("TakeFive.mp3", 2048);
   player.loop();
   player.play(round(random(player.length() - 1000)));
   
}

float rot = 0;
Flake f;
int cuantos = 0;


void draw(){
  
  background(122,122,208);

  if (cuantos < 40 && random(1) > 0.9){
    f = new Flake( );
    flakes.add(f);
    cuantos ++;
  }
  for(int i = 0; i < flakes.size(); i++){
    f = flakes.get(i);
    pushMatrix();
    translate(f.x, f.y);
    f.cae();
    f.dibuja();
    popMatrix();
  }
}


class Flake{
  
  float x, y, tam, rot, rotRate, vel;

  Flake( float x, float y, float tam, float rotRate){
  
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.rot = 0;
    this.rotRate = rotRate;
  
  } 
  
  Flake(){
    reset();
  }
  
  void reset(){
    x = random(width - tam);
    y= 0;
    tam = random(10,50);
    rot = 0;
    vel = random(3,10);
    rotRate=random(0.1,0.5);
  }
  
  void cae(){
    y += vel;
    if (y >= height)
      reset();
    rot += rotRate;
    if (rot >= 2 * PI)
      rot = 0;
  }
  
  void dibuja(){
    rotateY(rot);
    rect( -tam/2, -tam/2, tam, tam);
   
  }
}


