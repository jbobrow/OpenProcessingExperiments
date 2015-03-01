
void setup(){
  size(750,500);
  frameRate(60);
  smooth();
  }
  
  int s=10;


void draw(){
//nested loop
for (int y=0; y<height; y=y+s){
   for (int x=0; x<width; x=x+s)
    {
    //line(30,x, 700,x);
      fill(random(255),random(255),random(255));
      rect(x,y,s,s);
    }
   
}
}



