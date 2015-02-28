
/*I was struggling at first but a few things are making
 better sense. I changed all of the parts into functions
 so I didnt have to repeat line after line of circles. 
 */
//this is my global character. Name based on the Cheshire Cat but I used chesher
PShape chesher;

void setup() {
  size(450,450);
  noStroke();
  smooth();
  loop();
  background(100);
  //learned how to load shape from Illustrator.
  chesher = loadShape("chesher.svg"); 
}
/*
int EyeBallX = 1;
 int EyeBallY = 100;
 int RightOneX = 400;
 int RightOneY = 420;
 I was trying to get the eyes to move with the mouse
 float d = dist(mouseX, mouseY, EyeBallX, EyeBallY);
 float rd = dist(mouseX, mouseY, RightOneX, RightOneY); 
 */

void draw () {
  /*these are the items I will need to have for the draw.
   these are the back circles so I called them backO for backbackground circles.
   The first 2 parameters are placement on grid. The third is for size. 
   The fourth is for number of circles. 
   */
  backO(25, 250, 300, 2);
  backO(300, 16, 200, 5);
  backO(100, 144, 250, 2);
  backO(400, 400, 500, 5);
  shape(chesher, 0, 40);
  eyeBall(200,200);
  //I scaled the other eye down by reusing a function.
  //I noticed when the object is scaled the coordinate system also scales?? 
  scale(.4);
  eyeBall(830,440);

  /*  
   This code was part of my eyeball moving experiment.
   ellipse (EyeBallX, EyeBallY, 150,150);
   d = constrain (d,0,30);
   float a = atan2(mouseY-RightOneY, mouseX-RightOneX);
   float x = EyeBallX + cos(a)*d;
   float y = EyeBallY + sin(a)*d;
   ellipse(x,y, 90, 90);
   */
}

/*
the x and y value gives position, the other parameters give it size.
 This saved me a typing a lot of lines.
 It also really help me grasp some syntax.
 */
void eyeBall(int x, int y) {
  fill(0); 
  ellipse(x, y,120,120);
  fill(255);
  ellipse(x-25,y-25, 35,35);
  fill(255);
  ellipse(x-10, y+1, 15,15);
  ellipse(x-40, y-3, 7, 7);
}

void backO(int xloc, int yloc, int size, int num) 
{

  /*
Part of the experiment.
   float b = dist(mouseX, mouseY, pmouseX, pmouseY);
   float c= constrain(b,  0, 25);
   */


  /* I tried to do a few things with the mouse and I was having issues.
   I also wanted to use a for loop it doesnt do much but again it helps my understanding.
   */
  if (mousePressed) { 
    float grayvalues = 255/num;
    float steps = size/num;
    for(int i=0; i<num; i++) {
      fill(1*grayvalues);
      ellipse(xloc, yloc, size-i*steps, size-i*steps); 
    }
  }
}

//how to print
void keyPressed() {
  if(key == 'c' || key == 'C') {
    save("jdhawkins.animation");
  }
}











