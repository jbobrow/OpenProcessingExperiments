

float eyeBallX;
float eyeBallY;
float w;

void setup() {
  size(450,450);  
  smooth();
  // added the frame rate so animation could run smoother.
  frameRate(40);
}

void draw() {
  background(180,58,228); 
  //these are my vars
  backO(225, 225,400, 20);
  eyeBall(225,225); 
}
//this is my function 
void eyeBall(int x, int y) {
  //I wanted to add some dangly things to the eyeball and have them interact as well.
  //I used that pmouse parameter that you showed us in class.
  stroke(0);
  strokeWeight(10);
  strokeCap(ROUND);
  line(mouseX-10,mouseY+10,pmouseX-10,pmouseY+100);
  line(mouseX+30,mouseY+10,pmouseX+30,pmouseY+200);
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  line(mouseX-30,mouseY+10,pmouseX-30,pmouseY+50);

  // outer eye
  stroke(0);
  strokeWeight(5);
  fill(mouseX,0,mouseY);
  ellipse(mouseX,mouseY-30,100,100); 

  //inside eye and light reflection circles
  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse((mouseX-5) + eyeBallX,(mouseY-25) + eyeBallY,70,70);
  fill(mouseX,128,mouseY); 
  ellipse(mouseX-9,mouseY-35,35,35); 
  ellipse(mouseX-25,mouseY-15,10,10);
  ellipse(mouseX-1,mouseY-10,15,15);  
}

//this is my function for the backO which is big circle in the background.
void backO(int xloc, int yloc, int size, int num) 
{

  float grayvalues = 1000/num;
  float steps = size/num;
  //my for loop very simple I referenced the book for this one.
  for(int i=0; i<num; i++) {
    fill(i*grayvalues);
    ellipse(xloc, yloc, size-i*steps, size-i*steps);
  }

}
void keyPressed() {
  if(key == 'c' || key == 'C') {
    save("jdhawkins-.png");
  }
}



