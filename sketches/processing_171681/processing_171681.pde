
void setup(){
  size(200,200);
background(225);
}
//sets shape to value of 0
int shape= 0;

//Draws rectangles, ellipses and triangles as int shape increases. If shape equals one it draws ellipses, shape equals two it draws triangles.
void draw(){
 if(shape==0){
rectMode(CENTER);
rect(mouseX,mouseY,50,50);}
else if(shape==1){
ellipse(mouseX,mouseY,50,50);}
else if(shape==2){
triangle(mouseX, mouseY-30, mouseX+30, mouseY+30, mouseX-30, mouseY+30);}
println(shape);
   }

//increases shape by one. If shape equals three  it resets shape back to 0.
void mousePressed(){
  shape++;
  if(shape==3)
  shape=0;
}

//when ANY key is pressed color of shape changes
void keyPressed(){
  fill(random(0,255), random(0,255),random(0,255));

}
