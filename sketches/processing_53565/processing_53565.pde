
//KESHIA.KINGSLEY_QUESTION 1.PS2
//--------------------------------------------------------
//The basic setup for the program
void setup() {
  size(300, 300);
  background(255);
}
//-------------------------------------------------------
//the lerp color function is used here, 
//the colours fade from the function (from) to the function (to)
color from= color (200, 45, 22);
color to = color (255);
//----------------------------------------------------------
//the loop is used here to assemble the gradient
void draw() {
  for (int y= 0; y< width; y++){
  float atm = norm(y,0,width);
  stroke(lerpColor(from,to,atm));
  rect(y, 0, y, height);

}
 }

