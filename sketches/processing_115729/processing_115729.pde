
int x=0;
int y=0;
void setup(){
size(800,800);
smooth();
background(0);
}

void draw () {
  
  pushMatrix();               //push matrix may not be necessary in this code, however, i will improve it and add more shapes
  translate(mouseX,mouseY);    //start point is the pointer
  strokeWeight(2);            //lineweight
  
if (mousePressed==true) {                   //if mouse is pressed, it starts drawing lines      
   stroke(random(255),random(50),random(0));   //gives random colors (random (x) = numbers from 0 to x)
   fill(random(0),random(255),random(255),50);
 rect(random(50),random(50),random(150),random(150));   //gives random size and place (random (x) = numbers from 0 to x)
  ellipse(random(30),random(40),random(150),random(150));
  triangle(0,random(30),50,random(100),random(100),50);
  x=x+1;  }                                // each line is 3 bigger than the previous one
  else {                    //if mouse butto in not pressed, x=0
    x=0; }


  
popMatrix();
}
