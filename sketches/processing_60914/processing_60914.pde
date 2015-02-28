
import traer.physics.*;
 
ParticleSystem physics;
Particle points;
  Word w,w2,w3,w4;
  
PFont myFont;

void setup()
{
  
  String[] fontList = PFont.list();
  println(fontList);
  
  size(600,600,P3D);
  
physics = new ParticleSystem(0,0.05);  //jyuryoku bane
//w = new Word("Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! Follow my words ! ",physics);
//w = new Word("Ah, dear Juliet, why art thou yet so fair?",physics);
w = new Word("?riaf os tey uoht tra yhw ,teiluJ raed , hA",physics);
frameRate(20);
background(0);
// myFont = createFont("ShelleyLTStd-Script",32);
textFont(myFont);

}
 
void draw()
{
  fill(0,80);
  rect(0,0,width,height);
//  background(255);
  w.update();
  w.draw();
  physics.tick();
}


