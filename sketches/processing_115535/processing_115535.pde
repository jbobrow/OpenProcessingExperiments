
/* @pjs preload="dog.jpg, cat1.jpg, cat2.jpg, cat3.jpg"; 
 */



// an image is loaded with a random tint. 
// press through keys 1, 2 and 3 to load a different image. Each time it is loaded it gets a random tint.
// left click to draw with the mouse. Loading an image resets the drawing.

PImage dog, cat1, cat2, cat3 ;

int[] posX = new int[100];
int[] posY = new int[100];

void setup() {
  
  size(600, 600);
  smooth();
  
dog = loadImage("dog.jpg"); // loads background image
  
tint(random(250), random(250), random(250));  // sets a random tint to the image every time it is loaded
  
  image(dog, 0, 0);
}

void draw() {

  for (int i = 0; i < posX.length-10; i ++ ) {
    posX[i] = posX[i+1];
    posY[i] = posY[i+1];
  }
  posX[posX.length-10] = mouseX;
  posY[posY.length-10] = mouseY;

  for (int i = 0; i < posX.length; i ++ ) {
    if(mousePressed)
    {
    stroke(random(0,50), random(50,150), random(150,250));
    fill(random(0,50), random(50,150), random(150,250));
    triangle(posX[i], posY[i], 300,300, posX[i] + 10, posY[i]);
    stroke(random(0,255), random(0,255), random(0,255));

    fill(random(0,255), random(0,255), random(0,255));
    ellipse(posX[i],posY[i],30, 30);
    }
    else
    {
      fill(13,161,82);
    }
  }
}

void keyPressed() {
if (key == '1') {
      
  cat1 = loadImage("cat1.jpg"); // loads image on keypress of 1
  tint(random(250), random(250), random(250));  // sets a random tint to the image every time it is loaded
  image(cat1, 0, 0);
  }
  
else if (key == '2') {
    
   cat2 = loadImage("cat2.jpg"); // loads background image on keypress of 2
   tint(random(250), random(250), random(250));  // sets a random tint to the image every time it is loaded
   image(cat2, 0, 0);
  }
  
  else if (key == '3') {
    
   cat3 = loadImage("cat3.jpg"); // loads background image on keypress of 3
   tint(random(250), random(250), random(250));  // sets a random tint to the image every time it is loaded
   image(cat3, 0, 0);
    
  }
}



