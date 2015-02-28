
void setup () {
  size(600,600);
  background(62,219,243);
  //slows down the frame rate to stop the eyes from moving too quickly
  frameRate(10);
}

void draw(){
  //calls and loops the drawbear function
  drawbear(); 
}

void drawbear(){
  //body
  fill(143,62,9);
  noStroke();
  ellipse(300,350,200,200);
  
  //head
  fill(143,62,9);
  noStroke();
  ellipse(300,200,150,150);
  
  //ears
  fill(143,62,9);
  noStroke();
  ellipse(250,130,50,50);
  ellipse(350,130,50,50);
  
  //nose and mouth
  noFill();
  strokeWeight(1);
  stroke(245,152,228);
  arc(300,215,60,60,20,40,OPEN);
  fill(143,62,9);
  noStroke();
  rect(234,180,110,50);
  fill(245,152,228);
  ellipse(300,200,20,10);
  strokeWeight(1);
  stroke(245,152,228);
  line(300,200,300,245);

  //eyes
  noStroke();
  fill(255);
  ellipse(270,180,30,30);
  ellipse(330,180,30,30);
  fill(0);
  
  //left eye movement, set the co-ordinate points to random within the eye
  float left_x =270;
  float left_y =180;
   left_x=random(260, 280);
   left_y=random(165, 190); 
  ellipse(left_x,left_y,10,10);
  
  //right eye movement, set the co-ordinates to random x and y with in the white part of the eye
  float right_x =330;
  float right_y = 180;
    right_x = random(320, 340);
    right_y = random(170, 190);
  ellipse(right_x,right_y,10,10);
  
//arms and legs
   fill(143,62,9);
   ellipse(190,310,150,50);
   ellipse(410,310,150,50);
   ellipse(250,450,50,250);
   ellipse(350,450,50,250);
}
