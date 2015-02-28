
void setup() 
{
  size(500,500);
  background(175);

  smooth();
frameRate(4);
//stroke(0.5);
}


void draw (){
  


drawRect (0,5,height/15,width-10) ;

  
 
}


void drawRect(int startW , int startX , int startY, int startZ){
  
 

  strokeWeight(startZ/random(55,60));
  
  for(int i=0; i<width/2; i+=1) {
     for(int j=0; j<width/2; j+=1) {
    fill (random(3,100),50,50,1);

  rect(startW,startX*j,startY*i, startZ );

  
  
  i=i+1;
  j=j+6;

}
  }

}

