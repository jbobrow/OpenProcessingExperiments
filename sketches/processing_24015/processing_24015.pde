
int num = 400;
int cub = 10;
 
Rwalk[] myRwalk = new Rwalk[num];
color [] myColor = new color[2];
 
 
void setup() {
  size(500,500);
  background(255);
  noStroke();
  smooth();
 
  myColor[0] = color(89,132,189,1000);
  myColor[1] = color(140,192,108,1000);
  //myColor[2] = color(232,210,88,30);
  //myColor[3] = color(153,0,0,30);
 
 
  for(int i=0; i < myRwalk.length; i++) {
    myRwalk[i] = new Rwalk();
  }
}
 
void draw() {
 
 
  for(int i=0; i < myRwalk.length; i++) {
    myRwalk[i].update();
    myRwalk[i].display();
  }
}
 
  class Rwalk {
    int x = int(random(0,int(width/cub)))*cub;
    int y = int(random(0,int(width/cub)))*cub;
    int z = int(random(0,int(width/cub)))*cub;
    float rectSize =cub;
    color colorChoice = myColor[floor(random(0,1.5))];
 
    Rwalk() {
    }
 
    void update () {
      x = x + (int(random(0,3))-1)*cub/2;
      y = y + (int(random(0,3))-1)*cub/2;
      z = z + (int(random(0,3))-1)*cub/2;
    }
 
    void display() {
      fill(colorChoice);
      rect(x,y,rectSize,rectSize);
    }
  }

