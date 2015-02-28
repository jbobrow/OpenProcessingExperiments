
//three coordinates for making the triangle
int x1 = 0;  int y1 = 120;
int x2 = 0;  int y2 = 180;
int x3 = 50; int y3 = 150;

void setup() {
  size(800,300);
  background(0,150,0);
}

void draw() {
  background(0,150,0);
  //makes red triangle at left egde of screen
  fill(255,0,0);
  Triangle playerTriangle = new Triangle(x1,y1,x2,y2,x3,y3);
  playerTriangle.display();
  
  //blue circles
  fill(0,0,255);
  ellipse(200,160,20,20);
  ellipse(487,100,20,20);
  ellipse(780,243,20,20);
  ellipse(276,90,20,20);
}
void keyPressed() {
    if(key == CODED) {
      //right arrow key pressed
      if(keyCode == RIGHT) {
        x1 += 5;
        x2 += 5;
        x3 += 5;
      }
      //right arrow key pressed and go on to next level
      else if(keyCode == RIGHT && x1 >= 800 && x2 >= 800) {
        x1 = 0;
        x2 = 0; 
      }
      //left arrow key pressed and cannot go off screen
      else if(keyCode == LEFT && x1 > 0 && x2 > 0) {
        x1 -= 5;
        x2 -= 5;
        x3 -= 5;
      }
      //up arrow key pressed and cannot go off screen
      else if(keyCode == UP && y1 > 0) {
        y1 -= 5;
        y2 -= 5;
        y3 -= 5;
      }
      //down arrow key pressed and cannot go off screen
      else if(keyCode == DOWN && y2 < height) {
       y1 += 5;
       y2 += 5;
       y3 += 5;
     }
   }
}
public class Triangle {
  public Triangle() {
  }
  public void render() {
    fill(255,0,0);
    beginShape();
    vertex(x1,y1);
    vertex(x2,y2);
    vertex(x3,y3);
    endShape();
  }
  Triangle(int a1, int b1, int a2, int b2, int a3, int b3) {
    x1 = a1; y1 = b1;
    x2 = a2; y2 = b2;
    x3 = a3; y3 = b3; 
  }

  void display() {
    triangle(x1,y1,x2,y2,x3,y3);
  }
}



