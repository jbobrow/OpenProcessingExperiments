
int value = 255; //set value variable to integer and set to 255 (white)

void setup (){
  frameRate (3); //changes the framrate per sec to 5
  size (400, 400);
  background (0);
  noStroke (); //sets no outlining on shapes
  
  fill (0);
  ellipse (200, 93, 50, 40); // circle below the leaf
  
  //body of the apple (two ovals)
  fill (255); // white
  ellipse (220, 200, 150, 180);
  ellipse (180, 200, 150, 180);
  
  //the leaf
  ellipse (200, 85, 20, 40);
 // sets col to 250
}

//bites
void draw (){
  bites(); //creates a function
 
  fill (value);// allows to make value the fill
  
  //four small circles the make the bitemarks
  ellipse (261, 200, 35, 35);
  ellipse (259, 180, 35, 35);
  ellipse (270, 160, 35, 35);
  ellipse (274, 215, 35, 35);
}

//the set of codes below allows the four ellipses to be dupclicated
//within the random given points
void bites(){
  fill(0);
  float x = random(100, 300); //sets the the random points within the X axis
  float y = random(210,300); //sets the the random points within the Y axis
  ellipse (x, y, 35, 35); // four ellipses which represents the bites 
  ellipse (x-2, y-20, 35, 35);
  ellipse (x+9, y-40, 35, 35);
  ellipse (x+13, y+15, 35, 35);
}

void mouseClicked() {//mouse click function
  if (value == 255) { //if value is 255 (colour is white)
   value = 0; //value becomes 0 (turns black)
  } else {
    value = 255; //else value is 255 (stays white)
  }
}


