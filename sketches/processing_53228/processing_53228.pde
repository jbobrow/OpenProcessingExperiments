
//SPLIT (watch entire thing)

//defining variable(g)
float g =1;
//defining variable(h)
float h =1;
//defining the loop value
float j;
 
void setup(){
  size(250, 250);
  background(0);
  smooth();

}
 
void draw(){
  //speed of loop colors / rectangles / frame rate on screen...
  frameRate(500);
  
   //rectangles are being made
   for(j=1.0; j>-50; j-=1){
   growing_shape(g+j*5);
   }
   
   //the rate the rects are being expanded
  g+=1;
  
 if (g>800){
   
   background(0);
   
   g=-1.0;
    
 }
}

void growing_shape(float g){

ellipseMode(CENTER);

  //colour of rectangles
  fill(250, 255, 10);
 

//top
ellipse(125,g+130,g,125);
//bottom 
ellipse(125,-g+120,g,125);


}
