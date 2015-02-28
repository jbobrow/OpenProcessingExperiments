
//A2-13: Program your moving elements from A2-08 but use classes to represent the three visual elements.//

/* Made By: Naghmi Shireen
 Dated: 19 oct, 2010*/

//in this asignment i have used three classes to draw pentagon, ellipse and a triangles as three visual elements to make non linear random motion



int points=5; // five points for pentagon
float centerX, centerY; //center point of  rotation and center of pentagon
float radius=45; // this is the radius of Pentagon
int i; //an increment  
  
Pentagon myPentagon; // a variable "myPentagon" of class Pentagon
Circle myCircle;// a variable "myCircle" of class Circle
Triangle myTriangle;// a variable "myTriangle" of class Triangle


void setup() {
  size(400,400);
  background(255);
  frameRate(30);
  centerX=width/2; // i have started moving all elements from the center of the display window
  centerY=height/2; //center of height
  
  myPentagon=new Pentagon();//initializing myPentagon
  myCircle=new Circle();//initializing myCircle
  myTriangle= new Triangle();//initializing myTriangle
}


void draw() {
  background(100);
  strokeWeight(1);
  noStroke();

   fill(220,90,150,100);
  //in pentagons randomness is created by just changing its center point randomly
    myPentagon.drawPentagon(centerX+random(-2,2),centerY+random(-2,2),radius, points); // pentagon call

  fill(120,200,190,80);
  //in circles randomness is created by changing its x and y postions randomly, along a circular path
  myCircle.drawCircle(); //Method call from Circle class 
  
  fill(180,70,240,100);
  //in triangle, randomness is created by changing its one cordinate randomly,the other two cordinates remain same
  myTriangle.drawTriangle(); //triangle called
}





////////////////////////////////////////////////////////////////////////////////////////////

//pentagon class
class Pentagon{
  float cenX;
  float cenY;
  float rad;
  float numNodes;
  float[] xpos=new float[points];  // an array to store x positions of five points of pentagon
  float[] ypos=new float[points]; // an array to store y positions of five points of pentagon
  float rotAngle=-90; // an initial angle for pentagon

 
  Pentagon(){

  }// constructor is empty, as i have no argument
  
void drawPentagon(float cenX, float cenY, float rad,float numNodes) {
  //this loop will mark all the nodes of pentagon and will draw circles on those nodes
  for (int i=0; i<numNodes; i++) {
    xpos[i] = cenX+cos(radians(rotAngle))*rad; // will be storing the x position of all nodes of the pentagon one by one
    ypos[i] = cenY+sin(radians(rotAngle))*rad;// will be storing the y position of all nodes of the pentagon one by one
    ellipse(xpos[i],ypos[i],20,20); //making a circle at every node of pentagon
    rotAngle += 360.0/numNodes; // increasing the angle depending upon the number of nodes of pentagon
  }

  beginShape(); // this function will joins those points in a closed loop
  for (int i=0; i<numNodes;i++) {
    vertex(xpos[i],ypos[i]);
  }
  endShape(CLOSE);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////
//Circle class
class Circle{
  
  Circle(){
  } //constructor is empty as the class has no arguments
  
      //this the method of class Circle
    void drawCircle() {
      pushMatrix(); 
      translate(width/2,height/2); // first translated to the center
      rotate(i); //then rotated with an increment
      if(i<width/2) {
        ellipse(i+random(-2,2),i+random(-2,2),20,20); // then circle drawn
        i+=2;
      }
      else {
        i=0; //when circle position is out of window, increment becomes 0 again
      }
      popMatrix(); // poped back
      }
    }


///////////////////////////////////////////////////////////////////////////////////////////
//triangle class
class Triangle{
  
  Triangle(){
  }// again the constructor is empty as we dont have any arguments
  // i have noticed that if the class doen't have any arguments, we can skip the CONSTRUCTOR part, the program works fine
  
  
  void drawTriangle() {
        pushMatrix();
        translate(width/2,height/2); //translated to center
        rotate(i); //rotated through increment
        if(i<width/2) {
          triangle(0,0,100,150,i+random(-2,2),i+random(-2,2)); //then triangles are drawn with  one random cordinate
          i+=2; //increment applied
        }
        else {
          i=0; //increment back to zero in a condition
        }
        popMatrix(); //matrix poped back
      }
}
