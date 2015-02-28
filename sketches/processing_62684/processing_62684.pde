
PImage j;
Nube[] myNube = new Nube[15];

void setup (){
  size (1200,700);
  j = loadImage ("jardin.jpg");
  smooth();
  for (int i=0; i < myNube.length; i++){
    myNube[i] = new Nube (random(width+60),random(0,180),100);
  }
}
void draw (){
  background(j);
  for (int i=0; i < myNube.length; i++){
    myNube[i].display();
    myNube[i].move();
  }
}

class Nube {
  float x;
  float y;
  float a;

  
  Nube (float x1, float y1,float escalar){
    x = x1;
    y = y1;
    a = escalar/100.0;
  }
  
  void display(){
    noStroke();
    fill(245,183,235);
    scale(a);
    pushMatrix();
    ellipseMode(CENTER);
    ellipse(x+12.5,y-20,45,45);
    ellipse(x-12.5,y-5,95/2,95/2);
    ellipse(x+21.5,y-2.5,45,45);
    ellipse(x+42.5,y-15,45/2,45/2);
    ellipse(x-34,y-7.5,25,25);
    ellipse(x-42.5,y+10,15/2,15/2);
    popMatrix();
  }
  void move(){
    if (mousePressed){
      frameRate(65);
      x = x+1;
      if(x > width +120){
        x = -120;
      }
    }
  }   
}
    


