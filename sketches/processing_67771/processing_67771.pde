
void setup (){
 size (500, 500);
 smooth ();
}
 
void draw (){
 background (#000000);
 println(mouseX + "," + mouseY); 
 fill (255, 255, 255);
 stroke(0, 0, 0);
 ellipse (43, 38, 10, 13);
 ellipse (378, 276, 200, 200);
 ellipse (0, 0, 0, 227);
 ellipse (60, 145, 100, 100);
 //ground
 fill (#432D00);
 stroke (#432D00);
 rect (250,400,500,250);
 //body
 fill (50, 0, 255);
 stroke (0, 0, 0);
 rectMode (CENTER);
 rect(250, 250, 50, 200);
 //face
 fill (50, 0, 255);
 ellipse (251, 150, 100, 100);
 //left arm
 ellipse (175, 243, 100, 20);
 //right arm
 ellipse (325, 243, 100, 20);
 fill (0, 255, 0);
 //eyes
 ellipse (228, 150, 30, 70);
 ellipse (275, 150, 30, 70);
 fill (0, 0, 0);
 ellipse (275, 150, 10, 30);
 ellipse (228, 150, 20, 40);
 //legs
 stroke (255,0,0);
 line (375, 449, 275, 349);
 line (224, 351, 124, 451);
 }
  

