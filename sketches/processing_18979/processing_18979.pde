
void setup() {
  size(400,400);
  colorMode(RGB,400);
}

int x = 0;

void draw() {  
 
  
  if (x>width){
   x=-400;
  } 
  
  if (x<0){
    fill(x*50);}
    
    if(x>0){
      fill(x);}
      
      if (mousePressed){
        rectMode(CENTER);
        rect(mouseX,mouseY,x,x);}
        
        println(x);
      
  ellipse(width/2, height/2, x, x);
  x++;
  }


