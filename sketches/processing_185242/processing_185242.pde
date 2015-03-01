
//appearance
int columns = 15; //number of squares horizontally 
int rows = 30; //number of squares vertically
int s = 20;  //size of squares

    //15x3 squares before transfiguration
float r = 0; //determines the randomization/placement of squares in lower quadraint
int margin = 20; //margins=20>>columns & rows do not exceed 20 on either side
float n; //aids in randomization
  
//setup
void setup(){
  size(395,730);
  background(0);
  noFill();
  rectMode(CENTER); 
  noLoop();
  strokeWeight(.75); //thickness of line
  stroke (255); //line color
  
}
  

//draw  
void draw(){
  for(int y=1; y<=rows; y++){
    r =r+(y*0.1); //spacing
    for(int x=1; x<=columns; x++){
      pushMatrix(); //stores the setup of the origin (translation & rotation).
      n = random(-r,r);
      translate(margin+(x*s)+(n*.8),margin+(y*s)+(n*.8)); //transfiguration of squares
      rotate(radians(random(r))); 
      rect(20,20,s,s); //rectsize
      popMatrix(); //sets the coordinates back to the stored position.
    }
  }
}
