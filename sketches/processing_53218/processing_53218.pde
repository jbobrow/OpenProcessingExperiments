
//Loop, Emerge, Decay

//defining variable(g)
float g =1;

//defining the loop value
float j;
 
void setup(){
  size(250, 250);
  background(0);
  smooth();

}
 
void draw(){
  //speed of loop colors / rectangles / frame rate on screen...
  frameRate(155);
  
   //rectangles are being made
   for(j=1.0; j>-50; j-=1){
   growing_shape(g+j*1);
   }
   
   //the rate the rects are being expanded
  g+=1;
  
 if (g>260){
   
   background(0);
   
   g=-50.0;
    
 }
}
void growing_shape(float g){
  
    //rectangle starts from the centre
    rectMode(CENTER);
    rect(125, 125, g, g);

  //colour of rectangles
  fill(random(250), 250, 150);
  

}               
