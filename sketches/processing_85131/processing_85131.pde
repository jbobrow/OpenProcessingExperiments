
/*****************************************
* Header Title: Liz's Animated Monster
* my first animation
* Thank you Matt Richard for teaching this class! 
* Liz Seibert - 1/11/13
*****************************************/

// declare your variables here
int x, y;// will be used to reference the mouse position
int ellipse_diameter = 200;// this is the diameter of the ellispe. Change value to change ellipse diameter
boolean is_mouse_pressed = true;

// setup
void setup(){
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing, makes things look pretty
}

// draw
void draw(){
  // When planning out the sketch you must think back to front like a painting.
  // The first things that you draw will get overlapped by the later things
  
  // 1. turn all pixels on the screen black
  background(0);
  
  noStroke();// no outline

  // 2. Head - ellipse(x, y, width, height);
  fill(255, 25, 25);
  ellipse(250, 250, 450, 450);
  fill(255, 50, 50);
  ellipse(250, 250, 425, 425);
  fill(255, 75, 75);
  ellipse(250, 250, 400, 400);
  fill(255, 100, 100);
  ellipse(250, 250, 375, 375);
  fill(255, 125, 125);
  ellipse(250, 250, 350, 350);
  
  // 3. eyes - rect(x, y, width, height);
  
  fill(255, 75, 75);// outer eye
  ellipse(175, 200, 100, 100);
  ellipse(325, 200, 100, 100);
 
   fill(255, 100, 100);// outer eye
  ellipse(175, 195, 85, 85);
  ellipse(325, 195, 85, 85);
  
  fill(255, 125, 125);// outer eye
  ellipse(175, 190, 70, 70);
  ellipse(325, 190, 70, 70);
 
  fill(0);// black eye center
//stroke(0);//  eye color
  //strokeWeight(5);// thicker stroke to act as eye color
  ellipse(175, 185, 60, 60);
  ellipse(325, 185, 60, 60);
  
  noStroke();
  
   // 6. nostrils
    //fill(0);// white dot
    //ellipse(225, 280, 20, 10);
    //ellipse(275, 280, 20, 10);
    
    
  x = mouseX;
  y = mouseY;

 if ( x > 250 && y < 250) {
   
  fill(255);// white dot
  ellipse(185, 175, 10, 10);
  ellipse(335, 175, 10, 10);
  fill(0); // mouth 
  curve(0, -200, 150, 325, 350, 325, 500, 200);
  
 }
 
  if ( x > 250 && y > 250) {
   
  fill(255);// white dot
  ellipse(185, 195, 10, 10);
  ellipse(335, 195, 10, 10);
  fill(0); // mouth 
  curve(0, -200, 150, 325, 350, 325, 500, 200);
  
 }
 
  if ( x < 250 && y > 250) {
   
  fill(255);// white dot
  ellipse(165, 195, 10, 10);
  ellipse(315, 195, 10, 10);
  fill(0); // mouth 
  curve(0, 200, 150, 325, 350, 325, 500, -200);
  
 }

  if ( x < 250 && y < 250) {
   
    fill(255);// white dot
    ellipse(165, 175, 10, 10);
    ellipse(315, 175, 10, 10);
     fill(0); // mouth 
    curve(0, 200, 150, 325, 350, 325, 500, -200);
//  fill(0); // mouth 
//  curve(0, -200, 150, 325, 350, 325, 500, -200);
  
}

  if ( x < 250 && y < 250) {
   
    fill(255);// white dot
    ellipse(165, 175, 10, 10);
    ellipse(315, 175, 10, 10);
     fill(0); // mouth 
    curve(0, 200, 150, 325, 350, 325, 500, -200);

  
}

  
  if (is_mouse_pressed == false) {
  
  fill(255, 125, 125); //face
  ellipse(250, 250, 350, 350); 
  
  fill(255, 75, 75);// outer eye
  ellipse(175, 200, 100, 100);
  ellipse(325, 200, 100, 100);
 
   fill(255, 100, 100);// outer eye
  ellipse(175, 195, 85, 85);
  ellipse(325, 195, 85, 85);
  
  fill(255, 125, 125);// outer eye
  ellipse(175, 190, 70, 70);
  ellipse(325, 190, 70, 70);
  
  fill(255, 25, 25); //color field
  rect(0, 0, 500, 500);
  
  fill(0); // mouth 
  curve(0, -300, 150, 325, 350, 325, 500, -300);
  
  fill(0);// black eye center
  ellipse(175, 185, 60, 60);
  ellipse(325, 185, 60, 60);
  
  fill(255);// white dot
  ellipse(175, 185, 10, 10);
  ellipse(325, 185, 10, 10);
  
  }
  
// 5. teeth - ellipse(x, y, width, height);
  fill(255);// white
  rect(200, 325, 25, 15);
  rect(275, 325, 25, 15);
}



  
void mousePressed(){
 println("quit pressing me");
 if( is_mouse_pressed == true){
   is_mouse_pressed = false;
 }
 else if( is_mouse_pressed == false){
   is_mouse_pressed = true;
 }
 
}


