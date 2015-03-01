
import ddf.minim.*;


Minim minim;
AudioInput input;



class Particle
{

float x,y,vx,vy,diam,a;
boolean dead = false;


Particle(float _x,float _y)
{
  x = _x;
  y = _y;
  diam = random (15,80);

  a = 1;
  vx = mvelx*.5+random(-3,3);
  vy = mvely*.5+random(-3,3);
}
  
  void update()
  {
    vx+=noise(x*.03, y*.03, frameCount*.02)-.2;
    vy+=noise(y*.03, x*.03, frameCount*.02+34356)-.2;
    diam --;
    x+=vx;
    y+=vy;

    a*=.98;
    
    if(a <.05)
    {
      dead = true;
      
    }
}
  
  void display()
  {
    float r= atan2(vy,vx);
    fill(#68A4B5, a*255 );
    stroke(#C1F2DF,60);
    pushMatrix();
    translate(x,y);
    rotate(r);
    ellipse(0,0,diam,diam);
    popMatrix();
    
  }
  
  
}




ArrayList parts;
float mvelx,mvely;

void setup()
{
  size(450,450, P3D);  
  parts = new ArrayList();
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO,512);
  smooth();
}
  





void draw()
{
  

  
 background(#7CBFC5); 

 
pushMatrix();
 noStroke();
 float tempx = noise(frameCount*.03)*width;
 float tempy = noise(frameCount*.03+12345)*height;
 

 

 parts.add(new Particle(tempx,tempy));
 
 
 for(int i = 0; i < parts.size(); i++)
 {
   Particle p = (Particle) parts.get(i);
   if(p.dead == true)
   {
     parts.remove(i);
   }
   p.update(); 
   p.display();
   
 }
 
 popMatrix();
 

float sound = input.left.get(1)*500+ 20;
println(sound);
translate(width/2, height/2);
float stro2 = abs(map(sound, 0.5, 20, 0.0, 40));
stroke(#E4E8CF,150);
noFill();
strokeWeight(stro2/2);
smooth();

int g = 30;
for (int deg = -120; deg < 450; deg += 45) {
float angle = radians(deg);
float x = 10 + (tan(angle) * g);
float y = 10 + (sin(angle) * g);

ellipse(x,y, sound-20, sound-20);
rotate(sound);

}
 
  
}




