
boolean button = false;
boolean button2 =false;
boolean button3 =false;
boolean button4 =false;

int w=100;
int h=-30;

int w2=100;
int h2=-50;

int w3=150;
int h3=-50;

int w4=125;
int h4=-50;
int speed=1;



void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(200);  
  
//Shadows
  fill(200);
  //top
  if (mouseX>80 && mouseX<120 && mouseY>100 && mouseY<130) {
  quad(w,130,w-25,115,w,100,w+25,115);
  //left
} else if (mouseX>60 && mouseX<=80 && mouseY>115 && mouseY<145) {
  quad(w-25,145,w-50,130,w-25,115,w,130);
  //front
} else if (mouseX>80 && mouseX<120 && mouseY>130 && mouseY<160) {
  quad(w,160,w-25,145,w,130,w+25,145);  
  //right
} else if (mouseX>=120 && mouseX<160 && mouseY>115 && mouseY<145) {
  quad(w+25,145,w,130,w+25,115,w+50,130);  
  
}
  
//SQUARE CHARACTER BACK
//right side
  stroke(225);
  fill(60,180,220);
  quad(w,h,w,h+30,w+25,h+15,w+25,h-15);
//left side 
  fill(20,40,80);
  quad(w,h,w,h+30,w-25,h+15,w-25,h-15);
//top side
  fill(20);
  quad(w,h,w-25,h-15,w,h-30,w+25,h-15);
  
  // Only move the square when "button" is true
  if (button) {
    h = h + speed;
//stops the square    
  if (h>100) {
   h=-50;
  }
  }  
  
  //SQUARE CHARACTER LEFT
//right side
  stroke(225);
  fill(60,180,220);
  quad(w2-25,h2+15,w2-25,h2+30+15,w2+25-25,h2+15+15,w2+25-25,h2-15+15);
//left side 
  fill(20,40,80);
  quad(w2-25,h2+15,w2-25,h2+45,w2-50,h2+30,w2-50,h2);
//top side
  fill(20);
  quad(w2-25,h2+15,w2-50,h2,w2-25,h2-15,w2,h2);
  
    // Only move the square when "button2" is true
  if (button2) {
    h2 = h2 + speed;
//stops the square    
  if (h2>100) {
   h2=-50;
  }
  }
  
//SQUARE CHARACTER RIGHT
//right side
  stroke(225);
  fill(60,180,220);
  quad(w3-25,h3+15,w3-25,h3+30+15,w3+25-25,h3+15+15,w3+25-25,h3-15+15);
//left side 
  fill(20,40,80);
  quad(w3-25,h3+15,w3-25,h3+45,w3-50,h3+30,w3-50,h3);
//top side
  fill(20);
  quad(w3-25,h3+15,w3-50,h3,w3-25,h3-15,w3,h3);
  
    // Only move the square when "button3" is true
  if (button3) {
    h3 = h3 + 1;
//stops the square    
  if (h3>100) {
   h3=-50;
  }
  }
  
  
//SQUARE CHARACTER FRONT
//right side
  stroke(225);
  fill(60,180,220);
  quad(w4-25,h4+15,w4-25,h4+30+15,w4+25-25,h4+15+15,w4+25-25,h4-15+15);
//left side 
  fill(20,40,80);
  quad(w4-25,h4+15,w4-25,h4+45,w4-50,h4+30,w4-50,h4);
//top side
  fill(20);
  quad(w4-25,h4+15,w4-50,h4,w4-25,h4-15,w4,h4);
  
    // Only move the square when "button3" is true
  if (button4) {
    h4 = h4 + speed;
//stops the square    
  if (h4>115) {
   h4=-50;
  }
  }
  
  
    
  
  
  }
  
  
void mousePressed() {
  //back
  if ((mouseX > 80) && (mouseX < 120) && (mouseY > 100) && (mouseY < 130)) {
    button = !button;}
    //left
  else if ((mouseX > 60) && (mouseX < 80) && (mouseY > 115) && (mouseY < 145)) {
    button2 = !button2;} 
    //right
   else if ((mouseX > 120) && (mouseX < 160) && (mouseY > 115) && (mouseY < 145)) {
    button3 = !button3;}    
    //front
   else if ((mouseX > 80) && (mouseX < 120) && (mouseY > 130) && (mouseY < 160)) {
    button4 = !button4;}   
    
}





