
//Diabetic Rabbits Scribbler - First Version, Basic
//The colour Keys are as follows:
//Z=Black
//X=Red
//C=Blue
//V=Yellow
//B=Green
//Enjoy X_X

void setup() {
 size(640, 350); 
 noStroke();
}

void draw() {
 if(mousePressed) {
   ellipse(mouseX, mouseY, 5 , 5);
 }
}

void keyPressed() 
{
 if ( key == 'z' ) {
   fill(0, 0, 0);
 }
 if (key == 'x' ) {
   fill(255, 0, 0);
 }
   if (key == 'c' ) {
   fill(0, 0, 255);
   }
     if (key == 'v' ) {
   fill(255, 255, 0);
     }
     if(key == 'b' ) {
       fill(38, 127, 0);
     }
}



