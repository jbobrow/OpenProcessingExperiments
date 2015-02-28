
int diameter = 100;

void setup(){
  size(350,400);
  
}

void draw(){
  background(0,139,191);
  diameter = diameter+2;
  
  if(diameter>=200){
    fill(255,255,255,100);
  }else
    fill(255);
  
  println(diameter); 
  noStroke();
  ellipse(width/2,height/2,diameter,diameter);
  
  }  



