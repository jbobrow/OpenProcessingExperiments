
int m = 200;
int r = 20;
int k = 100;
boolean z = false;
void setup (){
  size (600,600);
  colorMode (HSB);
  background(0);
}

void draw (){
  
  if(z==true){
    background(0);
    z = false;
  }
  
  if (mousePressed==true){
   stroke(k++,255,255);
   fill(k++,255,255);
     rect(mouseX,mouseY,r,r);
  if(k>=140){
    k=100;
  }
 }

if (mousePressed==true){ 
  stroke(m++,255,255);
  fill(m++,255,255);
  ellipse(mouseX,mouseY,r,r);
 if(m>=255){
   m=200;
 }
}
}
void keyPressed() {
  if (key == 'c'){
    z =!z;
}
}
