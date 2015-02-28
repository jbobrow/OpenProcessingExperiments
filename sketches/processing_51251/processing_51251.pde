
//In-Class Work 2/3/12
//Tracy Carlin
//For CCTP Computational Expression

//place your global integers at the very beginning of the program

void setup() {
  size(500, 500);
  smooth();
}
//create a 25 x 25 wall o' eyeballs
//625 eyeballs in total
void draw(){
  background(255);
  
  //eyeballs = for 25 eyeballs they have a radius of 20; 
  //start at 10 to make sure no eyeball goes halfway through the window)
for (int x=10; x<500; x=x+20) {
  for (int y=10; y<500;y=y+20) {
    ellipse(x,y,20,20);//eyeballs
    if (mouseX>=width/2) { //if the mouse is on the right side of the screen
    fill(255,0,0);//red
    ellipse(x,y,10,10);//iris
    fill(0);//black
    ellipse(x,y,3,3);//pupil
    fill(255);//white (for when the oop repeats)
    } 
    else {
      fill(0,0,255);//blue
      ellipse(x,y,10,10);//iris
      fill(0);//black
    ellipse(x,y,3,3);//pupil
    fill(255);//white (if for when the loop repeats)
    }
  }
}
}

