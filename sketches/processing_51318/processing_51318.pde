
//Georgina Yeboah
// PS1
// question 6

//Butterfly composition
int btn_x= 20;
int btn_y= 20;
int btn_h= 20;
int btn_w= 20;
boolean btn_state = true;

void setup () {
  size (300, 300);
  smooth ();
}
void draw () {
  
  if (btn_state == true) {
    background (117, 252, 251);
    fill (250,226,189);

  }
  else {
    // light blue
    fill (207, 211, 247);
  }

 

  for ( int i=0; i< width; i += 20) {
        line(i, 0, 0, i);
        line(i, width, height, i);

      }
  for ( int i = 300; i < width; i += 300) {
    line(i,0 , 0, i);
    line (i, height, width, i);
    
  }
  
//---------------------------------------------------------------
  //bottom wings
  ellipse (200, 160, 130, 125);
  ellipse (100, 160, 130, 125);


  //Top wings
  ellipse (210, 90, 130, 110);
  ellipse (90, 90, 130, 110);

  // wing ridges for the top
  fill (240, 176, 15);
  ellipse (95, 90, 100, 80);
  fill (240, 176, 15);
  ellipse (205, 90, 100, 80);
  
   //wing dots for the bottom
   fill (0);
  ellipse (190, 190, 35, 35);
  fill (20);
  ellipse (112, 190, 35, 35);
  
  //2nd pair
  fill (277, 141, 11);
  ellipse (75, 180, 20, 20);
  fill (277, 141, 11);
  ellipse (225, 180, 20, 20);
  
  
  //3rd pair
  fill (0);
  ellipse (50, 165, 10, 10);
  ellipse (250, 165, 10, 10);

  // butterfly's body
  fill (54, 51, 39);
  ellipse (150, 135, 40, 180);
  
rect ( btn_x, btn_y, btn_w, btn_h);
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

