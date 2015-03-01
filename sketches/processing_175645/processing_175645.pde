
float theta = 0;
 float alpha = 10;
  
  
void setup(){
  background(255);
  frameRate(30);
  noStroke();
  size(600, 600);
  fill(0, 10);
  smooth();
}
 
void draw(){
   
  for(int i = 0; i < 200; i+=20){
   el(200-i, random(100));
  }
} 
 
void el(int rad, float size){
  ellipse(width/2+(rad*cos(theta)), height/2+(rad*sin(theta)), size, size);
  theta+=1;
   
  if(theta%300 == 0){
    float color1 = random(#D81414);
    float color2 = random(#E220E3);
    float color3 = random(#0FB9F5);
    fill(color1, color2, color3, alpha);
   }
    
   if(frameCount%100==0){
     background(255);
     alpha-=1;
   }else{
       alpha+=1;
     }
   
}

