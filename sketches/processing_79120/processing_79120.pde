
void setup() {
  size(200,200); //set the size of the window
  smooth(); //draw with smooth edges
  frameRate(30); // set framerate
}
void draw()
{if(mouseX < width/2){ //if mouse is on the left side of the screen the background will be pink
  background (133,15,87); 
} else {  
  background(133,15,149);//if mouse is on the right side of the screen the background will be purple
}//
   
   //set ellipses to CENTER mode
   ellipseMode(CENTER);
   
   //draw the large circle's in bear's ears
   stroke(0);
   if(mouseX < width/2) { //if the mouse is on the outside left side of the screen the circles will be dark brown
     fill(137,96,47);
   } else {
     fill(193,139,72);//if the mouse is in the left side of the screen the circles will be light brown
   }
   ellipse(mouseX,mouseY,40,40);// the ears will follow the location of the mouse
   ellipse(mouseX-80,mouseY,40,40);
   
   //draw the small circle in bear's ears
   noStroke();
   if (mouseX < width/2) {// if the mouse is on the left side if the screen the circles will be light brown
     fill(193,139,72);
   } else {
     fill(137,96,47);// if the mouse is on the right side of the screen the circles will be dark brown
     }
   ellipse(mouseX,mouseY,30,30);//the ears will follow the location of the mouse
   ellipse(mouseX-80,mouseY,30,30);
   
   //draw bear's head
   stroke(0);
   if (mouseX < width/2) { // if the mouse is on the left side of the screen the head will be ark brown
     fill(137,96,47);
   } else {
     fill(193,139,72); // if the mouse is on the right side of the screen the head will be light brown
   }
   ellipse(mouseX-40,mouseY+40,90,90); // the bear's head will follow the location of the mouse
   
   //draw the white in bear's eyes
   noStroke();
   fill(255);
   ellipse(mouseX-60,mouseY+30,20,30);
   ellipse(mouseX-20,mouseY+30,20,30);// bear's eyes will follow the location of the mouse
   
   //draw the pupils in bear's eyes
   stroke(0);
   fill(0);
   ellipse(mouseX-60,mouseY+30,10,10);
   ellipse(mouseX-20,mouseY+30,10,10);// bear's eyes will follow the location the mouse
   
   //draw the circle on bear's face
   noStroke();
   if (mouseX < width/2) { // if the mouse is on the left side of the screen the circle will be light brown
     fill (193,139,72);
   } else {
     fill (137,96,47);// if the mouse is on the right side of the screen the circle will be dark brown
   }
     
   ellipse(mouseX-40,mouseY+50,50,50); // the bear's mouth will follow the loaction of the mouse
  
  //draw bear's nose
   stroke(0);
   fill(0);
   ellipse(mouseX-40,mouseY+40,10,10);// the bear's nose will follow the location of the mouse
   
   //draw bear's mouth
   stroke(0);
   line(mouseX-40,mouseY+40,mouseX-40,mouseY+60);
   line(mouseX-40,mouseY+60,mouseX-50,mouseY+70);
   line(mouseX-40,mouseY+60,mouseX-30,mouseY+70);//  the bear's mouth will follow the location of the mouse

}
