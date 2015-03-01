
float a=0; 
float c=0;
void setup(){  
  size(500,500);
  smooth();  
  noStroke(); 
} 

void draw(){  
  
  fill(0,5);  
  rect(0,0,500,500);
  
  translate(500/2,500/2);  
  rotate(a);  
  
  fill(255);  
  ellipse(50,50,30,30);  
  
  fill(255,0,0);
  ellipse(100,100,60,60);

  a+=2;
  
  
  fill(255,0,0);
  rect(800,800,400,400);
  
  //translate(200/2,200/2);
  rotate(c);
  
  fill(0);
  ellipse(50,50,20,20);
  
  fill(0,0,255);
  ellipse(100,100,50,50);
  
  c+=1;
  
  
}


