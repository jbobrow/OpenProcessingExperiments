
void setup(){
size(500,500);
background(255);

noStroke();
fill(232,28,66);
rect(70,100,240,240);//red rectangle

noStroke();
fill(248,255,49);
rect(310,0,150,200);//yellow rectangle

noStroke();
fill(203,203,203);
rect(0,0,150,100);//gray rectangle

noStroke();
fill(203,203,203);
rect(0,200,70,200);//gray rectangle2

noStroke();
fill(248,255,49);
rect(0,400,70,120);//yellow rectangle2

noStroke();
fill(0,0,0);
rect(70,340,120,120);//black rectangle

noStroke();
fill(203,203,203);
rect(190,340,120,120);//gray rectangle3

noStroke();
fill(0,0,0);
rect(190,460,120,30);//black rectangle2

strokeWeight(8);
fill(57,60,216);
rect(310,400,150,190);//blue rectangle

fill(232,28,66);
rect(460,400,100,120);//red rectangle2

fill(203,203,203);
rect(460,0,70,400);//gray rectangle4


stroke(0);
strokeWeight(8);
line(10,100,460,100);
line(460,10,460,490);
line(10,200,70,200);
line(310,200,460,200);
line(150,10,150,100);
line(70,340,460,340);
line(70,100,70,490);
line(10,400,500,400);
line(310,10,310,490);
line(70,460,310,460);
line(190,340,190,490);
line(385,200,385,340);

}
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void draw() {
  
  noStroke();
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  }
}

