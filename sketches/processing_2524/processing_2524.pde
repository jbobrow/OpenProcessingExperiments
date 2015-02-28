
/*

 jenna Noise
 June 9
 jenna@jennaledger.com
 
 */
 
float rot = PI;
float rad = 20;
float speed = .01; 
float squareSize = 5;

float seed = 0;
float seed2 = 0;

void setup(){

  size(400,300);
  background(65,10,175);
  smooth();

};


void draw(){
  
  rad = noise(seed) * 200;
  seed= seed + 0.009; 
  
  squareSize = noise(seed2) * 20;
  seed2 = seed2 + 0.01;
  
  translate(200,150);
  rotate(rot);
  stroke(100,120,150,25);
  line(0,0,rad,0);
  fill(40,5,75,75);
  rect(rad,0,squareSize,squareSize);

  
  rot= rot+speed;

};

void keyPressed() {
  save("circle"+ key +".png");
};

