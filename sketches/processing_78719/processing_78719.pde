
void setup (){
  size (730,485);
  background(255, 222, 188);
  noStroke();
  smooth();
}
 
void draw (){
  fill (198, 2, 5);
  for(int x = 0; x < 730; x +=105){
    for(int y = 0; y < 485; y +=35)
    rect(x,y, 100, 30);
  
 }
}
