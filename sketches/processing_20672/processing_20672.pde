
//circle button 1
int btn1= 50;
int btn2= 50;
int btn3= 200;
int btn4= 200;
//circle button 2
int btna= 170;
int btnb= 250;
int btnc= 200;
int btnd= 200;

boolean on = false;      //  either true or false

void setup() {
    size(400, 400);
}

void draw() {
  if ( on == true) fill (255);
  else fill(150,45,20);
  strokeWeight(50);
  ellipse(btn1,btn2, btn3, btn4);
  //
   if ( on == false) fill (255);
  else fill(0,45,20);
  strokeWeight(50);
  ellipse(btna,btnb, btnc, btnd);
  
}
void mouseClicked(){
    if (mouseX > btn1 && mouseX  < btn1 + btn3  && mouseY> btn2 && mouseY< btn2 +btn4) {
       on = !on; 
  ///////
    if (mouseX > btna && mouseX  < btna + btnc  && mouseY> btnb && mouseY< btnb +btnd) {
       on = !on;   
       
    }
    }
}


