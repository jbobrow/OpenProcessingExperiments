



 int a;
 int b;
 float c;
 float q= 0;
 float r;
 float d;
 float g;


 
 void setup ()
 {
  
   
   
 background(0);
 size (400,400);
 smooth();
 frameRate(24);
 }
 
 void draw() {
 

  if (mousePressed == true) {
    fill(r,g,d);
  } else {
    fill(255);

  
   
r= random(255);
g= random(255);
d= random(255);
  for ( a=20; a<width; a=a+20){
  for ( b= 20; b<height; b=b+20){
    ellipse (a, b, c, c);
    if(q%2==0){
    fill(r,g,d);
                    }
   else{
    fill(0);
     }
   ellipse(a,b,c,c);

   r++ ;
 c = (28 * sin(q));
       q+= 11;
     }
   
  }
}
 }
 


 
void keyPressed(){ 
frameRate(10);
}


