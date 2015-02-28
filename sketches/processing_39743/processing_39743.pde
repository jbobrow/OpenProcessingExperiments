
int thoughBubbleX = mouseX = 186; 
int thoughtBubbleY= mouseY = 35; 

void setup() {
  size(200, 200);
  background(20, 75, 120, 90); 
  smooth();
  frameRate(20);
}

void draw() {
  background(20, 75, 120, 90);
  //color the face
  fill(232, 192, 117);
  noStroke();
  ellipseMode(CENTER);
  
  //Draw the Neck Lines
  stroke(0);
  line (65, 200, 105, 140);
  line (135, 200, 95, 140);  
  //Draw the Neck
  fill(28, 234, 109); 
  triangle(65, 200, 100, 150, 135, 200); 
 
  
  
  
  //Draw a head
  fill (232, 192, 117); 
  ellipse(100, 130, 90, 100);

  //color for the eyes--every ellipse that follows this will be black
  fill(0);
  //Left Eye
  ellipse(80, 120, 20,20);
  //Left Eye Pubple
  fill(255);
  ellipse(85,115,5,5);
  //Right Eye
  fill(0);
 //Right Eye Pupil
  ellipse(120, 120, 20, 20); 
  fill(255);
   //To make the pupil add five or the number to each side of the face's initial X side dimention of the eye. 
  ellipse(125,115,5,5);
 
  //A Mouth That Opens
  fill(216,44,99);
  ellipse(100, 150, random(10,20), random(5,10));
  
  //Draw Biggest Thought Bubble
  fill (255, random (0, 255)); 
  ellipse(mouseX, mouseY, random(50, 55), random(40,45)); 
  //Draw Middle Size Thought Bubble
  ellipse (mouseX-10, mouseY+30, random(20, 25), random (13, 17));
 //Draw Smallest Thought Bubble
ellipse (mouseX-20, mouseY+45, random (7, 12), random (7, 9)); 
  
}


