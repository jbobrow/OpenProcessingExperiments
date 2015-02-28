
int aroY;
int aroX;
 
int am=0;
int az=0;
int r=0;
int v=0;
int n=0;

 
void setup(){
  size(600,400);
  smooth();
  background(255);
   
   
 
}
 
void draw(){
 
   
   aroX = int(random(550));
   aroY = int(random(330));
    
  
   
   background(255);
  
  strokeWeight(10);
  noFill();

 
 stroke(#CB2929);
if ((aroX!=340) && (aroY!=100) && r!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  ellipse(340,100,100,100);
  r=1; 
 }
  
  
 
 stroke(#337C28); 
 if ((aroX!=280) && (aroY!=140)&& v!=1){
  ellipse(aroX,aroY,100,100);
}
else{
  ellipse(280,140,100,100);
  v=1;
 }
  
  
 stroke(#050505); 
 if ((aroX!=220) && (aroY!=100) && n!=2){
   
  ellipse(aroX,aroY,100,100);
}
else{
  
  ellipse(220,100,100,100);
  
  n=2;
 }
  
 stroke(#F7E450); 
 if ((aroX!=160) && (aroY!=140)&& am!=1){
  ellipse(aroX,aroY,100,100);
}
else{
 
  ellipse(160,140,100,100);
  am=1;
 }
  
  
  stroke(#4B7CC9); 
 if ((aroX!=100) && (aroY!=100)&& az!=1){
  ellipse(aroX,aroY,100,100);
}
else{
 
  ellipse(100,100,100,100);
  az=1;
 }
 
 
}
