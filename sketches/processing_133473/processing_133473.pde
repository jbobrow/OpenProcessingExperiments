
void setup() {
size (600,600);
}

void draw(){
 fill(0, 0, 0, 5);
  rect(-10, -10, 2400, 2400);
// for (init, test, update) {do this}
for (int x = 0; x<width; x=x+5) {
  //line (x,0,x,height);
   
  for (int y = 0; y<height; y=y+5) { 
    noStroke();
    fill(40);
    ellipse(x,y,3,3);
     }
       if (key =='b') {
    fill(#2CE8FF);
  
  }
 
  if (key =='y') {
    fill(#FFFA64);

  }
 
  if (key =='g') {
    fill(#2EFFA6);
   
  }
  
  if (key == 'r') {
    fill(#FF3E61);
  }
  
 ellipse(mouseX,mouseY,3,3);
 
}
fill(0);
rect(0,560,600,600);

  textSize(12);
 

fill(#FF3E61);
rect(260, 577, 20, 5);
text("Press R", 285, 584);

fill(#FFFA64);
rect(345, 577, 20, 5);
text("Press Y", 370, 584);

fill(#2EFFA6);
rect(430, 577, 20, 5);
text("Press G", 455, 584);

fill(#2CE8FF);
rect(515, 577, 20, 5);
text("Press B", 540, 584);
  

}
