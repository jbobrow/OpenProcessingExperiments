
int btn_x = 340;
int btn_y= 40;
int btn_w= 45;
int btn_h= 15;
boolean btn_state = true;

void setup () {
  size (400,500);
  smooth ();
}
void draw () {

    if (btn_state == true) {
  }
  else {
   //speech bubble
fill(255);
ellipse(200, 140, 8, 8);
fill(255);
ellipse(222, 125, 10, 10);
fill(255);
ellipse(245, 110, 13, 13);
fill(255);
ellipse(260, 68, 86, 64);
fill(0);
text("Hello!", 238, 69);
    }
  
  rect(btn_x, btn_y, btn_w, btn_h);
  
  {
   float s = 100;
  while (s > 20){
    float c = map(s, 450, 10, 100, 0);
    colorMode(RGB);
    fill(c, 100, 53, 200);
    rect(mouseX, mouseY, s, s);
    s -= 20;
  rect(mouseX, mouseY, 50, 50);
  }

  }

{
  //arms
fill(0);
ellipse(60, 200, 82, 34);
fill(0);
ellipse(90, 200, 80, 36);
fill(0);
ellipse(195,200, 82, 34);
ellipse(170,200, 80, 36);

//legs
fill(0);
ellipse(85,360, 52, 134);
fill(255);
ellipse(85,410, 26, 12);
fill(0);
ellipse(170, 357, 52, 134);
fill(255);
ellipse(170, 410, 26, 12);

//body of bear
fill(255);
ellipse(128,266, 120, 200);
fill(255);
ellipse(128, 266, 66, 166);

//ears
fill(0);
ellipse(60, 42, 34, 43);
ellipse(188, 45, 34, 43);

//face
fill(255);
ellipse(125, 100, 150, 150);
fill(255);
ellipse(126, 142, 45, 25);

//eyes
fill(0);
ellipse(86, 75, 13, 40);
fill(255);
ellipse(85, 64, 6, 9);
fill(0);
ellipse(156, 75, 13, 40);
fill(255);
ellipse(155, 64, 6, 9);

//blush
fill(275, 0, 0, 45);
ellipse(75, 110, 20, 10);
ellipse(166, 110, 20, 10);

//nose
fill(0);
ellipse(125, 112, 12, 10);


stroke(4);
fill(255);
 text("CLICK THE BOX FOR A SPEECH BUBBLE TO APPEAR!", 25, 450);
}
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



