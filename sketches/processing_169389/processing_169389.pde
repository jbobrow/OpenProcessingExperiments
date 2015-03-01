
Object o1 = new Object(0,0);
Object o2 = new Object(0,600);
Object o3 = new Object(600,0);
Object o4 = new Object(600,600);

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  o1.move();
  o1.display();
  o2.move();
  o2.display();  
  o3.move();
  o3.display();
  o4.move();
  o4.display();  
}


class Object {
  float x,y; //location
  float xs, ys; //speed
  //float c=random(0,255); //color
  float h=0;
  
  //initializer
  Object (float tx, float ty) {
    x=tx;
    y=ty;
    xs=random(5,10);
    ys=random(5,10);
  }
  
  void location(float tx, float ty){
    x=tx;
    y=ty;
  }
  
  void move() {
    x+=xs;
    y+=ys;
    if (x < 0 || x > width){
      xs=-xs;
    }
    if (y < 0 || y > width){
      ys=-ys;
    }
  }
  
  void display() {
    h+=.5;
    fill(120/2*(sin(h)+1),0,144/2*(sin(h)+1),100);
    smooth();
    ellipse(x,y,20,20);
  }
}

void keyPressed(){
  if(key=='x'){
    background(255);
  }  
}

