
int thoughBubbleX = mouseX = 186; 
int thoughtBubbleY= mouseY = 35; 

float r = 50; // hair 
float c = 0; // hair


void setup() {
  size(200, 200);
  background(20, 75, 120, 90); 
  smooth();
  frameRate(20);
}

void draw() {
  background(20, 75, 120, 90);
  {
    
    //Shino and I trying to get fancy with cosign codes
//  float x = r * cos (c); 
 //float y = r * sin (c); 
  //ellipse (width/4 + x, height/2 + y, 100, 100); 
 
  }

  for (int x = 55; x < 150; x += 10){
  for (int y = 80; y <180; y += 10){
    float s=random(0.5,5); 
    hair(x,y,s);  
  }
  }
   
   // Add gravity and speed portion to this to make the thought bubbles fall when
   // the mouse is pressed 
    //void mouse presses () { 
      //if (mousePressed); 
    
    
    body();

  //Draw Biggest Thought Bubble
  fill (255, random (0, 255)); 
  ellipse(mouseX, mouseY, random(50, 55), random(40,45)); 
  //Draw Middle Size Thought Bubble
  ellipse (mouseX-10, mouseY+30, random(20, 25), random (13, 17));
 //Draw Smallest Thought Bubble
ellipse (mouseX-20, mouseY+45, random (7, 12), random (7, 9)); 
  
}
  void body(){
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
  //Left Eye Puple
  float a=random(80,85);
  fill(255);
  ellipse(a,115,5,5);
  //Right Eye
  fill(0);
 //Right Eye 
  ellipse(120, 120, 20, 20); 
  fill(255);
   //To make the pupil add five or the number to each side of the face's initial X side dimention of the eye. 
  ellipse(a+40,115,5,5);
  
 
  //A Mouth That Opens
  fill(216,44,99);
  ellipse(100, 150, random(10,20), random(5,10));
  
  }
  
  void hair (int x, int y, float s){
    pushMatrix(); 
    translate(x, y); 
    scale(s); 
    fill (50, 31, 7);
    ellipse (0, 0, 10, 10); 
    fill (72, 43, 19); 
    ellipse (0, 0, 5, 5); 
    popMatrix (); 
  }
  

