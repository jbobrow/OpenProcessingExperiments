
/*Here we put a grid of objects across the render window, which is set 
 to the image size.  Then we read the color of the pixel at the (x,y) position
 of the object -- using the .get(x, y) function -- and set the object to that
 color.  By changing the offset we can get differing effects.  
 
 Utilizing a switch statement we can select through some variations.
 
 Press # 1 - 7 to get some differing options*/

PImage theImage; //Make a place for the image to be stored

int theOffset = 10; //This is the spacing between the x,y values in our for loops

char theKey = '1'; //we use keyPressed() to read the char variable theKey, we set its initial value to 1

char[] array = { //Here's a little array we can pull random characters from
  '&', '*', '^', '$', '@'
};

boolean backSwitch = true; //we have a variable here to determine if we redraw the background or not

void setup() {
  size(640, 427); //set the size to that of the image
  theImage = loadImage("lotus.jpg"); //load the image
}

void draw() {

  //This little if collection determines whether we draw the background or not, set by the variable backSwitch
  if (backSwitch == true) {
    background(0);
  }
  if (backSwitch == false) {
    //do nothing, background(0) won't run
  }

  for (int x = 0; x < width; x = x + theOffset) { //count through the x axis
    for (int y = 0; y < height; y = y + theOffset) { //count through the y axis
      noStroke(); //or leave the stroke in . . .  
      color theColor = theImage.get(x, y); //get the color at x, y

        switch(theKey) { //switch statment chooses what to do on the basis of globla variable 'theKey'
      case '1':
        backSwitch = true;
        fill(theColor); //set the following shape to that color
        rect(x, y, theOffset, theOffset); //draw your shape with size of the offset
        break;
      case '2':
        backSwitch = true;
        fill(theColor); //set the following shape to that color
        ellipse(x, y, 5, 5); // Try an ellipse
        break;
      case '3':
        backSwitch = true;
        fill(theColor); //set the following shape to that color
        ellipse(x, y, 34, 57); // or try irregular shapes
        break;
      case '4':
        backSwitch = true;
        strokeWeight(3);
        stroke(theColor);
        line(x, y, x + 2, y + 2);
        break;
      case '5':
        backSwitch = false;
        pushMatrix(); //remember rotate, translate, and push/popMatrix()?
        stroke(theColor);
        translate(x, y);
        rotate(radians(random(360)));
        line(0, 0, -10, 10);
        popMatrix();
        break;
      case '6':
        backSwitch = true;
        fill(theColor);
        text(array[(int)random(array.length)], x, y); //randomly choose an array member 
        break;
      case '7':
        backSwitch = false;
        pushMatrix(); //rotate some triangles . . .
        stroke(theColor, 150);
        translate(x, y);
        rotate(radians(random(360)));
        triangle(0, -theOffset/2, theOffset/2, theOffset/2, -theOffset/2, theOffset/2);
        popMatrix();
        break;
      default:
        backSwitch = true;
        fill(theColor); //set the following shape to that color
        rect(x, y, theOffset, theOffset); //draw your shape with size of the offset
        break;
      }
    }
  }
}

void keyPressed() { //listens in the background for key presses and rewrites the global variable theKey
  theKey = key;
}



