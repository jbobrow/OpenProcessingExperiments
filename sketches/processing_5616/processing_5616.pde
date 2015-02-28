
 int hor;
 int ver;
 int s;
 
void setup(){

size (300, 300);

background (255);

s=40;


}

void draw(){
 
  
    if (hor >= width){
        hor = -s-1;}
  
    if (hor <= -s-2){
  hor = width;}
  
    if (ver >= height){
  ver = -s-1;}
  
    if (ver <= -s-2){
  ver = height;}
  
  if ( keyPressed ){
    
      switch ( keyCode ){
        
        case UP: ver -= 1;
        break;
        
        case DOWN: ver += 1;
        break;
        
        case LEFT: hor -= 1;
        break;
        
        case RIGHT: hor += 1;
        break;
             
      }
      
      switch (key){
        
        case '+': s += 1;
        break;
        
        case '-': s -= 1;
        break;
      }
      

  }
  
  float r = map (ver, 0, width, 0, 255);
  float g = map (hor, 0, height, 0, 255);
  
  background (r, g, 0);
  
  fill (g, r, 0);
  
  stroke(255);
  
  rect (hor, ver, s, s);
  

  
}

