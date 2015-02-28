
//Problem Set 2
//Question 5
//Natalie DeCoste 

Kid a;

void setup() {
  size (400, 400);
  smooth();
  a = new Kid(200,200);
}


 int eye = 78;
 int pupil1 = 20;
 int pupil2 = 30;
 int smcircle = 15;
 int icecream = 22; 

void draw () {
  background (106,19,99);
  a.display();
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

// body 
 fill(44,116,229);
 rect(180, height/2, 50, 120); 

//head 
 noStroke();
 fill(252, 217, 171);
 ellipse( width/2, 150, 170, 170); 

 //left eye
 fill(255);
 ellipse(160, 150, eye, eye);
 
 //right eye
 translate (80, 0);
 ellipse(160, 150, eye, eye);
 
 popMatrix();
 pushMatrix();
 
 //left pupil
 fill(0);
 ellipse (160, 150, pupil1, pupil1);
 
 //right eye
 translate (80, 0); 
 ellipse (160, 150, pupil2, pupil2);
 
 //mouth
 popMatrix();
 noStroke();
 fill(149, 8, 8);
 ellipse(240, 210, pupil1, pupil1);
 
 //left hand 
 fill(252, 217, 171);
 ellipse(width/2 -20, 260, smcircle, smcircle); 
 
 //right arm
 stroke(0);
 fill(44,116,229);
 rect(width/2 + 30, 260, 20, 10);
 
 //right hand 
 noStroke();
 fill(252, 217, 171); 
 ellipse(width/2 +53, 263, smcircle, smcircle);
 
 //cone
 stroke(0);
 fill(149,76,8);
 triangle(width/2+55, 270, width/2 + 50, 250, width/2+ 60, 250);
 
 //icecream
 noStroke();
 fill(mouseX, mouseY, 0, 255);
 ellipse(width/2 +55, 239, icecream, icecream);
 
 //left foot
 fill(252, 217, 171);
 ellipse(width/2 -6, 320, smcircle, smcircle);
 
 //right foot
 fill(252, 214, 171); 
 ellipse( width/2 + 18, 320, smcircle, smcircle);
 
 
   }

}

