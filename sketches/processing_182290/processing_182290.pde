
void setup() {
  size(1200, 700);
  background(0);
  //int polyCount = 200;
  //int sideCount = 0;
  
  float radius = 0.0;
  float rotation = 0.0;
  noStroke();
  frameRate(30);
  
}//END SETUP

void draw(){
  
  int fillColor = 1;  
  fillColor = floor(random(0,3.999));
  
  float drawShape; 
  
  //drawShape = 1;
  drawShape = int(random(2,100)) % 2;
  //println(drawShape);
  
  //DRAW ARC
  if (drawShape == 0){
      float arcSize = random(width, width*2);
      strokeWeight(random(1,555));     
      noFill();
        // Set the fill color
          if (fillColor == 1){
           stroke( 3, 99, 124, random(15,35));//Blue-Green
          } 
          else if (fillColor == 2){
          stroke( 252, 186, 56, random(5,15));//252, 186,56
          }       
          else if (fillColor == 3){
            stroke( 213, 91, 57, random(15,25));//Copper
          } 
          else {
            //stroke( 233, 91, 57, random(15,25));//
            //stroke( 3, 99, 124, random(15,35));//Blue-Green
            stroke( 0, 0, 0, random(15,45));
          }
      
      //arc(x, y, width, height, start, stop)
      arc(random(-500, width+50), random(-500, height+50), arcSize, arcSize, random(HALF_PI, PI+QUARTER_PI), TWO_PI*random(.8, 1));
  }
  
  //DRAW RECTANGLE
  drawShape = int(random(1,100)) % 6;
  //println(drawShape);
  if (drawShape == 0){
  fill(random(0,255), random(0,255), random(0,255), random(40,100));
  noStroke();
    fillColor = floor(random(0,3.999));
    // Set the fill color
      if (fillColor == 1){
       //fill( 3, 124, 124, random(15,45));//Blue-Green
       fill( 3, 99, 124, random(10,20));//Blue-Green
      } 
      else if (fillColor == 2){
      fill( 252, 186, 56, random(15,25));//
      }       
      else if (fillColor == 3){
        fill( 213, 91, 57, random(15,25));//Copper
      } 
      else {
        //fill( 255, 255, 255, random(15,45));//White
        //fill( 121, 121, 121, random(15,45));//Gray
        fill( 0, 0, 0, random(15,45));
        //fill( 3, 99, 124, random(15,25));//Blue-Green
      }
    rect(random(0, width-50), random(0, height-50), random(100, 300), random(100,300)); 
  }
}//end draw



void mousePressed() {
  noLoop();  
}

//void mouseReleased() {
//  loop();  // Releasing the mouse stops looping draw()
//}
void polygon (int sideCount, float radius)
{
  float theta = 0.0;
  float x = 0.0;
  float y = 0.0;
  int fillColor = 1;
  beginShape ();
  for (int i=0; i<sideCount; i++) {
    fillColor = floor(random(0,3.999));
    x = cos(theta)*radius;
    y = sin(theta)*radius;
    vertex(x,y);
    theta += TWO_PI/sideCount;
    
    // Set the fill color
      if (fillColor == 1){
       fill( 0, 255, 255, random(15,45));//Cyan
      } 
      else if (fillColor == 2){
        fill( 255, 0, 255, random(15,45));//Magenta
      }       
      else if (fillColor == 3){
        fill( 255, 255, 0, random(15,55));//Yellow
      } 
      else {
        fill( 255, 255, 255, random(15,45));//White
      }
    //fill(random(0,255), random(0,255), random(0,255), random(5,100));
    
  }
  endShape(CLOSE);
} //end polygon


