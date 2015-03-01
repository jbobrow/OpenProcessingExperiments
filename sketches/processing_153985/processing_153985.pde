
/*
 *Creative codng
 *Week2, 04 - The clocks.
 *Darko Ilic
 * 
 */
 
  void setup() {
 size(600,600);
 background(224);
 rectMode(CENTER);
 ellipseMode(CENTER);
 noStroke(); 
 }
 
 void draw() {
 background(224);
 noStroke();
 
 int num = 11;         //the number of raws and columns
 int margin = 30;     // margin between the edge of the screen and the circle

 float gutter = 3; //distance between each cell
 float cellsize = (width - (2 * margin) - gutter * (num-1)) / num;  //size of each circle
 
 int circleNumber = 0; //counter
 
 for(int i=0; i<num; i++) {     //column x

   for (int j=0; j<num; j++) {   // row x
    ++circleNumber; 
 
    float tx = margin + cellsize/2 + (cellsize + gutter) * j;
    float ty = margin + cellsize/2 + (cellsize + gutter)  * i;
    
    if(circleNumber%2 == 0){
    movingCircle2(tx, ty, cellsize, - circleNumber * TWO_PI * millis() / 60000.0);
    } else
    {
    movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);    
    }  //end of if
    
   }   //end of j
  }    //end of i
  
 } // end of draw
  
 void movingCircle(float x, float y, float size, float angle) {
 
 //calculate the end point of the line
 float tempx = x + (size/2) * cos(angle);
 float tempy = y + (size/2) * sin(angle);

 
 stroke(148,193,98);
 strokeWeight(0.5);
 fill(230,230,0,random(220)); 
 ellipse(x, y, size, size);    //cicle
 

 fill(250,114,34);
 triangle(x-((size/20) * cos(angle-1.57079633)),y- ((size/20) * sin(angle-1.57079633)), x+((size/20) * cos(angle-1.57079633)),y+((size/20) * sin(angle-1.57079633)), tempx, tempy );  
 }
 
 void movingCircle2(float x, float y, float size, float angle) {
 
 //calculate the end point of the line
 float tempx = x + (size/2) * cos(angle);
 float tempy = y + (size/2) * sin(angle);
 
 stroke(148,193,9);
 strokeWeight(0.5);
 fill(230,230,0);
 rect(x, y, size, size);    //cicle

 fill(250,114,34);
 triangle(x-((size/20) * cos(angle-1.57079633)),y- ((size/20) * sin(angle-1.57079633)), x+((size/20) * cos(angle-1.57079633)),y+((size/20) * sin(angle-1.57079633)), tempx, tempy );
 }
