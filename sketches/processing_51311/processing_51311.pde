
// Georgina Yeboah
// PS1
// question3
//ellipse (r,l,up,dwn)
 

int btn_x = 260;
int btn_y= 10;
int btn_w= 40;
int btn_h= 250;
boolean btn_state = true;

void setup () {
  size (300,300);
  smooth ();
}
void draw () {

    if (btn_state == true) {
    background (146, 247, 250);
  }
  else {
    loadFont ("Aharoni-Bold-48.vlw");
    text ("TOO CUTE", 125, 30);
    fill (247, 45, 221);
  }
  
  rect(btn_x, btn_y, btn_w, btn_h);
  
  float s = 100;
  while (s > 20){
    float c = map(s, 450, 10, 100, 0);
    colorMode(RGB);
    s -= 20;
  fill (mouseX, mouseY, 50, 50);
  ellipse(mouseX, mouseY, 35, 35);
  smooth ();
  noStroke ();

  }
  // button's physical form
  fill (51, 222, 40);
  rect (0, 200, 300, 300);
  // bear's left ear
  fill (116, 63, 6);
  ellipse ( 75, 75, 75, 75);
  fill (255, 255, 196);
  ellipse (75, 75, 30, 30);
  

  // bear's right ear
  fill (116, 63, 6);
  ellipse (205,75,75, 75);
  fill (255, 255, 196);
  ellipse (205, 75, 30, 30);

 
  //bear's arms
  fill (116, 63, 6);
  ellipse (75, 200, 45, 45);
  fill (255, 255, 196);
  ellipse (75, 200, 20, 20);
  fill (116, 63, 6);
  ellipse (205, 200, 45, 45);
  fill (255, 255, 196);
  ellipse (205, 200, 20, 20);
  
  // bear's feet
  fill (116, 63, 6);
  ellipse (95, 280, 40, 30);
  ellipse (183, 280, 40, 30);
 
 
  //bears body
  fill (116, 63, 6); 
  ellipse (140, 220, 140, 130);
  fill (255, 255, 196);
  ellipse (140, 220, 110, 100);


  //bear's head
  fill (116, 63, 6);
  ellipse (140, 120, 150, 150);
 
  // bear's eyes
  fill (5, 3, 0);
 ellipse (100, 110, 25, 25);
 ellipse (180, 110, 25, 25);
  
   // bear's shine
   fill (255, 251, 247);
  ellipse (106, 110, 10, 10);
  ellipse (186, 110, 10, 10);
 
  //bears face
  fill (255, 255, 196);
  ellipse (140, 160, 55, 45);
  fill (5, 3, 0);
  ellipse (140, 160, 20, 10);
  fill (255, 255, 196);
  }
//---------------------------------------------------------------
 void mousePressed(){
 if (mouseX > btn_x && mouseX < btn_x + btn_w &&
 mouseY > btn_y && mouseY < btn_y + btn_h){
 if (btn_state == false){
 btn_state = true;
 }
 else {
 btn_state = false;
 }
 }
 }
//---------------------------------------------------------------
void keyPressed() {
  saveFrame ("screenshot.jpg");
}


