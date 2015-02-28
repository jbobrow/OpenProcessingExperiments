
// header
/******************************************
*  Processing Sketch Monster
*    
*  This is your first homework:
*  Make a monster like character
*  using simple shapes and color properties
*
*  Matt Richard 
******************************************/

// global variables


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
  
  // 1. turn all pixels on the screen orange
  background(#ED4102);
  
  // 2. Head - ellipse(x, y, width, height);
  stroke(0); //black
  fill(#F2CD90); //neutral skin tone
  ellipse(250, 250, 300, 400);
  
  // 3. left eye 
  fill(#2C2E2E); //dark gray eye 
  noStroke();
  ellipseMode(CENTER);
  ellipse(200,200,20,20);
  fill(#095A81); //blue eye center
  ellipse(200,200,7,7);
  //eyelid
  stroke(0);
  noFill();
  ellipse(200,200,40,20);
  //eyelash
  line(200,180,200,190);
  line(180,180,190,190);
  line(220,180,210,190);
  
  // 4. right eye 
  fill(#2C2E2E);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,200,20,20);
  fill(#095A81);
  ellipse(300,200,7,7);
  //eyelid
  stroke(0);
  noFill();
  ellipse(300,200,40,20);
  //eyelash
  line(300,180,300,190);
  line(280,180,290,190);
  line(320,180,310,190);
  
  // 5. cheeks
  fill(#FC978C); //pinkish
  noStroke();
  ellipseMode(CENTER);
  ellipse(170,325,40,40);
  ellipse(330,325,40,40);
  
  // 6. mouth 
  stroke(255,0,0); //red
  curve(200,350,240,360,260,360, 270,350);
  
  // 7. nose 
  stroke(0);
  noFill();
  line(250,200,230,300);
  line(230,300,250,300);
  
  // 8. hair
  fill(0);
  noStroke();
  quad(180,0,100,180,180,160,210,0);
  quad(200,0,190,160,260,160,250,0);
  quad(240,0,270,160,340,170,320,0);
  quad(300,0,350,170,400,200,380,0);
  
 }
