
float y = 250.0;
float x = 250.0;
//setuping up the document
void setup(){
size(250, 250);
background(#5A010B);
noFill();
stroke(#FFEA00);
}
//motion 
void draw(){
  frameRate(10);
  //line that starts at 250 and line goes -2 everytime
  line(y, x, y, x);
  y -= 2; 
  x -= 2;
  

  rect(0, y, y, y);
  rect(0, x, x, x);

 if(mousePressed){ 
   background(#5A010B);
    x = 250;
    y = 250;
  }
}



