
//Problem Set 2
//Question 6
//Natalie DeCoste 

Kid a;
Kid b;

void setup() {
  size (800, 800);
  smooth();
  a = new Kid (150, 50);
  b = new Kid (-100, 50);
}

 int eye = 78;
 int pupil1 = 20;
 int pupil2 = 30;
 int smcircle = 15;
 int icecream = 22; 

void draw () {
  background (106,19,99);
  a.display();
  b.display(); 
}
class Kid { 
  float x;
  float y;
  Kid (float x, float y) {
    this.x =x;
    this.y = y;
  }

   void display() {
     pushMatrix();
     translate(x,y);
     
rectMode(CENTER);
ellipseMode(CENTER); 

// body 
stroke(0);
 fill(44,116,229);
 rect(400, height/2, 50, 120); 

//head 
 noStroke();
 fill(252, 217, 171);
 ellipse(400, 258, 170, 170); 

 //left eye
 fill(255);
 ellipse(360, 250, eye, eye);
 
 //right eye
 translate (80, 0);
 ellipse(360, 250, eye, eye);

 
 //left pupil
 fill(0);
 ellipse (280, 250, pupil1, pupil1);
 
 //right pupil 
 translate (80, 0); 
 ellipse (280, 250, pupil2, pupil2);
 
 //mouth
 noStroke();
 fill(149, 8, 8);
 ellipse(290, 310, pupil1, pupil1);
 
 //left hand 
 fill(252, 217, 171);
 ellipse(210, 370, smcircle, smcircle); 
 
 //right arm
 stroke(0);
 fill(44,116,229);
 rect(275, 370, 20, 10);
 
 //right hand 
 noStroke();
 fill(252, 217, 171); 
 ellipse(290, 370, smcircle, smcircle);
 
 //cone
 stroke(0);
 fill(149,76,8);
 triangle(290, 375, 280, 355, 300, 355);
 
 //icecream
 noStroke();
 fill(mouseX, mouseY, 0, 255);
 ellipse(290, 350, icecream, icecream);
 
 //left foot
 fill(252, 217, 171);
 ellipse(230, 462, smcircle, smcircle);
 
 //right foot
 fill(252, 214, 171); 
 ellipse( 250, 462, smcircle, smcircle);
 popMatrix();
 
   }

}

