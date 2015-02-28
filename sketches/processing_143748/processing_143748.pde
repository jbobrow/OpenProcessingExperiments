
//int l = 50;
int s = 50;
int x1 = 50;
int y1 = 50;
int x2 = 100;
int x3 = 150;
int y2 = 100;
int y3 = 150;
int x;
int y;
int i = 2;
int t = 100;


void setup(){
  size(400, 400);
  background(255);
  smooth();
  
  x = x1 += x1/2;
  y= y1 += y1/2;
}

void draw(){
  background(255);
  
  stroke(255);
  fill(255);
  rect(x2,y2,s,s); //invisible square
  
  
  fill(255,0,0);
  
  stroke(0);
  rubik(t, 50,150); //other red square, apart of custom object
  //rubik(t, 100, 150); //custom object cubes I commented out
 // rubik(t, 150, 150);
  
  strokeWeight(5);
  stroke(0);
  
 // if(mouseX > x){ //|| (mouseX< x +w){
  
  if (mousePressed){
    
   if(dist(x1, y1, mouseX-(s/2), mouseY-(s/2)) < s){ 
    x1 = mouseX-(s/2); //if mouse is pressed, then the rectangle will follow the mouse
    y1 = mouseY-(s/2);
   }
 
  }
  
if(dist(x1,y1,x2,y2) <s){ //if the red square is moved over the invisible square, it will turn blue
  fill(0, 0,255);
}
  
  
  rect(x1, y1, s,s);//red or blue rectangle
  
  
  
 

}


void rubik(int x, int y, int d){ //made my own object, I will use this for all the small cubes
  
  pushMatrix();
  translate(x, y);
  
  //noFill();
  //for(int i = 2; i <= d; i += 50){
    rect(i,110, 50, 50);
 // }
  popMatrix();
}



