
/*
setup(): 
    
      sets up the window and original background
*/

void setup() 
{
 background(#00ffff);
  size(400,400);
  frameRate(10);
}
 
/*

   draw_grass_and_sky():
   
      draws the blue sky and green grass
*/
 void draw_grass_and_sky()
{
background(#00ffff);

 // draw grass
  fill(#00ff00);
  rect(0,310,400,400);
}

/*

   makePerson():
   
      draws the person
*/
 void make_stickMan() {

if(random(100) > 50) {
  
  offset = -20;
  
  }
  
  else {
  
  offset = 0;
  
  }

 fill(#000000);
 
  // draw head
  ellipse(50, 280 + offset, 10, 10);
  
  // draw body
  line(50,285  + offset, 50,310  + offset);
  
  // draw right leg
  line(50,310  + offset, 55,325  + offset);
  
  // draw left leg
  line(50,310  + offset, 45,325  + offset); 
  
  // draw right arm
  line(50,290  + offset, 65,285  + offset);
  
  // draw left arm
  line(50,290  + offset, 45,305  + offset);
}


void draw() { 
 background(#00ffff);
 
draw_grass_and_sky();
make_stickMan();
}
