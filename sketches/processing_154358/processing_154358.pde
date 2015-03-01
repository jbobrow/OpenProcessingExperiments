
/*
 *Creative codng
 *Week2, clocks + 'click and drag' interaction
 *
 */
 
 
 
 int num= 3;
 int R = 163;
 int G = 206;
 int B = 114;
 
 void setup() {
 size(600,600);
 rectMode(CENTER);
 ellipseMode(CENTER);
 noStroke();
 }
  
 void draw() {
 background(R,G,B);
 noStroke();
  
// int num ;         //the number of raws and columns
 int margin = 20;     // margin between the edge of the screen and the circle
 
 float gutter = 10; //distance between each cell
 float cellsize = (width - (2 * margin) - gutter * (num-1)) / num;  //size of each circle
 int circleNumber = 0; //counter
 
  
 for(int i=0; i<num; i++) {     //column x
   for (int j=0; j<num; j++) {   // row x
    ++circleNumber;
     
    float tx = margin + cellsize/2 + (cellsize + gutter) * j;
    float ty = margin + cellsize/2 + (cellsize + gutter)  * i;
       
      movingCircleH(tx, ty, cellsize, ((TWO_PI * hour() / 12.0)-HALF_PI)+((circleNumber-1)*TWO_PI/12));
      movingCircleM(tx, ty, cellsize,(TWO_PI * minute() / 60.0)-HALF_PI); 
      movingCircleS(tx, ty, cellsize,(TWO_PI * second() / 60.0)-HALF_PI);
     
   }   //end of j
  }    //end of i 
 } // end of draw
 
  
 void movingCircleS(float x, float y, float size, float angle) {    
  
 
 float tempx = x + (size/2) *  cos(angle);
 float tempy = y + (size/2) *  sin(angle);
 float tempx1 = x + (size/3) * cos(angle);
 float tempy1 = y + (size/3) * sin(angle);
 
 stroke(255);
 strokeWeight(3);
 fill(220,0);
 ellipse(x, y, size, size);    //cicle
 
 fill(R,G,B);
 strokeWeight(1);
 line(x,y,tempx,tempy);
 strokeWeight(0.5);
 ellipse(x,y,50-num*num,50-num*num);
   
 }
 
 void movingCircleM(float x, float y, float size, float angle) {
  
 //calculate the end point of the line
 float tempx = x + (size/2) * cos(angle);
 float tempy = y + (size/2) * sin(angle);
 float tempx1 = x + (size/2.5) * cos(angle);
 float tempy1 = y + (size/2.5) * sin(angle);
  
 stroke(255);
 strokeWeight(0.5);
 fill(250,114,34);
 strokeWeight(3);
// ellipse(x, y, size - size/5 , size - size/5 );
 line(x,y, tempx1, tempy1 );
 }
  
 void movingCircleH(float x, float y, float size, float angle) {
  
 //calculate the end point of the line
 float tempx = x + (size/2) * cos(angle);
 float tempy = y + (size/2) * sin(angle);
 float tempx1 = x + (size/4) * cos(angle);
 float tempy1 = y + (size/4) * sin(angle);
  
 stroke(230);
 strokeWeight(0.5);
 fill(200,150);
 rect(x, y, size, size);
 strokeWeight(1);
 line(x,y-70,x,y-(size/2)+3);
 line(x,y+70,x,y+(size/2)-3);
 line(x+70,y,x+(size/2)-3,y);
 line(x-70,y,x-(size/2)+3,y);
 
 stroke(255);
 strokeWeight(5);
 line(x, y, tempx1, tempy1);  
 }
 
 void mousePressed(){
  num ++;  
  if(num >6){
    num=2;    
  }     
}

 void mouseDragged(){
  println("colorRGB:" +R+"."+G+"."+B );
  R ++;
  G ++;
  B ++;
  if(R == 255) 
     R= 163;
  if(G == 255) 
     G= 206; 
  if(B == 255) 
     B= 114;
}

