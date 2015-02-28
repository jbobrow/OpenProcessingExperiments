
boolean button = false; // declaring and setting the button to false
boolean explosion=false; // declaring and setting the explosive phase to false

// declaring the values for x & y co-ordinates and also the height and width
int x=150;
int y=430;
int w=200;
int h=50;

// declaring the size of the small blocks which will appear after explosion
int blockspawnx1 = 200;
int blockspawny1 = 200;
int blockspawnx2 = 200;
int blockspawny2 = 200;
int blockspawnx3 = 200;
int blockspawny3 = 200;
int blockspawnx4 = 200;
int blockspawny4 = 200;
int blockspawnx5 = 200;
int blockspawny5 = 200;
int blockspawnx6 = 200;
int blockspawny6 = 200;
int blockspawnx7 = 200;
int blockspawny7 = 200;
int blockspawnx8 = 200;
int blockspawny8 = 200;
int blockspawnx9 = 200;
int blockspawny9 = 200;



void setup()
{
  size(500, 500); // size of sketch window
  background(0); // background colour set to black
}


void draw()


{
  background(255); // background set to white
  fill(175); // fill set to a shade of grey
  rect(x, y, w, h); // using the int's as declared above
  noStroke(); // no stroke is being used
  fill(150); // the fill beig set to a slightly darker shade than above
  rect(100, 100, 300, 300); // rectangle being set just under the bigger one

  if (button) {
    background(255);
    fill(175);
    rect(x, y, w, h);
    button = false;
    // if the button is pressed the sequence will trigger 
  } 
  else {
  }
// if else nothing will happen

  if (explosion) {






    background(255); // when the explosion is triggered after button pressed the sketch window backgrund is set to white



    // declaring the positioning the size of the exploding rectangles
    //2nd row
    fill(0);
    rect(blockspawnx1, blockspawny1, 50, 50);

    fill(0);
    rect(blockspawnx2 + 100, blockspawny2, 50, 50);

    fill(0);
    rect(blockspawnx3 - 100, blockspawny3, 50, 50);


    //1st row
    fill(0);
    rect(blockspawnx4, blockspawny4 -100, 50, 50);

    fill(0);
    rect(blockspawnx5 + 100, blockspawny5 -100, 50, 50);

    fill(0);
    rect(blockspawnx6 - 100, blockspawny6  -100, 50, 50);


    //3rd row
    fill(0);
    rect(blockspawnx7, blockspawny7 +100, 50, 50);

    fill(0);
    rect(blockspawnx8 + 100, blockspawny8 +100, 50, 50);

    fill(0);
    rect(blockspawnx9 - 100, blockspawny9  +100, 50, 50);

    // declaring the speed at which the blocks will travel after exploding
    float speedValueX1 = random(5, 8);
    float speedValueY1 = random(-10, -5);

    // declaring which block will travel at what speed
    blockspawnx1 = blockspawnx1 - (int)speedValueX1;
    blockspawny1 = blockspawny1 - (int)speedValueY1;

    speedValueX1 = random(15, 20);
    speedValueY1 = random(10, 15);

    blockspawnx2 = blockspawnx2 - (int)speedValueX1;
    blockspawny2 = blockspawny2 + (int)speedValueY1;

    speedValueX1 = random(10, 15);
    speedValueY1 = random(-10, -5);

    blockspawnx3 = blockspawnx3 - (int)speedValueX1;
    blockspawny3 = blockspawny3 - (int)speedValueY1;

    speedValueX1 = random(7, 10);
    speedValueY1 = random(5, 10);

    blockspawnx4 = blockspawnx4 - (int)speedValueX1;
    blockspawny4 = blockspawny4 - (int)speedValueY1;

    speedValueX1 = random(10, 20);
    speedValueY1 = random(-10, -5);

    blockspawnx5 = blockspawnx5 + (int)speedValueX1;
    blockspawny5 = blockspawny5 - (int)speedValueY1;

    speedValueX1 = random(20, 10);
    speedValueY1 = random(-1, 8);

    blockspawnx6 = blockspawnx6 + (int)speedValueX1;
    blockspawny6 = blockspawny6 - (int)speedValueY1;

    speedValueX1 = random(-10, -1);
    speedValueY1 = random(-10, -5);

    blockspawnx7 = blockspawnx7 - (int)speedValueX1;
    blockspawny7 = blockspawny7 - (int)speedValueY1;

    speedValueX1 = random(5, 8);
    speedValueY1 = random(6, 8);

    blockspawnx8 = blockspawnx8 - (int)speedValueX1;
    blockspawny8 = blockspawny8 - (int)speedValueY1;

    speedValueX1 = random(6, 8);
    speedValueY1 = random(-10, -5);

    blockspawnx9 = blockspawnx9 - (int)speedValueX1;
    blockspawny9 = blockspawny9 - (int)speedValueY1;

    
  }
  // if the code is successfull this print will trigger and the sketch window will reset once the last block as left the sketch window
  if (blockspawnx1 <-100) {
      println("IT WORKED");
      explosion = false; 
      background(255);

            fill(150);
      rect(100, 100, 300, 300);
      
      blockspawnx1 = 200;
      blockspawny1 = 200;
      blockspawnx2 = 200;
      blockspawny2 = 200;
      blockspawnx3 = 200;
      blockspawny3 = 200;
      blockspawnx4 = 200;
      blockspawny4 = 200;
      blockspawnx5 = 200;
      blockspawny5 = 200;
      blockspawnx6 = 200;
      blockspawny6 = 200;
      blockspawnx7 = 200;
      blockspawny7 = 200;
      blockspawnx8 = 200;
      blockspawny8 = 200;
      blockspawnx9 = 200;
      blockspawny9 = 200;


    }
}


void mousePressed() {

  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = true;
    explosion = true;
    // triggering the mouse to start the process once the button is pressed, button and explosion will trigger
  }
}
