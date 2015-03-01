
void setup() {
 size (700, 700);
}

void shape1(){
  ellipse (120, 120, 30, 30);

fill (23, 249, 255);//color body
rect (150, 130, 130, 200);//body

fill (240, 114, 202);//base of arms
rect (105, 200, 45, 20);//upper left arm
rect (280, 200, 45, 20);//upper right arm

fill (165, 125, 242);
rect (305, 220, 20, 80);//base right arm
rect (105, 120, 20, 80);//base left arm

fill (44, 245, 79);//
ellipse (180, 175, 30, 30);//left eye
ellipse (250, 175, 30, 30);//right eye
}
void shape2() {

fill (10, 10, 500);//left leg
rect (175, 330, 30, 40);//left leg

fill (10, 500, 10);//right leg
rect (220, 330, 30, 40);//right leg

fill (184, 245, 44);//full hat
rect (179, 50, 70, 60);//top part of hat
rect (160, 90, 110, 40);//base of hat
}

void draw (){
background (450);
shape1();
translate (mouseX, mouseY);
shape2();
}



