
void setup(){

size(800,800);


}
void draw(){
background(0);



translate(width/2,height/2);

drawCircle(0,0,width/2);

}


void drawCircle(float x, float y,int diam)
{
 fill(255);
  
   
  rotate(radians(frameCount/3));
   ellipse(x,y,diam,diam);


  
  if(diam >10) {
  drawCircle(x+diam/2,y,diam/2);
  drawCircle(x-diam/2,y,diam/2);
 drawCircle(x,y+diam/2,diam/2);
 drawCircle(x,y-diam/2,diam/2);
  }

}



