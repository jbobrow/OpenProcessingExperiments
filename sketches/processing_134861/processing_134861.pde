
//Diego Rodriguez, Week-3_part-2, CC Spring 14, Rory S.
//week3_part2


void setup() { 
    size(400, 400); 
    smooth(); 
    stroke(0, 102); 
    
  } 
  void draw() 
  { 
    // lerpColor from sepia to pitchblack
   
    color sepia = color(255,255,204,200);
    color pitchBlack = color(44,43,44,200);
    
    float amt = map( mouseX, 0,width, 0,1 );
    color c = lerpColor( sepia, pitchBlack, amt );
    background(c);
    
    

 
 // mouseX - mouseY - pmouseX - pmouseY - map - float
 
 float circ_y = map(mouseY,0,height, 100,300);
  ellipse( 200,circ_y, 20,20 );
  int circ_x = round( map(mouseX, 0,width, width,0) );
  ellipse( circ_x,200, 100,100 );
  float r =  map(mouseX, 0,width, 0,255);
  fill(c);
  
  
  
  }
  
  


