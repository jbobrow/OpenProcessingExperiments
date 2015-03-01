
int eSize=5;

size(400,400);
ellipse(200,200,400,400);

background(255);
smooth();

for(int y=0; y<=400; y++){
  for(int x=0; x<=400; x++){
    
    
      fill(x*2,255-y,y*5);
      noStroke();
      
 ellipse(x,y,eSize,eSize);
 
 
 
  }}
 
 for(int a=35; a<=400; a+=10){
  for(int b=110; b<=400; b+=10){
     
if(a>35 && a<400 && b>110 && b<400){

stroke(1);
  
}else{
  
noStroke();


rect(a,b,a,b);

}}}


