
void setup(){
  size(800,600);
}

void draw(){
  background(0,0,20);
 

  fill(240,240,255,5);
  stroke(255,255,255,100);
  
  for(int i=30; i<width; i=i+45){
    for(int y=30; y<height; y=y+48){
  
  ellipse(i,y,40,40);
  if(mouseX<700){
  ellipse(i+5,y+5,20,20);
  }
  else{
   ellipse(i,y,40,40);
  }
  
  if(mouseX<600){
   fill(252,8,65);
   ellipse(i+5,y+5,20,20);
   ellipse(i+5,y+8,20,20);
  }
  else{
   ellipse(i,y,40,40);
  }
  if(mouseX<400){
   fill(8,50,252);
   ellipse(i+5,y+5,20,20);
   ellipse(i+5,y+8,20,20);
   ellipse(i+8,y+10,20,20);
  }
  else{
   ellipse(i,y,40,40);
  }
 
  if(mouseX<200){
    fill(252,255,random(255));
    ellipse(i+10,y+12,10,10);
  }
  else{
   ellipse(i,y,40,40);
  }
} 


}
}                               
