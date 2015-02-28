
//Credit for Dulce Andino 
void setup () { 
size(600,500); 
smooth();
background(0); }
 
//define line
void draw (){
float centerA = width/2;
float centerB = height/3;
 
line(mouseX,mouseY,centerA,centerB);
stroke(255);
  
}
//end of Dulce Andino

//Rita's Part
void mouseMoved() {
  ellipse(mouseX, mouseY, 10, 10);
  {
    fill(0);
    stroke(#FF0099);
  }

}
  void mouseClicked() {
    background(0);
  }
 //end of Rita's part   

