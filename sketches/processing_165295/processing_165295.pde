
void setup (){
  size (300,300);
  background(255 ,109 ,0);

  fill(0,160,178);
  noStroke();
  smooth();
}
 
void draw (){
  for(int x = 15; x < 300; x +=30){
    for(int y = 0; y <300; y +=30)
    triangle(x,y, x-15,y +30,x +15,y +30);
     
 
  }
 }

