
import OpenVisuals.*;

//Oscillation
//developed by Daniel Shiffman, Robert Moon
//OpenVisuals imp. by Sinan Ascioglu

// Polar to Cartesian
// Convert a polar coordinate (r,theta) to cartesian (x,y)
// x = r * cos(theta)
// y = r * sin(theta)

Coin[] coins;
OpenVisuals ov;

void setup(){
  size(900,450);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  
  
  //openVisuals setup
  ov = new OpenVisuals(this);
  ov.setMaxRows(100);
  String[] fields = {"bubble radius", "bubble speed"};
  ov.setFields(fields); //setFields
  //ov.createRandomTable();
  ov.loadDatasetXML("http://openvisuals.org/dataset/repository/dataseta367a47e80594d5384bc4c5ecd20dfc1.xml");
  
  //setup coins
  int totalBubbles= ov.getTotalRowNumber();
  coins = new Coin[totalBubbles];
  while(ov.nextRow()){ //for all data rows
  int i = ov.getCurrentRowNumber();
     coins[i] =  new Coin(); //create a coin
     coins[i].theta_vel = ov.getDataVar(0.2, "bubble speed"); //get velocity from data 
    coins[i].theta_acc = 0.0002;
    coins[i].r = ov.getDataVar(50, "bubble radius")*4; //get size from data
  }
  
  ov.debug("hold mouse click for zooming out");

}

void draw(){
  background(100);
  translate(width/2,height/2);

  while(ov.nextRow()){ //create coins
    int i = ov.getCurrentRowNumber();
    coins[i].make();
    coins[i].move();
    coins[i].mouse();
  }
  
  ov.displayInterface(10,10);
  
}

class Coin{
  float r;
  float theta;
  float theta_vel;
  float theta_acc;
  int scaleCircle;  
  
  Coin(){
  r = 100;
  theta = 0.0f;
  theta_vel = 0.0f;
  theta_acc = 0.0001f;
  }
  
  void make(){
  //Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  //Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  noStroke();
  fill(200);

      ellipse(x,y,1+scaleCircle,1+scaleCircle);
    
  }
  
  void move(){
  //Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
  }
  
  void mouse(){
    if ((mousePressed == true) && (scaleCircle > 1)) {
      scaleCircle = scaleCircle - 1;
    } 
    if ((mousePressed == false) && (scaleCircle < 50)) {
      scaleCircle = scaleCircle + 1;
    }
  }
  
}

