
float centerX = 0;
float centerY = 250;
  
int dir = 1;
 
   
void setup() {
  size (500, 700); //the size of perimeter
  smooth(); //turns on anit-alliasing, which smooths out some rough edges
}
   
void draw () {
  background (0);
     
  ellipseMode(CENTER);
     
  //Body
  //stroke(0); //black
  noStroke();
  fill(255); //mango
  //ellipse(160, 130, 80, 80);
  ellipse(centerX, centerY, 80, 80);
     
 centerX = centerX+3*dir;
    
  if(centerX>500||centerX<0){
    dir=dir*-1;
  }
   
}

