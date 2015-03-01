
int num = 20; //numbers of element in one cricle 
float digree; //Rotation Degree 360*consistent speed 
int maxFrameCount = 120; //divide one third of 360degree
float t; //Rotation Degree 360*consistent speed 

//float speedRadius = 10;

float speed = 0.02;
float scalar = 0.1;
//float scalar2 = 0.08;

float Noiseeee = 0.0;
 
void setup() {
  size(500, 500);
  rectMode(CENTER);
  frameRate(30);
  background(255);
}

void draw() {
  //background(255);//check movement pattern
  noStroke();
  noFill();
  t = (float)frameCount/maxFrameCount; //consistent speed 
  digree = TWO_PI*t; //Rotation Degree 360*consistent speed 
  
  //Translation&Rotation  
  translate(width/2, height/2);
  pushMatrix();//avoid upline translation
  rotate(digree/num);//rotate translation
  
  
  for (int i=0; i<num; i++) {
    pushMatrix();//avoid upline translation
    float offSet = TWO_PI/num*i; //each element rotation scale 
    rotate(offSet);
    float sz = map(sin(digree+offSet), -1, 1, 5, scalar*1); //map width from -1 to 1 to target
    //sz+=speedRadius;
    
    Noiseeee = Noiseeee + .01;
    float n = noise(Noiseeee) * 255*1.5;
    
    float x = scalar;
    scalar += speed; // width Scale UP
    stroke(255-n,20);
    //ellipse(x, 0, sz, sz);
    
    //noStroke();
    //fill(n,20);
    //noFill();
    //rectMode(CENTER);
    rect(x, 0, sz, sz);

    println(digree/num);
    
    //float sz2 = map(sin(-digree+offSet), -1, 1, 5, 30);
    //float x2 = scalar2;
    //stroke(255);
    //fill(20,10);
    ellipse(x, 0, sz, sz);
    
    popMatrix();
  }
  popMatrix();
  //saveFrame("image-###.jpg");
}
