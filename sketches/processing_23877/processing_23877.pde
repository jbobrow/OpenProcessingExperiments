
import traer.physics.*;
ParticleSystem physics;
Particle mouse;
Particle[] p;
Spring[] s;

PImage img;
PFont font;
  
void setup(){
  size(733, 477);
   img = loadImage("010.jpg");
   background (200);
   image(img,0,0);
        font = loadFont("HelveticaNeue-Bold-48.vlw"); 
    smooth();
    
  physics=new ParticleSystem(1.0,0.05);
  p=new Particle[12];
  s=new Spring[12];
    
  for(int i=0;i<p.length;i++){
    p[i]=physics.makeParticle(1.0,20,20,0);
    if(i>0){
      s[i]=physics.makeSpring(p[i],p[i-1],0.15,0,40);
    }
  }
    
  p[0].makeFixed();
  p[11].makeFixed();
}
  
 
void draw(){
  background(255,255,255,0);
  image(img,0,0);
  
   textFont(font);
  fill(255); //colour
  text("LIFE!", 275, 150);
  text("WHAT A NETWORK", 275, 190);
  text("OF THREADS!", 275, 230);
  
  physics.tick();
   
  p[0].position().set(175,200,0); //------ORIGIN
  fill(128);
      
    beginShape();
    noFill();
    curveVertex(p[0].position().x(),p[0].position().y());
    curveVertex(p[0].position().x(),p[0].position().y());
    curveVertex(p[1].position().x(),p[1].position().y());
    curveVertex(p[2].position().x(),p[2].position().y());
    curveVertex(p[3].position().x(),p[3].position().y());
    curveVertex(p[4].position().x(),p[4].position().y());
    curveVertex(p[5].position().x(),p[5].position().y());
    curveVertex(p[6].position().x(),p[6].position().y());
    curveVertex(p[7].position().x(),p[7].position().y());
    curveVertex(p[8].position().x(),p[8].position().y());
    curveVertex(p[9].position().x(),p[9].position().y());
    curveVertex(p[10].position().x(),p[10].position().y());
    curveVertex(p[11].position().x(),p[11].position().y());
    curveVertex(p[11].position().x(),p[11].position().y());
    endShape();
      
if(mousePressed){
  p[11].position().set(mouseX,mouseY,0);
  }
    
}

void keyReleased() {
if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
Calendar now = Calendar.getInstance();
return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


