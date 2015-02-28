
/*

funny face 
touch hair and see reaction
click mouse and see reaction

*/

boolean first_run = true;
int red_hair = 0;
int blue_hair = 0;
int green_hair = 0;
int click_count = 0;

void setup(){
  size(600,600);
  smooth();
   
}
 
void draw(){
  
 background(0);
 float[] move_on_x_range = new float[]{244, 441};
 float[] move_on_y_range = new float[]{145, 502};

   
 //head
 noStroke();
 fill(255);
 ellipse(250,250, 200, 300);
  
 //nose
 //triangle(150, 270, 160, 290, 120, 290);
  //stroke(0);
  beginShape();
  curveVertex(150, 250); // the first control point
  curveVertex(150, 250); // is also the start point of curve

  curveVertex(120, 260);
  curveVertex(130, 270);
  curveVertex(152, 280); // the last point of curve
  curveVertex(152, 280); // is also the last control point
  endShape();
  
 //eye brow
 stroke(0);
 strokeWeight(3);
 
 if ( mouseX > move_on_x_range[0] && mouseX < move_on_x_range[1] && mouseY > move_on_y_range[0] && mouseY < move_on_y_range[1]) {
   line(160, 200, 200, 190);

 }
 else {
   line( 200, 200,160, 190); 
   
 }
 
 //eye
 strokeWeight(1);
 stroke(0);
 fill(255);
 ellipse(180,220, 40, 20);
 
 if ( click_count == 0) { 
   fill(76,88,188);
 }
 else
 {
   fill(red_hair, blue_hair, green_hair);
 }
 ellipse(170,220,20, 15);
 fill(0);
 ellipse(165,220,5, 5);
  
  
 //mouth
 
  fill(245,79,112);
  if ( mouseX > move_on_x_range[0] && mouseX < move_on_x_range[1] && mouseY > move_on_y_range[0] && mouseY < move_on_y_range[1]) {
    
    ellipse(175, 350, 40, 10);
  }
  else {
    curve(175, 310, 175, 340, 190, 350, 190, 350);  
  }
  
  noFill();
  strokeWeight(2);
  //stroke(random(0, 255), random(0, 255), random(0,255));
  
  if (first_run) {
    red_hair = 250;
    blue_hair = 32;
    green_hair = 8;
  }
  
  if (mousePressed){
     red_hair = int(random(0, 255));
     blue_hair = int(random(0, 255));
     green_hair = int(random(0, 255));   
     click_count++;
  }
  
  stroke(red_hair,blue_hair,green_hair);
  
  //move_on_y_range
  for (int i = 0; i < 100; i+=2){
     int add_movement = 0;
     int random_incr = 0;
     //println(mouseX + ", " + mouseY);
     if ( mouseX > move_on_x_range[0] && mouseX < move_on_x_range[1] && mouseY > move_on_y_range[0] && mouseY < move_on_y_range[1]) {
       //add_movement = 50;
       random_incr = int(random(-5, 5));
     }
     //println("mousX = " + mouseX + "mousY = " + mouseY  + " add_movement = " + add_movement);  
     bezier(230+i,120, 270+(i*2),300,  290+ (i*2) +random_incr,440+random_incr, 340+random_incr,500 +random_incr);
  }
   
  first_run = false;
   
  //hatbv
  noStroke();
  fill(8,228,250);
  ellipse(250,120, 300, 40);
  //bezier(200,120, 270, 300 , 290,440, 340,500);
   
   
}
