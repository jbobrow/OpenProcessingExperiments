
//22/09/2013
//MOK Ka Yee Amanda
//SID 52622241
  
void setup(){
  size(500,500);   //Set window size
  smooth();        //Smooth the lines
  background(255); //Set the white background
    
}
 
void draw() {
 
for (int i = 20; i < 450; i = i+10) {  //for structures one, loop dot
  for (int j = 20; j < 450; j = j+10) {
    point(i, j);
    strokeWeight(1);
  }
}
 
for (int i = 20; i < 450; i = i+5) {  //for structures two, loop line
  line(250, i, 480, i);
}
 
if (mouseX<100) {  //blue rect
      fill(#0000FF);  //set the retc for blue
      strokeWeight(5);
      stroke(10);
      rect(50,240,180,180);
      }
 
else if (mouseX<200) {  //red ellipse
      fill(#FF0000);  //set the ellipse for red
      strokeWeight(5);
      stroke(10);
      ellipse(380, 250, 150, 150);
      }
 
 
else if (mouseX<350) {  //green triangle
      fill(#00FF00);  //set the triangle for green
      strokeWeight(5);
      stroke(10);
      triangle(200,150, 300, 30, 90, 80);
      }
       
fill(100);  //Right, SHOW
  smooth();
  textSize(9);
  text("S H O W", 440, 480);
 
}
 
// the end
