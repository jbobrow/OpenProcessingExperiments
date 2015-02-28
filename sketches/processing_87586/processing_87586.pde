
void setup() {
       size(640, 480);
     } 
     
void draw(){
  background(255);    // Setting the background to white
  stroke(0);          // Setting the outline (stroke) to black
  fill(230,244,247);          // Setting the interior of a shape (fill) to grey 
  //rect(62,22,233,349); //Bottom base 
  rect(74,10,233,349,7); //Top base
  fill(21,189,229,63);
  rect(88,20,204,291); //Screen
  rect(88,267,203,44); //Home bar
  line(62,22,62,370); //Left base
  line(62,370,294,370); //Bottom base
  line(62,22,74,12); //Top left line
  line(62,370,74,358); //Bottom left line
  line(294,370,306,358); //Bottom right line
  ellipse(189,332,35,35); //Button
  rect(184,327,10,10); //Button icon
  fill(234,229,130);
  rect(106,44,38,38); //App 1
  fill(129,18,33);
  rect(172,44,38,38); //App 2
  fill(100,84,86);
  rect(237,44,38,38); //App 3
  fill(23,35,212);
  rect(106,119,38,38); //App 4
  fill(94,102,245,50);
  rect(172,119,38,38); //App 5
  fill(8,92,255);
  rect(237,119,38,38); //App 6
  fill(8,255,241);
  rect(106,196,38,38); //App 7
  fill(211,137,17);
  rect(172,196,38,38); //App 8
  fill(2,43,57);
  rect(237,196,38,38); //App 9
  fill(15,180,13);
  rect(102,270,38,38); //Home App 1
  fill(13,180,137);
  rect(147,270,38,38); //Home App 2
  fill(13,137,180);
  rect(192,270,38,38); //Home App 3
  fill(145,202,247);
  rect(237,270,38,38); //Home App 4
}



