
color button1 = #F42149;
color button2 = #A621F4;
color button3 = #21A4F4;
color button4 = #21F457;
color button5 = #FC0606;
color button6 = #443B60;
color button7 = #FFF752;
color button8 = #FF9100;
color penColor = #000000;

float r;
float g;
float b;
float a;


int thick =1;


float oldX, oldY;
float diam;
float x;
float y;
float ellSize;
 
 
void setup () {
  size(1000,800);
  smooth();
  background (255);
  
}
 
void draw () {
  noStroke();
  
  //button one - blue
    fill (button1);
    rect (10,10,20,20);
  //button two - red
    fill(button2);
    rect (10,30,20,20);
  //button three - green
    fill (button3);
    rect (10,50,20,20);
  //button four - black
    fill (button4);
    rect (10,70,20,20);
  //button five -white
    fill(button5);
    rect(10,90,20,20);
  //button six
    fill(button6);
     rect(10,110,20,20);
  //button seven
    fill(button7);
    rect(10,130,20,20);
  //button eight
    fill(button8);
    rect(10,150,20,20);
    
  //seeing where mouse is when pressed
  if (mousePressed && mouseButton == LEFT) {
    if (mouseX<30 && mouseX>10) {
      if (mouseY<30 && mouseY>10) {
        penColor = button1;
        ellSize = 0;
        thick=5;
      }
      else if (mouseY<50 && mouseY>30) {
        penColor = button2;
        ellSize = 0;
        thick=5;
      }
      else if (mouseY<70 && mouseY>50) {
        penColor = button3;
        ellSize = 0;
        thick=5;
      }
      else if (mouseY<90 && mouseY>70) {
        penColor = button4;
        ellSize = 0;
        thick=5;
      }
      else if (mouseY<110 && mouseY>90) {
        penColor = button5;
        ellSize = 0;
        thick=5;
      }
       else if (mouseY<130 && mouseY>110) {
        penColor = button6;
        ellSize = 0;
        thick=5;
      }
       else if (mouseY<150 && mouseY>130) {
        penColor = button7;
        ellSize = 0;
        thick=5;
      }
       else if (mouseY<170 && mouseY>150) {
         
        penColor = button8;
        ellSize = 0;
        thick=5;
      }

  }
  //Line Qaulity
    stroke (penColor);
    strokeWeight (thick);
   
    fill(r,g,b,a);
      r= random(255);
      g= random(255);
      b= random(255);
      a= random(255);
      
    ellipse(mouseX,mouseY,ellSize,ellSize);//
  ellSize++;//oncebigger than 100 set it back to zero,loop
  if(ellSize>95){
    ellSize = 0;
    
    line (oldX, oldY, mouseX, mouseY);
  }
  }
  
  //Clear screen
  
  if(mousePressed && mouseButton == RIGHT) {
   background(255);
  }
  oldX = mouseX;
  oldY = mouseY;

}

