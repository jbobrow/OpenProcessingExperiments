
Eye myEye;
//int spacing= 5; // how far apart
//int len= 200; //line length

void setup() {
  size(600, 600);
  background(255);
  frameRate(10);

}
 
void draw() {
}

void mouseClicked() {
  myEye = new Eye();
  myEye.display();
  //myEye.blink();
}
  
class Eye{ 
  float r;
  float g;
  float b;
  int x;
  int y;
  
  Eye(){ 
  x=mouseX;
  y=mouseY;
   r=random(0, 180);
   g=random(0, 150);
   b=random(0, 150);
 }
 
void display() {
 stroke(0); 
 line (x, y,  x - 75, y - 10); //far left
 line (x, y,  x - 60, y - 35);//left
 line (x, y,  x - 30, y - 50);//middle left
 line (x, y,  x - 0, y - 55); //middle
 line (x, y,  x + 30, y - 50); //middle right
 line (x, y,  x + 60, y - 35);//right
 line (x, y,  x + 75, y - 10); //far right
 
  fill(255);
  stroke(0);
  ellipse (x, y, 110, 80);
  fill(r,g,b);
  ellipse(x, y, 80, 80);
  fill(0);
  ellipse(x, y, 50, 50);

  //void blink() {
    if (frameCount % 10 == 0){
 line (x, y,  x + 75, y + 10); //far left
 line (x, y,  x + 60, y + 35);//left
 line (x, y,  x + 30, y + 50);//middle left
 line (x, y,  x + 0, y + 55); //middle
 line (x, y,  x - 30, y + 50); //middle right
 line (x, y,  x - 60, y + 35);//right
 line (x, y,  x - 75, y + 10); //far right
  fill(255);
  stroke(0);
  ellipse (x, y, 110, 80);
  blink();
    }
    else {};
    }
  }



