
float circleWidth;
float circleHeight;
float speed;
float distance;
int dotCount;
float[][] coordinates;
float[] angle;
float[][] lineColor;



void setup() {
  size(800,800); 
  circleWidth = 8;
  circleHeight =circleWidth;
  distance = circleWidth +=1;
  dotCount = floor((height/2)/distance);
  speed = 1.5/height;
  
  coordinates = new float[2][dotCount];
  angle = new float[dotCount];
  lineColor = new float[3][dotCount];
 
  stroke(255);

}

void draw() {
  speed = (mouseY*.00001);
  
  background(0);
  for (int i =0; i<dotCount; i++) { 
  
    angle[i] += (dotCount-i)*speed;   //cacluate the new angle for a given circle
    coordinates[0][i]=width/2+(distance*i)*cos(angle[i]); //calculate the x coordinate for a circle
    coordinates[1][i]=height/2+(distance*i)*sin(angle[i]); //calculate the y coordinate for a circle
    
     //this stuff changes colors
    lineColor[0][i] = 100;
    lineColor[1][i] = 50+i*2;
    lineColor[2][i] = 100+i*4;
    
    
    //draw our lines
    if(i>1) {
      pushStyle();
      strokeWeight(floor(mouseX*.033));
      stroke(lineColor[0][i], lineColor[1][i], lineColor[2][i], 100);
      line(coordinates[0][i-1], coordinates[1][i-1], coordinates[0][i], coordinates[1][i]);
      popStyle();
    }

  }


}
