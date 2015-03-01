
float px=1;
float py=300;
float v=3;

void setup(){
size (600,600);

} 
void draw(){
  background(18);
 
  if(px<width/2){
     px=px+(v*3);
   
      ellipse( px,300,10,10);
  }else{ 
    
     py=py-(v*1.5);
  }
  
  ellipse(px,py,10,10);
  
}
