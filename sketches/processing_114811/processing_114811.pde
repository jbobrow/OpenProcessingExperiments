
int diameter = 100;
int positionX = 50;
int Switch = 0;
void setup(){
  size(400,400);
}
void draw(){
  background(255);
  fill(5);
 
  if(positionX >= width-diameter/2){
    Switch = 1;
  
    }
   if(positionX == diameter/2){
    Switch = 0;
   }
   
  if (Switch==0){
   positionX++;   //position = position + 1;
 
     
    
}else{
    positionX--; }
      
 
  ellipse(positionX,100,diameter,diameter);
   }




