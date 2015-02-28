
void setup(){
size(400,400);
background(255);
smooth();
}

void draw(){

  /*
  background(255);
*/

noStroke();
rectMode(CENTER);

for(int i=0; i<=400; i=i+20){
for(int j=0; j<=400; j=j+20){  
  rotate(2);
  fill(0,j,i);
  rect(mouseX,mouseY,7,7);
  line(mouseX,mouseY,2,2);
  ellipse(mouseY,mouseX,3,3);
}
}


}


