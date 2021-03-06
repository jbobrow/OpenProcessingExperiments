
int h;
int m;
int s;
 
int tonguesize = 10;
int tonguegrowthrate = 2;
 
//what to do when the program first starts up
void setup() {
  //create a canvas of 400 wide by 400 high pixels
  size(400, 400);
  //make the lines look smooth
  smooth(4);
  //make the lines look fat
  strokeWeight (5);
   
}
 
//what to do when the canvas should be drawn
void draw() {
  
  s = second ();
    m = minute ();
    h = hour ();
 
  //background
  background(255,10,255);
   
  //paint in red
  fill(136, 0, 1);
  //draw a line in red
  stroke(136, 0, 1);
  //Hair
  //draw an arc centered at 200, 200
  //with width 210 and height 300
  //from PI to TWO_PI
  arc(200, 200, 310, 380, PI, TWO_PI);
  //draw a rect from 45, 200
  //with width 100 and height 180
  rect(45, 200, 100, 180);
  //draw a rect from 255, 200
  //with width 100 and height 180
  rect(255, 200, 100, 180);
 
  //draw a line in black
  stroke(0);
  //paint in skin color
  fill(232, 187, 115);
  //Head
  //an ellipse centered at 200, 200
  //with width 300 and height 300
  ellipse (200, 200, 300, 300);
   
  //paint in red
  fill(136, 0, 1);
  //draw a line in red
  stroke(136, 0, 1);
  //Bang
  //draw an ellipse centered at 100, 50
  //with width 50 and height 50
  ellipse(100, 100, 50, 50);
  //similarly
  ellipse(150, 100, 50, 50);
  ellipse(200, 100, 50, 50);
  ellipse(250, 100, 50, 50);
  ellipse(300, 100, 50, 50);
   
  ellipse(125, 75, 50, 50);
  ellipse(175, 75, 50, 50);
  ellipse(225, 75, 50, 50);
  ellipse(275, 75, 50, 50);
   
  ellipse(150, 50, 50, 50);
  ellipse(200, 50, 50, 50);
  ellipse(250, 50, 50, 50);
   
  //draw a line in black
  stroke(0);
  //Nose
  //draw a line from 200, 250 to 200, 200
  line(200, 230, 200, 200);
   
  //paint in black
  fill(0, 0, 0);
  //draw a line in white
  stroke(255);
  //Left Eye
  //draw a line from 105, 155 to 130, 167
  line(105, 155, 170, 167);
  //draw a line from 130, 167 to 105, 195
  line(170, 167, 105, 195);
  //Right Eye
  //draw an ellipse centered at 270, 170
  //with width 50 and height mouseX/4
  ellipse (270, 170, 50, mouseX/4);
 
  //paint in red
  fill(255, 0, 0);
  //draw a line in red
  stroke(255, 0, 0);
  //Red Mouth
  //draw a rect from 100, 250
  //with width 200 and height 20
  rect(100, 250, 200, 20);
   
  //paint in red
  fill(250, 0, 0);
  //draw a line in red
  stroke(250, 0, 0);
 
  //Tongue
  //draw an arc centered at 200, 260
  //with width 100 and height 200
  //from 0 to TWO_PI
  arc(200, 260, 100, tonguesize, 0, PI);
  tonguesize = tonguesize + tonguegrowthrate;
  if(tonguesize >= height/2){
    tonguegrowthrate = -2; }
  else if(tonguesize <=10){
    tonguegrowthrate = 2;}
   
  //draw a line in light red
  stroke(200, 0, 0);
  //draw a line in the tongue (from 200, 260 to 200, tonguesize) that moves up and down together
  line(200, 260, 200, 260+tonguesize/2);
    tonguesize = tonguesize + tonguegrowthrate;
  if(tonguesize >= height/2){
    tonguegrowthrate = -2; }
  else if(tonguesize <=10){
    tonguegrowthrate = 2;}
     
     
  //draw a point in red
  stroke(255, 0, 0);
  //draw a point at 200, 260
  point(200, 260);
  
  
  
  
  
   pushMatrix();  
    translate(200,200);
  //clock
   //hours
    strokeWeight(7);
    stroke(0);
    pushMatrix();
    rotate(radians (30*h));
    line(0,0,0,-95);
    popMatrix();
  
    //minute
    strokeWeight(5);
    stroke (0);
    pushMatrix();
    rotate(radians (6*m));
    line(0,0,0,-135);
    popMatrix();
     
    //seconds
     strokeWeight(2);
    stroke (0);
    pushMatrix();
    rotate(radians (6*s));
    line(0,0,0,-155);
    popMatrix();
  popMatrix();
  
  
  if (mousePressed){
    //background
  background(255,10,255);
   
  //paint in red
  fill(136, 0, 1);
  //draw a line in red
  stroke(136, 0, 1);
  //Hair
  //draw an arc centered at 200, 200
  //with width 210 and height 300
  //from PI to TWO_PI
  arc(200, 200, 310, 380, PI, TWO_PI);
  //draw a rect from 45, 200
  //with width 100 and height 180
  rect(45, 200, 100, 180);
  //draw a rect from 255, 200
  //with width 100 and height 180
  rect(255, 200, 100, 180);
 
  //draw a line in black
  stroke(0);
  //paint in skin color
  fill(232, 187, 115);
  //Head
  //an ellipse centered at 200, 200
  //with width 300 and height 300
  ellipse (200, 200, 300, 300);
   
  //paint in red
  fill(136, 0, 1);
  //draw a line in red
  stroke(136, 0, 1);
  //Bang
  //draw an ellipse centered at 100, 50
  //with width 50 and height 50
  ellipse(100, 100, 50, 50);
  //similarly
  ellipse(150, 100, 50, 50);
  ellipse(200, 100, 50, 50);
  ellipse(250, 100, 50, 50);
  ellipse(300, 100, 50, 50);
   
  ellipse(125, 75, 50, 50);
  ellipse(175, 75, 50, 50);
  ellipse(225, 75, 50, 50);
  ellipse(275, 75, 50, 50);
   
  ellipse(150, 50, 50, 50);
  ellipse(200, 50, 50, 50);
  ellipse(250, 50, 50, 50);
   
  //draw a line in black
  stroke(0);
  //Nose
  //draw a line from 200, 250 to 200, 200
  line(200, 230, 200, 200);
   
  //paint in black
  fill(0, 0, 0);
  //draw a line in white
  stroke(255);
  //Left Eye
  //draw a line from 105, 155 to 130, 167
  line(105, 155, 170, 167);
  //draw a line from 130, 167 to 105, 195
  line(170, 167, 105, 195);
  //Right Eye
  //draw an ellipse centered at 270, 170
  //with width 50 and height mouseX/4
  ellipse (270, 170, 50, mouseX/4);
 
  //paint in red
  fill(255, 0, 0);
  //draw a line in red
  stroke(255, 0, 0);
  //Red Mouth
  //draw a rect from 100, 250
  //with width 200 and height 20
  rect(100, 250, 200, 20);
   
  //paint in red
  fill(250, 0, 0);
  //draw a line in red
  stroke(250, 0, 0);
 
  //Tongue
  //draw an arc centered at 200, 260
  //with width 100 and height 200
  //from 0 to TWO_PI
  arc(200, 260, 100, tonguesize, 0, PI);
  tonguesize = tonguesize + tonguegrowthrate;
  if(tonguesize >= height/2){
    tonguegrowthrate = -2; }
  else if(tonguesize <=10){
    tonguegrowthrate = 2;}
   
  //draw a line in light red
  stroke(200, 0, 0);
  //draw a line in the tongue (from 200, 260 to 200, tonguesize) that moves up and down together
  line(200, 260, 200, 260+tonguesize/2);
    tonguesize = tonguesize + tonguegrowthrate;
  if(tonguesize >= height/2){
    tonguegrowthrate = -2; }
  else if(tonguesize <=10){
    tonguegrowthrate = 2;}
     
     
  //draw a point in red
  stroke(255, 0, 0);
  //draw a point at 200, 260
  point(200, 260);
  
  
  
    // hour
    pushMatrix();
    translate(200,200);
    strokeWeight(7);
    stroke(0);
    pushMatrix();
    rotate(radians (mouseY));
    line(0,0,0,-95);
    popMatrix();
      //minute
    strokeWeight(5);
    stroke (0);
    pushMatrix();
    rotate(radians (mouseX));
    line(0,0,0,-135);
    popMatrix();
     
    //seconds
     strokeWeight(2);
    stroke (0);
    pushMatrix();
    rotate(radians (6*s));
    line(0,0,0,-155);
    popMatrix();
     
    popMatrix();
  
  
  
}}
