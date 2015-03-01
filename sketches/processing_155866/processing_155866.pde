

int x1 = 0;
int x2 = 100;
int x3 = 200;
int x4 = 300;
int x5 = 400;


void setup(){
  size(500,500);
}
void draw(){

  noStroke();

  fill(150,0,0);
  ellipse(mouseX,mouseY,15,15);
  
  ellipseMode(CORNER);
  
  fill(0,0,100);
  ellipse(x1,x1,20,20);
  
  fill(0,200,200);
  ellipse(x1,x2,20,20);
  ellipse(x1,x3,20,20);
  fill(0,0,100);
  
  ellipse(x1,x4,20,20);
  ellipse(x1,x5,20,20);
  ellipse(x2,x1,20,20);
  
  fill(0,200,200); 
  ellipse(x2,x2,20,20); 
  fill(0,0,100);
  
  ellipse(x2,x3,20,20);
  ellipse(x2,x4,20,20);
  ellipse(x2,x5,20,20);
  ellipse(x3,x1,20,20);
    
  fill(0,200,200);  
  ellipse(x3,x2,20,20); 
  fill(0,0,100);
  
  ellipse(x3,x3,20,20);
  ellipse(x3,x4,20,20);
  
  fill(0,200,200); 
  ellipse(x3,x5,20,20);
  ellipse(x4,x1,20,20); 
  fill(0,0,100);
  
  ellipse(x4,x2,20,20); 
  ellipse(x4,x3,20,20);
  
  fill(0,200,200); 
  ellipse(x4,x4,20,20);
  fill(0,0,100);
    
  ellipse(x4,x5,20,20);
  ellipse(x5,x1,20,20); 
  
  fill(0,200,200); 
  ellipse(x5,x2,20,20); 
  fill(0,0,100);
  
  ellipse(x5,x3,20,20);
  ellipse(x5,x4,20,20);
  ellipse(x5,x5,20,20);
  
}


