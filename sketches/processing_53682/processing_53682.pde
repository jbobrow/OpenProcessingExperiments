
boolean on = true; 
Coco c; 

void setup() {
size(500, 500);
c = new Coco (0, 0);
}

void draw() {
background(22, 222, 67);
smooth();
c.display();
}

class Coco {
  float x;
  float y;
  Coco (float x, float y) {
    this.x = x;
    this.y = y;
  }

void display(){
  translate(x,y);

size(700, 700);
noStroke();
smooth();
 
 
fill(0,0,0);// left ear
ellipse (410, 180, 60,60);
 
fill(0,0,0);// right ear
ellipse (200, 180, 60,60);
 
fill(75,43,17);
 
ellipse (300,300, 300,300);
fill(255);
ellipse (260,265,70, 70);
ellipse (360,265,70, 70);
fill(3,3,3);
ellipse(260, 265, 15,15);
 
rect(270, 350, 90,10);
 
 
ellipse(310, 320, 70, 40);
 
 
fill(300,300,300);
rect(316, 360, 20,30);
rect(290, 360, 20,30);
 
 
fill(3,3,3);
ellipse(360, 265, 15,15);

if (on==false) {

}
}


}


