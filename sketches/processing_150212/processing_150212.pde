
 
 ArrayList <Square> squares;
void setup(){
size(600,600);
   
squares= new ArrayList <Square> ();



for(int i=0; i<60; i++){
  for(int j=0; j<60; j++){
  squares.add(new Square( 10*i,10*(j), 1000 ));
  }
}
  }

void draw(){
   background(255);
   
   
   for(int i=0; i<squares.size(); i++){
    Square s = squares.get(i);
    s.update();
    s.display();
   }
    
   }
   
   
 
 
class Square {
  float  centX;
  float centY;
  float radius;
  color hit;
  color notHit;

  Square( float x, float y, float rad) {
    centX=x;
    centY=y;
    radius= 1;

    hit= color((#FFF8E7));
  }


  void display() {
   noStroke();
    fill(hit);
    rect(centX, centY, 9, 9);
  }


 
  void update() {
    radius= 20;
    if (dist(mouseX, mouseY, centX, centY)<radius) {
      hit= color(random(255), random(255), random(255));
    }
    if (mousePressed) {
      hit= color(#FFF8E7);
    }
     if (dist(mouseX, mouseY, centX, centY)<radius && keyCode==UP) {
      hit= color(0, random(255), random(255));
    }
     if (dist(mouseX, mouseY, centX, centY)<radius && keyCode==DOWN) {
      hit= color(random(255), random(255), 0);
     if (dist(mouseX, mouseY, centX, centY)<radius && keyCode==RIGHT) {
      hit= color(random(255), 0,random(255));}
    }
  }
}
