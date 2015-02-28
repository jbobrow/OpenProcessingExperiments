
int x=0;

void setup(){
size(800,800);
smooth();
background(0);
}

void draw () {
  
  pushMatrix();               //push matrix may not be necessary in this code, however, i will improve it and add more shapes
  translate(mouseX,mouseY);    //start point is the pointer
  strokeWeight(2);            //lineweight
  stroke(random(200),random(120),random(50));   //gives random colors (random (x) = numbers from 0 to x)
if (mousePressed==true) {                   //if mouse is pressed, it starts drawing lines      
  line(0,0,x,0); 
  x=x+3;  }                                // each line is 3 bigger than the previous one
  else {                    //if mouse butto in not pressed, x=0
    x=0; }

popMatrix();
}
