
int x;
int y; 

void setup(){
  size(1000,1000);
  smooth();
}
 
void draw(){
  background(240,232,242);
  stroke(209,105,105);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if((x % 20) == 0){
        line(x,y,x+9,y-6);
      } else {
        line(x,y,x+8,y+6);
        fill(random(255),random(255),random(255));
        ellipse(x,y,map(mouseX,0,width,0,20),map(mouseX,0,width,0,20));
        
        if((x * 20) == 0){
        line(x,y,x+10,y-6);
      } else {
        line(x,y,x+8,y+6);
        fill(random(255),random(255),random(255));
        triangle(30, 75, 58, 20, 86, 75);
      }
    
      }
    }
  }
}


