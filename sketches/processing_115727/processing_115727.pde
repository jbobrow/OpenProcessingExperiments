
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

if (mousePressed==true) {        
    rotate(radians(y));
   y=y+3;  }                          
  else {                  
    y=0; }
  
if (mousePressed==true) {                   //if mouse is pressed, it starts drawing lines      
   stroke(random(255),random(50),random(0));   //gives random colors (random (x) = numbers from 0 to x)
 line(0,0,x,0); 
  stroke(random(50),random(255),random(0));
  line(0,10,x,10); 
  stroke(random(0),random(50),random(255));
  line(0,20,x,20); 
  x=x+1;  }                                // each line is 3 bigger than the previous one
  else {                    //if mouse butto in not pressed, x=0
    x=0; }


  
popMatrix();
}
