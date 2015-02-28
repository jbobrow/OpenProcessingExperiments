
void setup(){
 
size(400,400);
background(255);

 fill(0);
  rect(100,0,200,400);
 


}

void draw(){
  
 
  
  int i = 0;
    int r=int(random(255));
  int g=int(random(255));
  int b=int(random(255));
  int t=int(random(100));


  



     
       if (mousePressed==true && mouseX>100 && mouseX<300){
         
 while(i<400) {
   stroke(r,g,b,t);
  line(mouseX,mouseY,i,0);
   i = i + 20;
 }}
 
 
 else{

if (mousePressed==true && (mouseX<100 || mouseX>300)){
    
   
    
 while(i<400) {
   
   stroke(r,g,b,t);
  line(mouseX,mouseY,i,400);
   i = i + 20;
 }}
}}





