
int petali;
void setup(){
 size(800,600); 
petali = 8;
}
  
  
void draw(){
  background(random(1,255),random(1,255),random(1,255));
  translate(width/2,height/2);
  scale(random(2,10));
  fill(#FFEC17);
  ellipse(0,0,50,50);
  fill(random(1,255),random(1,255),random(1,255));
  line(0,25,0,200);
  for(int i=0;i<petali;i++){
   rotate(TWO_PI/petali);
   fill(random(1,255),random(1,255),random(1,255));
   ellipse(0,70,30,80);
 
  }
    
}
  
