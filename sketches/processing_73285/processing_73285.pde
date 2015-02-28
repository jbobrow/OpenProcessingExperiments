
int x;
int dir;
int X;
boolean displayOn;
void setup(){
  
  size(600,600);
  colorMode(HSB,360,100,100,100);
  smooth();
  noFill();
  stroke(.1);
  background(278,31,56,57);
  int X=1;
boolean displayOn=false;
  int dir=-1;
  
}
void draw(){
  
   rect(100,200,50,50);
   fill(236,44,71,76);
   rect(400,200,50,50);
   // backround table
 println("x: " +mouseX + " y: " +mouseY);
      



      //grid
  for(int x=0; x <100; x++){
    for(int y=0; y <100; y++){
     rect(x*10,y*10,20,19);
    }}
stroke(0);
    
    //cursor elipse
 for(int i=0; i<30; i++){
    fill(271,9,97,100);
    ellipse(mouseX,mouseY,i*1,i*1);
  }
  
  if(mouseX>width/2){
for(int i=3; i<67; i++){
  fill(279,34,73,17);
    triangle(i*12,i*9,pmouseX,pmouseY,i*12,i*582);
}
  }
      
 if(mouseX<width/2){
  for(int i=3; i<67; i++){
  fill(198,25,74,29);
    triangle(mouseX,i*46,i*17,mouseY,i*98,i*570);   
}
  
 }

 if(mouseY<442){
  for(int i=3; i<67; i++){
  fill(260,37,59,16);
    triangle(pmouseX,i*46,i*3,pmouseY,i*98,i*570);   
}
  
 }
 displayOn=true;

 if(mouseX>131&&mouseX;<181&&mouseY;>220&&mouseY;<270){
    fill(271,26,73,76);{
       if(mousePressed){
         if(displayOn){
        fill(279,40,89,27);
        rect(400,X++,250,X);
       } }
    }
 }
 
 if(mouseX>131&&mouseX;<181&&mouseY;>411&&mouseY;<461){
    fill(271,26,73,76);{
       if(mousePressed){
         if(displayOn){
           displayOn=false;
        fill(255,61,71,40);
        rect(X++,X++,X++,X);
       } }
    }
 }
 
  if(mouseX>450&&mouseX;<500&&mouseY;>411&&mouseY;<561){
    fill(271,26,73,76);{
       if(mousePressed){
         if(displayOn){
           displayOn=false;
        fill(255,28,99,27);
       triangle(width/2+X+9,height/2+X,264+X++,357+X++,X+4,X+9);
       } }
    }
 }

 if(mouseX>450&&mouseX;<500&&mouseY;>220&&mouseY;<270){
    fill(192,20,64,76);{
       if(mousePressed){
         if(displayOn){
           displayOn=false;
           fill(192,63,99,27);
           ellipse(width/2,height/2,X++,X+10);
           

       } }
    }
 }

 
 fill(236,44,71,76);
 rect(131,220,50,50);
 rect(131,411,50,50);
 rect(450,411,50,50);
 rect(450,220,50,50);
 
 }
