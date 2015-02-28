
//--------------------------------------------------GLOBAL VARIABLES
//integer value for color transparency
int transparency =200;

// integer value for distance multiplier
int maxDistance = 150;

//integer value for number of bubble burst
int myHit = 0;

//String object
String note1 = "hello world";
String note2 = "getting there";
String note3 = "you're good";
String note4 = "gosh";
String note5 = "OMG";
String note6 = "get a life";
String note7 = "thank you";

//--------------------------------------------------SETUP
//INITIALIZATION
//screen size of 600 by 600 pixels and graphic output using processing 3D
void setup() {
  size(600, 600, P3D);
}

//--------------------------------------------------DRAW LOOP
void draw() {
  background(0);     //black color background
  stroke(255);       //white color stroke
  strokeWeight(1);   //stroke weight of 1

  //use a nested loop to create a grid of shapes 
  //the first loop creates the column from 0 to screen width with interval of 25
  for (int gridY=0; gridY<width; gridY+= 25) {
    
    //the second loop creates the row from 0 to screen height with interval of 25
    for (int gridX=0; gridX<height; gridX+= 25) {
      
      //a PVector object which refers to the position of the mouse in x and y direction
      PVector mousePos = new PVector(mouseX, mouseY);
      
      //a PVector object which refers to the position of shape at gridX and gridY location
      PVector shapePos = new PVector(gridX, gridY);
      
      //float integer for variables "diameter" d
      //the equations calculate the distance between the mouse point and shape position
      float d = shapePos.dist(mousePos);

      //controlling the value of the diameter to create a falloff effect
      d= 10/d*maxDistance;

      /*specify the behaviour of the circles in relation to its diameter
      As the circles become bigger, it is filled with different colors
      order = no color, green, yellow, red*/
      if (d>=1 && d<=15) {
        noFill();
        stroke(125);
      }
      else if (d>=20 && d<=29) {
        stroke(200, 255, 150);
        fill(200, 255, 150, transparency);
      }
      else if (d>=30 && d<=39) {
        stroke(255, 255, 0);
        fill(255, 255, 0, transparency);
      }
      else if (d>=40 && d<=49) {
        stroke(255, 0, 0);
        fill(255, 0, 0);
      }
      
      //when the diameter is equal or larger than 50, it bursts and diameter = 0 
      if (d>=50) {
        d=0;
        stroke(255);
      }
      
      //when the left button of the mouse is pressed, all the ellipse diameter turn 50
      if (mousePressed && (mouseButton == LEFT)) {
        d=50;
      }
      
      //Once the diameter reach a critical point between 49 and 50, number of hit + 1
      if (d>=49 && d<=50) {
        myHit+=1;
      }
      
      //shifting the matrix to z coordinates
      pushMatrix();
      
      //translate the matrix at a falloff value of d*3)
      translate(gridX, gridY, d*3);
      
      //draw ellipse at 0,0 with a width and height of value d
      ellipse(0, 0, d, d);
      
      //return the sketch coordinate to normal
      popMatrix();
    }
  }

  //setting the constrain on the number of hits possible
  myHit = constrain(myHit, 0, 999999);
  
  //number of hit count
  fill(255);                          //white color
  textMode(SCREEN);                   //drawn directly on SCREEN
  textAlign(RIGHT, BOTTOM);           //located at right bottom
  textSize(100);                      //text size of 100
  text(myHit, width-10, height-10);   //text return variables; located at 590,590

  //setting the String notes that appeared at different hit count
  //text drawn to Model size so that it is scalable
  //increase String size as the number of hit count increase
  
  if (myHit>=1 && myHit<=5000) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(30);
    text(note1, 20, 20);
  } 
  else if (myHit>=1 && myHit<=50000) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(35);
    text(note2, 20, 20);
  }
  else if (myHit>=50001 && myHit<=100000) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(40);
    text(note3, 20, 20);
  }
  else if (myHit>=100001 && myHit<=200000) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(45);
    text(note4, 20, 20);
  }
  else if (myHit>=200001 && myHit<=500000) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(50);
    text(note5, 20, 20);
  }
  else if (myHit>=500001 && myHit<=999998) {
    textMode(MODEL);
    textAlign(LEFT, TOP);
    textSize(55);
    text(note6, 20, 20);
  }
  else if (myHit==999999) {
    textMode(MODEL);
    textAlign(CENTER, CENTER);
    textSize(120);
    text(note7, 300, 300);
  }
  
  //reset the hit count to 0 if the right mouse button is pressed
  if (mousePressed && (mouseButton == RIGHT)) {
    myHit=0;
  }
}


