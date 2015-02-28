
//Ray this is my re-do project, for project 2
int sizeX = 500;
int sizeDivided = sizeX/2;
int prevX = 0, prevY = 0;

void setup(){
   size(450, 450);
   background(0);
 }
 void draw(){
   
  int x = mouseX;
  int y = mouseY;
   
  //clear the screen if a button is pressed
  if (keyPressed == true)
  {
    
    background(random(255));

   
  }
   
  //if the mouse has moved...
  if (prevX != x && prevY != y)
  {
     smooth();
    int point1 = int( random(sizeDivided) );
    int point2 = int( random(sizeDivided) );
    int point3 = int( random(sizeDivided) );
    int point4 = int( random(sizeDivided) );
    int point5 = int( random(sizeDivided) );
    int point6 = int( random(sizeDivided) );
     
     tint(255,100);
    int fillValue1 = int (random(255));
    int fillValue2 = int (random(255));
    int fillValue3 = int (random(255));
    int fillValue4 = int (random(255));
     
    int strokeValue1 = int( random(255) );
    int strokeValue2 = int( random(255) );
    int strokeValue3 = int( random(255) );
    int strokeValue4 = int( random(255) );
     
    //NW quadrant
    rect(point1, point2, point3, point4);
    fill(fillValue1, fillValue2, fillValue3, fillValue4);
    stroke(strokeValue1, strokeValue2, strokeValue3, strokeValue4);
     
    //NE quadrant
    triangle(sizeX - point1, point2, sizeX - point3, point4,sizeX-point5, point6);
    fill(fillValue1, fillValue2, fillValue3, fillValue4);
    stroke(strokeValue1, strokeValue2, strokeValue3, strokeValue4);
     
    //SW quadrant
    rect(point1, sizeX - point2, point3, sizeX - point4);
    fill(fillValue1, fillValue2, fillValue3, fillValue4);
    stroke(strokeValue1, strokeValue2, strokeValue3, strokeValue4);
     
    //SE quadrant
    triangle (sizeX - point1, sizeX - point2, sizeX - point3, sizeX - point4,sizeX-point5, point6);
    fill(fillValue1, fillValue2, fillValue3, fillValue4);
    stroke(strokeValue1, strokeValue2, strokeValue3, strokeValue4);
     
  }
   
  prevX = x;
  prevY = y;
   
}


