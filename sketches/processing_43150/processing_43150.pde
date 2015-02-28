
int sideNum=-1; //input on [0,very large numbers)
//negative numbers do not make sense and 0 will mean it will not render anything
float figRadius=100;
float rotateFigure=0;//if zero the figure will remain 'level'.  give it an arg in radians to rotate the figure.  Pos values will rotate it down and to the right, neg in the opposite direction


void setup(){  
  size(600,600);
  background(255);
  
  
  pushMatrix();
    translate(width/2,height/2);
    rotate(rotateFigure);
    rotate(-2*PI/(2*sideNum));
    
    for(int i=1; i<sideNum; i++){ //this for loop is sets up the number of sides
      for(float theta=0; theta<2*PI; theta=theta+PI*2/sideNum){ //this for loop takes the number of sides and makes some steps for theta, I'm using the idea of the math unit circle for the logic.
        fill(0);//fill colour of the triangles which make up the figure
        triangle(
          0, 0,
          figRadius*cos(theta), figRadius*sin(theta),
          figRadius*cos(theta+PI*2/sideNum), figRadius*sin(theta+PI*2/sideNum));
      }
    }
  popMatrix();
  
}

