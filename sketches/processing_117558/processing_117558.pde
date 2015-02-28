
Dresser pink;
Dresser purple;
Dresser green;

void setup(){

  size(640,480);
  smooth();
  
  pink = new Dresser(50,50,color(255,10,100) );
  purple = new Dresser(300,150,color(100,40,200));
  green = new Dresser (400,300,color(10,120,50));

}


void draw(){
  background(255);
  
  pink.update();
  pink.display();
  pink.wrap();
  pink.spaz();
  
  purple.update();
  purple.display();
  purple.wrap();
  
  green.update();
  green.display();
  green.wrap();


}

class Dresser {

  float xpos, ypos;
  float w, h; 
  float xspeed;
  float yspeed;
  color fillVal;
  String name;


  int rad = 60;        // Width of the shape 

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom

  //Constructor - no void because it doesnt return anything
  Dresser(float x, float y, color fv) {
    xpos = x;
    ypos = y;
    w = 100;
    h = 50;
    xspeed = random(2, 10);
    yspeed = random(2, 10);
    fillVal=fv;
  }

  //function
  
  void display() {
  fill(fillVal);
  pushMatrix();
//dresser
  beginShape();
  rect(xpos, ypos, 190, 100);
  fill(random(255), random (255), random (255));
  rect(xpos+10,ypos+10, 50,10);
  ellipse(xpos+35,ypos+15,3,3);
  rect(xpos+10,ypos+30, 50,20);
  rect(xpos+10,ypos+60, 50,20);
  rect(xpos+70,ypos+10, 50,10);
  ellipse(xpos+95,ypos+15,3,3);
  rect(xpos+70,ypos+30, 50,20);
  rect(xpos+70,ypos+60, 50,20);
  rect(xpos+130,ypos+10, 50,10);
  ellipse(xpos+155,ypos+15,3,3);
  rect(xpos+130,ypos+30, 50,20);
  rect(xpos+130,ypos+60, 50,20);
  popMatrix();
    fill(0);
  }
  
  
  
  void update() {
    xpos = xpos + xspeed;
  }
  


  
  
  void wrap() {
    if (xpos > width+50) {
      xpos = -w-50;
    }
  }
  
  
  
            void spaz() {
              xpos = xpos + ( xspeed * xdirection );
              ypos = ypos + ( yspeed * ydirection );
              if (xpos > width-rad || xpos < rad) {
                xdirection *= -1;
              }
              if (ypos > height-rad || ypos < rad) {
                ydirection *= -1;
              }
            }
}



