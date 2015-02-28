
float r = 250;
float t = 0;
float a = 1;
float b = 1;
float c = 255;

 
void setup(){
  size(600, 600);
  background(0);  
  smooth();
  frameRate(90);
}
 

void draw(){
  
  float x = r * sin(t);
  float y = r * cos(t);
    
  
  noFill();
  
  //Center
  translate(300,300);
  
  if (x>=y && x>-y){
    stroke(0,0,c);
    bezier(0,0, x,0, 0, y ,x, y);
    bezier(0,0, 0,y, x,0, x,y);
    
    stroke(0,c,c);
    bezier(0,0, x/2,0, 0, y/2,x, y);
    bezier(0,0,0,y/2,x/2,0,x,y);
    
    stroke(c,0,c);
    bezier(0,0, 0,2*y/3, 2*x/3,0, x,y);
    bezier(0,0, 2*x/3,0, 0,2*y/3, x,y);
    
  } else if (x<=-y && -x<-y) {
    stroke(c,0,0);
    bezier(0,0, x,0, 0, y ,x, y);
    bezier(0,0, 0,y, x,0, x,y);
    
    stroke(c,0,c);
    bezier(0,0, x/2,0, 0, y/2,x, y);
    bezier(0,0,0,y/2,x/2,0,x,y);
    
    stroke(c,c,0);
    bezier(0,0, 0,2*y/3, 2*x/3,0, x,y);
    bezier(0,0, 2*x/3,0, 0,2*y/3, x,y);
    
  } else if (-x>=-y && -x>y){
    stroke(c,c,0);
    bezier(0,0, x,0, 0, y ,x, y);
    bezier(0,0, 0,y, x,0, x,y);
    
    stroke(0,c,0);
    bezier(0,0, x/2,0, 0, y/2,x, y);
    bezier(0,0,0,y/2,x/2,0,x,y);
    
    stroke(c,0,0);
    bezier(0,0, 0,2*y/3, 2*x/3,0, x,y);
    bezier(0,0, 2*x/3,0, 0,2*y/3, x,y);
    
  } else if (-x<=y && x<y){
    stroke(0,c,0);
    bezier(0,0, x,0, 0, y ,x, y);
    bezier(0,0, 0,y, x,0, x,y);
    
    stroke(0,c,c);
    bezier(0,0, x/2,0, 0, y/2,x, y);
    bezier(0,0,0,y/2,x/2,0,x,y);
    
    stroke(c,c,0);
    bezier(0,0, 0,2*y/3, 2*x/3,0, x,y);
    bezier(0,0, 2*x/3,0, 0,2*y/3, x,y);
    
  } else { 
  }
  
  //Left_Top
  translate(-300,-300);
  stroke(c,c,0);
  bezier(0,0, x/2,0, 0, y/2 ,x/2, y/2);
  bezier(0,0, 0,y/2, x/2,0, x/2,y/2);
  stroke(0,c,0);
  bezier(0,0, x/4,0, 0, y/4,x/2, y/2);
  bezier(0,0,0,y/4,x/4,0,x/2,y/2);
  stroke(c,c,c);
  bezier(0,0, 0,y/3, x/3,0, x/2,y/2);
  bezier(0,0, x/3,0, 0,y/3, x/2,y/2);
  

  //Left_Bottom
  translate(0,600);
  stroke(0,c,0);
  bezier(0,0, x/2,0, 0, y/2 ,x/2, y/2);
  bezier(0,0, 0,y/2, x/2,0, x/2,y/2);
  stroke(0,c,c);
  bezier(0,0, x/4,0, 0, y/4,x/2, y/2);
  bezier(0,0,0,y/4,x/4,0,x/2,y/2);
  stroke(c,c,c);
  bezier(0,0, 0,y/3, x/3,0, x/2,y/2);
  bezier(0,0, x/3,0, 0,y/3, x/2,y/2);

  //Right_Botoom
  translate(600,0);
  stroke(0,0,c);
  bezier(0,0, x/2,0, 0, y/2 ,x/2, y/2);
  bezier(0,0, 0,y/2, x/2,0, x/2,y/2);
  stroke(0,c,c);
  bezier(0,0, x/4,0, 0, y/4,x/2, y/2);
  bezier(0,0,0,y/4,x/4,0,x/2,y/2);
  stroke(c,c,c);
  bezier(0,0, 0,y/3, x/3,0, x/2,y/2);
  bezier(0,0, x/3,0, 0,y/3, x/2,y/2);
  
  //Right_Top
  
  translate(0,-600);
  stroke(c,0,0);
  bezier(0,0, x/2,0, 0, y/2 ,x/2, y/2);
  bezier(0,0, 0,y/2, x/2,0, x/2,y/2);
  stroke(c,0,c);
  bezier(0,0, x/4,0, 0, y/4,x/2, y/2);
  bezier(0,0,0,y/4,x/4,0,x/2,y/2);
  stroke(c,c,c);
  bezier(0,0, 0,y/3, x/3,0, x/2,y/2);
  bezier(0,0, x/3,0, 0,y/3, x/2,y/2);
  
 
  c = c-b; 
  t = t+1;
  r = r-a;
  
  if(c == 0 || c == 255){
    b = b * -1;
  }
  
  if(r == 0 || r == 300){
    a = a * -1;
  }

}
