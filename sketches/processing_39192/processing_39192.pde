
//Nicklaus WIlliams
void setup(){
  size (400,400);
  background(255,25,25);
  smooth();
}
 
void draw(){
  for (int x=0; x<width; x+=10){
    for (int y=0; y<width; y+=10){
      points (x,y);
     //formation of grid using points, locations of grid with x,y and a,b included with below function
    }
  }
}
 
void points (float x, float y) {
  pushMatrix();
  translate (x,y);
  for(int a=0; a<10; a+=10/3){
    for(int b=0; b<10; b+=10/3){
       //makes new points to set with grid
       
    stroke(random(0,255));
    strokeWeight(2);
    point(a,b);
  }
}
noLoop();
  popMatrix();
  //ends push matrix
}
   
  



