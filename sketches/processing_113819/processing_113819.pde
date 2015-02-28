
int diameter = 100;

void setup(){
  size(350,400);
  rectMode(CENTER);
}

void draw(){
  background(0,139,191);
  diameter = diameter+2;
  
  if(diameter>=200){
    fill(255,255,255);
    noStroke(); 
    ellipse(width/2,height/2,diameter,diameter);
  }else if(diameter<=200){
    fill(255);
    noStroke();
    rect(width/2,height/2,diameter,diameter);
  }
    
  
  println(diameter);
  
  
  
  }  



