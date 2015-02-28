
// Example square filled with squares, each square is filled with a svg shape
// size of shape is modified by position of mouse pointer
// size increases when pointer goes to center of square

int y = 0;
float position = 0.0;
float scale0 = 400.0;
float scale = scale0;
float color_hue = 0;
float scale_old = scale0;
float random01;
float scale_diff = scale_old - scale;
float sq_size=50;
float shape_size=50;
float shape_pos=shape_size/2;
float xpos=0;
float ypos=0;
color color01 = color (random(255),random(255),random(255));
float color_s = random (200,255);
float color_b = random (200,255);
float color_s1 = random (200,255);
float color_b1 = random (255);
PShape m, m1, m2;
//
float mouseValue; 
float mouseFactor=1; // inreased by mouse position 
float mouseFactorDecrease = random(0.90,0.95); // decrease per step 
//

void setup() {
  size(400,400);
  background(255);
  // Slowing down the frame rate so we can easily see the effect.
  // frameRate(15); 
  stroke(255,122,122);
  
  // draw a square frame
  line(0,0,scale,0);
  line(0,scale,scale,scale);
  line(0,0,0,scale);
  line(scale,0,scale,scale);
 
  colorMode(HSB, 255);
  color c = color(color_hue,12,12);
  fill(c);
  
  // load shapes
  m = loadShape("ffleurdelis.svg");   //lade dein Bild
  m.disableStyle();
  m1 = loadShape("thickstar.svg"); 
  m1.disableStyle();
  m2 = loadShape("bass.svg"); 
  m2.disableStyle();
  shapeMode(CENTER);
  
  // draw shape once in big size
  // fill(100,0,0,10);
  // shape(m,625,175,300,300) ;

}

void draw() {
  // Draw a small square
  // xpos and ypos are increased by sq_size to fill the whole big square
  stroke(color01);
  color c = color(color_hue%255,color_s,color_b);
  fill (c);
  color_hue += 1;
  
  //draw squares
  
  scale_old = scale;
  scale -= sq_size;
  
  rect(xpos,ypos,sq_size,sq_size);
 
  // draw different shapes by random
    
  fill(random(255),color_s1,random(255));
  
  
  // calculate mouseFactor 
  mouseFactor = 10/( abs(mouseX-200) + abs(mouseY-200)+ .0001); 
  // and increase mouseValue by this factor
  mouseValue = mouseFactorDecrease*(mouseValue+mouseFactor); 
  //limit mouseValue to 1000
  if ( mouseValue > 1000 ) { 
      mouseValue = 1000; } 

  // draw a random shape
  random01 = random(100);
  if (random01 < 33 )
  {
  shape(m,xpos+shape_pos,ypos+shape_pos,shape_size*mouseValue,shape_size*mouseValue) ;
  }
  else if (random01 > 33 & random01 < 66 )
  {
  shape(m1,xpos+shape_pos,ypos+shape_pos,shape_size*mouseValue,shape_size*mouseValue) ;
  }
  else
  {
  shape(m2,xpos+shape_pos,ypos+shape_pos,shape_size*mouseValue,shape_size*mouseValue) ;
  }
    
  // increase values for xpos and ypos
  xpos = xpos + sq_size;
  // Reset xpos back to 0 when it gets to the border of the square
  if (xpos > scale0 ) {
    xpos = 0;
    ypos = ypos + sq_size;
   
  }
  
  // Reset ypos back to 0 when it gets to the border of the square
  if (ypos > scale0 ) {
    ypos = 0;
    
  }
  
}


