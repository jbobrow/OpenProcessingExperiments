
float n = 0.2;
float x = 0;
float z = 0;
float w = 0;
float colred;
float colblue=130;
float mod=0;
void setup() {
   
  size(500,500);
  background(20);
  smooth();
  noStroke();
}
 
 
void draw() {
  mod++;
  if(mod>5){
    mod=0;
  }
  
  translate(250,250);
   
  rotate(n);
 fill(colred+40,0,0);
 ellipse(10+x,10+x,5+z,5+z);
  
  
   
  colred++;
 z = z+0.1;
 x=x+1;
 n=n + 0.1;
   
rotate(w);
 fill(255);
 ellipse(10+x,10+x,5+z,5+z);
  
 w=w+0.5;
  
 rotate(w);
 fill(0,0,colblue);

 if(mod==4){
   colblue=255;
 }
 else if(mod==0){
   colblue=130;
 }
 ellipse(10+x,10+x,5+z,5+z);
  
 w=w+0.7;
}


