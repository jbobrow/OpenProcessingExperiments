
//A rectangle pattern that becomes a spoke and hub pattern//

int a = 150;
int b = 300;


void setup() {
  size(550, 550);
  background(150, 30, 30);

  frameRate(24);
}


void draw() {

  pushMatrix();
  translate(200, height/2);
  //puts offcenter

  rotate(radians(a));
  //turn1  
  translate(10, 100); 
  //move1    
  rotate(radians(b));
  //turn2, changes centershape
  translate(100, 100);
  //move2
  rotate(radians(b + 50));
  //turn3, changes pinwheel
  fill(0, random(100), random(100), 20);

  rect(15, 10, 20, 100); 

  popMatrix();


  a+=200;
  b++;
}


