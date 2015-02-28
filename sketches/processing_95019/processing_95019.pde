
float radius = 100; // this is the size of shape
//float phase = 0; // we don't use this yet, but it comes in handy in later examples.

 float magnify = 100; // This is how big we want the rose to be.
 float phase = 100; // Phase Coefficient : this is basically how far round the circle we are going to go
 float amp = 100; // Amp Coefficient : this is basically how far from the origin we are.
 int elements = 987;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 

  
 
  void setup() {
    
    
  size(750,624,P3D); // The size is arbitrary really
  frameRate(15); // So is the framerate
  background(255,255,255); // Background is white in this example so you can concentrate on the maths 
 

  }
 
  void draw() {
  //background(random(255));//clear the screen each frame
   background(0);
  
   noFill();
   stroke(255,0,120,120);
 //  elements = (int) (mouseX/30);
   phase =200/40;//get the mouse X coordinate and use it to set the current phase coefficient
   println("phase = " + phase);//print it. It's interesting...
   amp = 200/40;//get the mouse Y coordinate and use it to set the current amp coefficient
  
   float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
  translate(width*0.5,height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
 rotate(-HALF_PI);
//translate(width*0.5,height*0.5);
   for (int i = 0; i < elements;i+=1) { // this for loop calculates the x and y position for each node in the system and draws a line between it and the next.
  //
 
  rotateX(frameCount/30.0);
 rotateZ(frameCount/50.0);

rotateY(frameCount/100.0);

   point(sin(spacing*amp*i)*(cos(spacing*i*phase)*magnify),sin(spacing*phase*i)*(sin(spacing*i*amp)*magnify));
//rotateY(frameCount/60.0);
   
   ellipse(sin(spacing*amp*i)*(cos(spacing*i*phase)*magnify),sin(spacing*phase*i)*(sin(spacing*i*amp)*magnify),sin(spacing*amp*(i+1))*(cos(spacing*(i+1)*phase)*magnify),sin(spacing*phase*(i+1))*(sin(spacing*(i+1)*amp)*magnify));
  point(cos((TWO_PI/elements)*i)*radius,sin((TWO_PI/elements)*i)*radius);
rotateX(frameCount/50.0);
  //line(cos((TWO_PI/elements)*i)*radius,sin((TWO_PI/elements)*i)*radius,cos((TWO_PI/elements)*(i+1))*radius,sin((TWO_PI/elements)*(i+1))*radius);
rect(sin(spacing*amp*i)*(cos(spacing*i*phase)*magnify),sin(spacing*phase*i)*(sin(spacing*i*amp)*magnify),sin(spacing*amp*(i+1))*(cos(spacing*(i+1)*phase)*magnify),sin(spacing*phase*(i+1))*(sin(spacing*(i+1)*amp)*magnify));
// box(sin(spacing*amp*i)*(cos(spacing*i*phase)*magnify),sin(spacing*phase*i)*(sin(spacing*i*amp)*magnify),sin(spacing*amp*(i+1))*(cos(spacing*(i+1)*phase)*magnify));
  

 }}
