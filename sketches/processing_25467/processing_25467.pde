
int tailMove;

void setup() {
       size(800, 500);
       stroke(255);
       background(0);
     }
    
    void draw() {
  background(0);
  fill(255);
  smooth();
  
  int x=mouseX-30;
  int y=mouseY;

stroke(255);
//head and body
ellipse (x, y, 50, 70);
triangle (x-20,y+10, x-75,y+10, x-75, y-35);
triangle (x-75,y+10, x-130,y+10, x-130, y-35);

//legs
fill(75,125,255);
stroke(75,125,255);
rect(x-36, y+11, 10, 35);
rect(x-62, y+11, 10, 35);
rect(x-95, y+11, 10, 35);
rect(x-120, y+11, 10, 35);
fill(0);

//tail
if(mousePressed == true){
  tailMove=10;
}
  else
  {
    tailMove=0;
  }
fill(75,125,255);
ellipse (x-139, y-10-tailMove, 20,20);
ellipse (x-157, y-10-(tailMove*2), 20,20);
ellipse (x-175, y-10-(tailMove*3), 20,20);

/*fill(75,125,255);
ellipse (x-139, y-10, 20,20);
ellipse (x-157, y, 20,20);
ellipse (x-175, y+10, 20,20);
*/
//face
fill(0);
ellipse(x-10, y-5, 10,10);
ellipse(x+10, y-5, 10,10);
stroke(0);
rect(x-11, y+9, 5,15);
if(mousePressed){
  ellipse(x+2,y+15, 20,15);
}
else{
rect(x-11, y+13, 20,5);
}
rect(x+9, y+9, 5,15);
}

