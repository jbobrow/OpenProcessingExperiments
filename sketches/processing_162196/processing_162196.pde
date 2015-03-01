
float r;
float g;
float b;
float backgroundMousea;
float backgroundMouseb;
float backgroundMousec=67;
float locX;
float locY;
 
void setup(){
size(500,500);
background(255);
}
 
void draw(){
r=random(255);
g=random(255);
b=random(255);
background(r,g,b);


//make background white if mouse is pressed
if (mousePressed){
  background(255);
  rect(200,200,100,100);
  fill(175);
  stroke(0);
  

}
}



