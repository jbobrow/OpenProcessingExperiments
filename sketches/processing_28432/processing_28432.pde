
int abstand = 30;
 
void setup(){
  smooth();
  size(600, 600);
}
 
void draw() {
  background(255);
  noStroke();
  fill(0,255/3);

   for(int x=0; x <= width; x = x+abstand){
    for (int y=0; y <= height; y = y+abstand){

  triangle (x-30, y+30, x, y-30, x+30,y+30 );   
  
    }
  }
   
}

