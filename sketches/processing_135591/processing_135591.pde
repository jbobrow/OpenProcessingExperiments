
/*void setup() {
  size (500, 400);  
  stroke (255, 0, 100);
  background (100, 250, 200);
}

  void draw() {
       line(250, 200, mouseX, mouseY);
     }
     
     void mousePressed() {
       background(100, 250, 200);
     } */

void setup () {
  size(500,400);
background(250, 40, 100);

}
void draw  () {
 
  stroke(20,200,255,random(100,150));
  line(mouseX,mouseY,200,400);
  stroke(random(20,250),200,255,random(100,150));
  line(mouseY,mouseX,200,400);
  stroke(random(200,250),200,255,random(100,150));
  line(mouseX, random(0, height/2),100,50);
  stroke(random(50,150),200,255,random(100,150));
  line(mouseY,random(height/2,height),50,100);
}

void mousePressed() {
       background(250, 40, 100);
}


