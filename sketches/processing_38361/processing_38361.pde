
/*The drawing machine takes simple rules and creates a different drawing each time.
 The screen is setup in a 20X20 grid that is then invisible split into 4 vertical columns.
 In each colum a set of triangles will be placed randomly and will be colored according to 
 their colum placement.  The first 1/4 will be red, the second blue, the third pink and the last
 purple*/


void setup() {
  size(500, 500);
  smooth();
  background(255);
}


void draw() {
}

void mousePressed() { //begin the sketch

  background(255);
  for (int x=20; x<=width-20; x+=20) { //sets up the x coordinates
    for (int y=20; y<height-20; y+=20) {  //sets up the y coordniates

      stroke(0, 23);
      strokeWeight(3);
      point(x, y);  //grid

      if (random(100)>80) {  //gives it a 20% chance that there will be a triangle drawn
        if (x <=width/4-20) { //first column_red triangles
          strokeWeight(3);
          stroke(random(200, 255), 20, 40, 50);
          triangle(x, y, x+20, y+20, x+20, y); 
        }
        else { //second column_blue triangles
          if (x<=width/2 && x>=width/4) {            
            strokeWeight(3);
            stroke(20, random(80, 200), 230, 50);
            triangle(x, y, x-20, y, x-20, y+20); 


          }
          if (x>=(width/2)-20 && x<=width*.75-20) {  // third column_pink triangles
            strokeWeight(3);
            stroke(255, 23, random(200, 255), 50);
            triangle(x, y, x+20, y+20, x+20, y); //oriented the same way as the red
          }
          else {  //fourth column
            if (x>=width*.75 && x<=width) { 
              strokeWeight(3);
              stroke(random(80, 150), 23, random(200, 255), 80);
              triangle(x, y, x-20, y, x-20, y+20); //oriented the same way as the blue
            }
          }
        }
      }
    }
  }
}


