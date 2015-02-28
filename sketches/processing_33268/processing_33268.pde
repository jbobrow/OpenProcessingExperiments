
/* same assignment using loop*/
/* august 08 - catalina cortazar */

boolean isGoingRight = true;
boolean isGoingLeft = true;
float xPos = 0;
float yPos = 0;
float xLPos = 900;
float yLPos = 0;
float xIPos = 0;
float yIPos = 0;
PImage myImage;


void setup() {
  size(900, 600);
  background(0);
  myImage = loadImage("letras.jpg");
}


void draw() {

  background(0);


  if (isGoingRight) {
    xPos+=3;
  }

  else {
    xPos-=3;
  }


  if (isGoingLeft) {
    xLPos-=3;
  }

  else {
    xLPos+=3;
  }


  for (int i = 0; i < 15; i ++) {
    image(myImage, xLPos, yLPos + 45*i);
  }





  if (xLPos  >= width) { 
    isGoingLeft=true;
  }


  if (xLPos <= 0) { 

    isGoingLeft=false;
  }


 for (int i = 0; i < 15; i ++){
 image(myImage, xPos - 900, yPos+22 + 45*i);

  if (xPos  >= width) { 
    isGoingRight=false;
  }


  if (xPos  <= 0) { 

    isGoingRight=true;
  }

 }

}


