
float yPos = 0;
float vel = 5;
//float acc = 0.5;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(255,255,255);
  fill(255,0,127);
  noStroke();
  yPos += vel;
  //vel += acc;
  ellipse(250, yPos, 90, 90);
  
  if(yPos < 0 || yPos > height){
   // vel *= -0.95;
   vel *= -1;
  }
}

                
                
