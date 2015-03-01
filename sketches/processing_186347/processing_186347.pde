
void setup(){
size (500, 500);
colorMode (HSB);
}
void draw(){
fill(250,0,0);
for (int i= 300; i>10; i=i-10) {
 
  rect(0, 0, i, i);
  stroke((1/2)+(mouseX/3),250,100);
  rect(-0, 250, i, i);
  stroke((1/2)+(mouseY/5),0,300);
 
 rect(250,250, i, i);
 
  
 


}
}

 

