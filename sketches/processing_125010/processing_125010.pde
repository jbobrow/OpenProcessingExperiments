
/* Recursive Tree for Introduction to Computational Arts
* The concept of recursion is used to branch into subbranches. 
* The basic tree generation is based on an example by Daniel Shiffman.
*/
import toxi.geom.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer christmas; 

ArrayList a;
ArrayList leaves;
ArrayList rainCollection;
float alpha = 200;
PImage background; 
boolean play = false;
void setup() {
  size(1020,640);
  smooth();
  
  background = loadImage("san_francisco1.jpg");
  a = new ArrayList();
  leaves = new ArrayList();
 rainCollection = new ArrayList();
  
  Branch b = new Branch(new PVector(width/2,height),new PVector(0f,-1.8),100,9);
  a.add(b);
  
    minim = new Minim(this); 
  christmas = minim.loadFile("christmas.wav"); 
  christmas.play();
}

void draw() {
  noStroke();
   fill(0,80);
  rect(0,0,width,height);
  image(background,0,0,width,height);
RainRain myNinja = new RainRain(random(10, width), random(-10, -100), 5);
  rainCollection.add(myNinja);

if (millis() > 4000 && millis() < 28000){

  for (int i = 0; i < rainCollection.size(); i++) {
    RainRain mn = (RainRain) rainCollection.get(i);
    mn.run();
  }
} 

  for (int i = a.size()-1; i >= 0; i--) {
    Branch b = (Branch) a.get(i);
    b.update();
    b.render();
    if (b.timeToBranch()) {
      if (a.size() < 1024) {
        a.add(b.branch( random(25f, 35f)));   
        a.add(b.branch(random(-25f,-35f)));  
      } 
      else {
        leaves.add(new Leaf(b.end));
      }
     
    }
  }
  
  for (int i = 0; i < leaves.size(); i++) {
     Leaf leaf = (Leaf) leaves.get(i);
     leaf.display(); 
  }
  

}



