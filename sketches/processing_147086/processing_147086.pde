
void setup(){
  size(500,500);
     noStroke();
}

void draw(){
 
 for(float i=1;i<width;i=i*1.1){
   for(float j=1;j<height;j=j*1.1){
  
 
fill(255,255,255,10);
ellipse(i*1.5,j*1.5,10,10);




fill(0,90,90,4);
ellipse(j*1.5,i*1.5,25,25);


fill(80,20,90,5);
ellipse(i*5,j*5,5,5);


fill(80,0,40,5);
ellipse(j*5,i*5,25,25);
   }
 }
  
}


