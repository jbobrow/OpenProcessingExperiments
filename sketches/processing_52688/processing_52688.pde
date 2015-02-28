
E myE;
E myE2;
E myE3;
E myE4;
E myE5;

float angle = 0;   
float aVelocity = 0;
float aAcceleration = 0.05;

void setup(){
  background(255);
  size(600,600);
  frameRate(15);
  myE = new E( 0, 0, 1, 600);
  myE2 = new E( 0, 0, 2, 300);
  myE3 = new E( 0, 0, 4, 150);
  myE4 = new E( 0, 0, 8, 60);
  myE5 = new E( 0, 0, 16, 30);
}

void draw(){
//  rectMode(CORNER);
//  noStroke();
//  fill(255, 10);
//  rect(0,0,width,height);

  myE.display();
  myE2.display();
  myE3.display();
  myE4.display();
  myE5.display();

}

class E {
  float x;
  float y;
  float t;
  float size;
  
  
  E( float tx, float ty, float tt, float tsize){
    x = tx;
    y = ty;
    t = tt;
    size = tsize;
    
  }
  
  void display(){
  
   pushMatrix();
   strokeWeight(size*0.002);
   noFill();

   stroke(0, 50);
   translate(width/t, height/t);
   rotate(angle);
   ellipse(x, y, size, random(size));
  
   strokeWeight(size*0.001);
   stroke(random(200,255), 0, random(200,255), 50);
   line(x, y, size*0.35, size*0.35);
   popMatrix();
        
   angle += aVelocity;
   aVelocity += aAcceleration;
  }
}
  
