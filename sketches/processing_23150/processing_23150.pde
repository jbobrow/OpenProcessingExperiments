
int a=10;
int b=10;

void setup () {
  
  size (800,600);
  background (50,128,50);
    
   
   
}

void draw() { 
  
strokeWeight (random (1,10));
for (int a=10; a<=800;a=a+20){
  fill (random (a,20), random (b,250), random (20,100)); 
for (int b=10; b<=800;b=b+20){
ellipse (a,b,10,10); 
rect (a, b, 30,30);
ellipse (a, b, 30,30);
}

 

 }


}


