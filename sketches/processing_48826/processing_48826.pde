
color fillVal = color(155, 205, 100);
String[] headlines = {
  "To Make things happen - Move the Mouse and Click the Mouse.", 
  " OR on your Keyboard - Press the Up Arrow and Press the Down Arrow."
};
PFont f;
float x;
int index = 0;

void setup (){
  size (600, 600);
  smooth ();
  ellipseMode (CENTER);
  f = createFont ("Arial", 16, true);
  x = width;
}

void draw (){
    background (0, 0, 128);
  
//---------------------------------------------------------------Face
  fill (fillVal);
  ellipse (300, 300, 550, 550);
  
//------------------------------------------------------Scrolling text
 textFont (f, 20);
 fill (255);
 textAlign (LEFT);
 text (headlines[index], x, 18);
 
 x= x - 2;
 
 float w = textWidth (headlines[index]);
 if (x < -w) {
   x = width;
   index = (index + 1) % headlines.length;
 }
  
//------------------------------------------------------------Left Eye
  fill (255);
  noStroke ();
  arc (175, 200, 200, 100, PI, 100);
  float lx = map(mouseX, 0, width, 125, 210);
  float ly = map(mouseY, 0, height, 180, 200); 
  fill (135, 206, 250);
  stroke (25, 25, 112);
  ellipse(lx, ly, 40,40); 
//------------------------------------------------------------Left Eye Pupil  
  float lpx = map(mouseX, 0, width, 125, 210);
  float lpy = map(mouseY, 0, height, 180, 200); 
  fill (0);
  ellipse(lpx, lpy, 20,20); 
  

//-----------------------------------------------------------Right Eye
  fill (255);
  noStroke ();
  arc (425, 200, 200, 100, PI, 100);
  float rx = map(mouseX + 2, 0, width, 475, 390);
  float ry = map(mouseY + 2, 0, height, 180, 200); 
  fill (205, 133, 63);
  stroke (139, 69, 19);
  ellipse(rx + 2, ry, 40,40); 
 //------------------------------------------------------------Right Eye Pupil
  float rpx = map(mouseX + 2, 0, width, 475, 390);
  float rpy = map(mouseY + 2, 0, height, 180, 200); 
  fill (0);
  ellipse(rpx + 2, rpy, 20,20); 
  
//----------------------------------------------------------Left Eye half blink
  if (mousePressed) {

  fill (fillVal);
  noStroke ();
  arc (175, 200, 200, 100, -PI, 0);
 }
 
 //-----------------------------------------------------Right Eye half blink
 if (keyPressed)  {
  if (key == CODED){ 
   if (keyCode == UP) {
      fill (fillVal);
      noStroke ();
      arc (425, 200, 200, 100, -PI, 0);
   } //-----------------------------------End keycode == UP
//------------------------------------------------------Right Eye full blink
 else if (keyCode == DOWN) {
  fill (fillVal);
  noStroke ();
  arc (425, 200, 200, 100, PI, 100);
 }  //------------------------------------End keycode == DOWN
  }  //-----------------------------------End key == CODED
  
}   //------------------------------------End keyPressed


 
 }  //------------------------------------End void Draw

