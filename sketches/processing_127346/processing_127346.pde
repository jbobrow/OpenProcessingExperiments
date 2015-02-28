
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  /*with if, we test if a certain condition is met
  if the condition is true, the following code will run
  if(condition){
    code that should run if condition is true
  }
  usual comparison operators in conditions
  == equal, != not equal, > larger than, < lower than
    */
  if (mouseX!=0) {
    fill(#00FF00, 50);//same as: fill(0,255,0,50)
    ellipse(mouseX, mouseY, 50, 50);
    println(mouseX+","+mouseY);
  }
}



