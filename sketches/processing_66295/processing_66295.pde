
int a = 12;
int yaxis = 30;

void setup(){
  size(500, 500);
  background(122,23,23);
  noStroke();
  frameRate(30);
  smooth();
}

void draw(){
  background(0);
  fill(500, 0, 10);
  ellipse(50, yaxis, 20, 20);
 
  yaxis +=a; 
  if(yaxis >500 || yaxis<0){
  a*= -1;
 }




  fill(500, 0, 10);
  ellipse(12, yaxis, 20, 20);
 
  yaxis +=a; 
  if(yaxis >500 || yaxis<0){
  a*= -1;
  }


  fill(500, 0, 10);
  ellipse(400, yaxis, 20, 20);
 
  yaxis +=a; 
  if(yaxis >500 || yaxis<0){
  a*= -1;  
  }
  
  
  fill(500, 0, 10);
  ellipse(62, yaxis, 20, 20);
 
  yaxis +=a; 
  if(yaxis >500 || yaxis<0){
  a*= -1;
  }


  fill(500, 0, 10);
  ellipse(45, yaxis, 20, 20);
 
  yaxis +=a; 
  if(yaxis >500 || yaxis<0){
  a*= -1;  
  
  }}

