
/* ---------------------------------------------
 Name: Firadaus Khazis
 
 The Idea was to adjust the grid order, however I couldnt make it work.
 instead I just tried some basic configuration.
 I replaced the shape with 3D object, which is Cube.
 The Value for cubes are then define by the location of the mouse
 and also increase and decrease value learnt in futher tutorial on Genware.org.
 
 
 --------------------------------------------- */

int colorRed =100;
int colorRedSwitch =0;
int cubeScale = 10;
int cubeSwitch = 0;
//int gridXScale = 5;
//int gridXSwitch = 0 ;
int rotateDegree = 0 ;
float cubeWidth = 0;
float cubeHeight = 0;
float maxDistance = 150;
String note = "hold mouse left button to view the wireframe";

void setup() {
  size (1000, 700, P3D);
}

void draw () {
  background(255);

  // resize the cube overtime
  /* the cubeSwitch will add another condition which allow the colour value to increase 
   and decrease over time.
   when the value reaches 20, it will trigger the cubeSwitch to be 1,
   when the condition of cubeScale > 5 && cubeSwitch ==1 is fullfilled,
   cubeScale reduce its value, and trigger the cubeSwitch to be 0 again once it reaches 5
   */
  if (cubeScale < 20 && cubeSwitch== 0) {
    cubeScale ++;
    rotateDegree = 0;
  }
  else if (cubeScale >=20 && cubeSwitch ==0 ) {
    cubeScale --;
    cubeSwitch = 1;
    rotateDegree = 45;
  }
  else if (cubeScale > 5 && cubeSwitch ==1 ) {
    cubeScale -- ;
    rotateDegree = 90;
  }
  else if (cubeScale == 5 && cubeSwitch ==1 ) {
    cubeScale ++ ;
    cubeSwitch = 0 ;
  }

  // adding step of 25 to create grid in X direction
  for (float gridX= 0 ; gridX<1000  ; gridX = gridX + 25  ) {

    // adding step of 25 to create grid in Y direction
    for (int gridY=0; gridY<700 ; gridY = gridY + 25 ) {
      // each individual object's diameter respond to the distance of the mouse
      float shapeDiameter;
      float colorSwap;
      /* mouse position in  X and Y direction are assigned to respond to the diameter of 
       each individiual object relatives to their position on grid */
      PVector mousePos = new PVector( mouseX, mouseY, 0);
      PVector shapePos = new PVector( gridX, gridY, 0);
      shapeDiameter = PVector.dist (shapePos, mousePos) / maxDistance *40;

      // changing cube red value over time
      if (colorRed < 100 && colorRedSwitch== 0 ) {
        colorRed ++;
      }
      else if (colorRed >=100 && colorRedSwitch ==0 ) {
        colorRed --;
        colorRedSwitch = 1;
      }
      else if (colorRed > 100 && colorRedSwitch ==1 ) {
        colorRed -- ;
      }
      else if (colorRed == 100 && colorRedSwitch ==1 ) {
        colorRed ++ ;
        colorRedSwitch = 0 ;
      }

      /* Resize the grid size overtime
       Note: My intention is to have the grid resize over the time. However,  the default 
       position of 0,0 at the screen instead of centre. So the grid will expand retract toward
       0,0 position. I managed to shift the 0,0 position of the object to centre, however
       it turns 3/4 of the screen empty. I tried sin() value to get 1 --> -1 value to be
       multiplied with the grid value, but couldn't make it work/
       
       if (gridXScale < 10 && gridXSwitch== 0) {
       gridXScale ++;
       }
       else if (gridXScale >=10 && gridXSwitch ==0 ) {
       gridXScale --;
       gridXSwitch = 1;
       }
       else if (gridXScale > 0 && gridXSwitch ==1 ) {
       gridXScale -- ;
       }
       else if (gridXScale == 0 && gridXSwitch ==1 ) {
       gridXScale ++ ;
       gridXSwitch = 0 ;
       }
       
       */

      // the cube scale times by shapeDiameter in order to get the x and y value
      // of the cube influenced by the location of the mouse
      cubeWidth = cubeScale*shapeDiameter / 10 ;
      cubeHeight = cubeScale*shapeDiameter / 10 ;

      //add stroke whenever the mouse is pressed
      if (mousePressed == false) {
        noStroke();
      } 
      else 
      {
        stroke(1);
      }   

      //pushMatrix is definition for 3D workspace
      pushMatrix ();
      //define the grid in X, Y and Z value through translate
      translate (gridX, gridY, random(shapeDiameter*3));
      rotate(rotateDegree);
      //color taken from value set earlier while opacity respond to the mouse location
      fill(colorRed, 0, 0, shapeDiameter/2);
      box(cubeWidth, cubeHeight, shapeDiameter);
      popMatrix();
    }

    // adding notes on sketch
    fill(255);
    textMode(SCREEN);
    textAlign(LEFT, TOP);
    textSize(15);
    text(note, 20, 20, -30);
  }
}


