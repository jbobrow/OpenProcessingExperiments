
//I am making sense of progress by visualizing the concepts that I associate with Approaching Development.
//This program lets you capture the concepts that you can take away from the development area. 
//External file "postit.jpg" https://dl.dropboxusercontent.com/u/153390374/postit.jpg

//Declare the global variables
PImage post;
//Declare the integers and their values
int x = 0;
int y = 0;
//Two color palettes for two packs of sticky notes
color[] palette1 = {#F29BCB, #60ADBF, #63BF84, #A171AB, #F2785C};
color[] palette2 = {#123761, #5F9439, #C4BF3B, #BF595F, #82181B};


//Setup the display
void setup() {
  //Decide on the size of the canvas
  size(1024, 575);
  //Setup the filename of the external visual to be used
  post = loadImage("postit.jpg");
  //Set the background to generate randomly a color from palette
  background(palette1[int(random(0,4))]);
}

//Setup draw functions
void draw() {
 //Declare the local variable that will be handy  
 float r = random(0,5);
 //Decide on the stroke weight and color
 strokeWeight(random(4));
 stroke(palette1[int(random(r))]);
 //Set the fill option to generate random color
 fill(palette1[int(random(r))]);
 //Show progress on the board using our function and conditional
 rect(x, y, 50, 50);
 if (x < width) {
   x+=50;
     if (x > width) {
       y+=50;
       x = 0;
     }
   }
 //Declare local variable that will be handy
 float s = random(0, 4);
 //Set the weight and color of the stroke;
 strokeWeight(random(s));
 stroke(palette2[int(random(s))]);
 //Show progress using rectangles 
 rect(x, y, 50, 50);
 if (x < width) {
   x+=50;
   fill(palette1[int(random(s))]);
     if (x > width) {
       y+=50;
       x = 0;
       fill(palette2[int(random(s))]);
     }
   } 
}  

//Prepare the mouse inputs
void mouseMoved() {
 x = mouseX + 5;
 y = mouseY + 5;
 if (x > width) {
   x = 0;
   y = 0;
 }
}

void mouseDragged() {
  x = mouseX + 5;
  if (x > width) {
    x = 0;
  }
}

void mouseReleased() {
  if (x == 0) {
    x = width;
  } else {
    x = 10; 
  }
}

//Keyboard inputs
void keyReleased() {
  //Use the function to change background colors
  if (key == 'b' || key == 'B') background(palette1[int(random(0, 4))]); 
  //Use the function to save images into a folder
  if (key == 's' || key == 'S') saveFrame("images/picture-###.png");

  switch(key) {
    case '1': 
      imageMode(CORNERS);
      tint(255, 200);
      image(post, 0, 0);
      break;
    case '2':
      imageMode(CORNERS);
      tint(0, 152, 204, 126);
      image(post, 0, 0);
      break;
    case '3':
      imageMode(CORNERS);
      tint(0, 153, 204);
      image(post, 0, 0);
      break; 
  }
}




