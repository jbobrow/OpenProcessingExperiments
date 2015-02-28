
// Copyright 2014 Jacklynn Pham
// HW 4
// keypress tweaked from Shannon Impellicceiri

float x,y,wd,ht;
float xdist,ydist;
int fish;

void setup(){
  size(400,400);
  float x,y,wd,ht;
  smooth();
  fish = 0;
}

void draw(){
cursor(CROSS);
noStroke();
fill(0,20);
rect(0,0,width,height);
  xdist = mouseX-x;
  ydist = mouseY-y;  
  x=x+ xdist*.05;
  y=y + ydist*.05;

  wd = 30;
  ht = 30;

  xdist = mouseX-x;
  ydist = mouseY-y;

  //fish
switch(fish) {
  case 0:
  ///fish regs
  fill(#ED8C16);
  ellipse( x+wd, y, wd*2.75, ht*1.95);
  triangle( (x+wd), y, (x-wd), (y+ht), (x-wd), (y-ht));
  stroke(200, 0, 0);
  break;
   case 1:
  ///fish 2x
  fill(#ED8C16);
  ellipse( x+wd*2, y, (wd*2)*2.75, (2*ht)*1.95);
  triangle( (x+wd*2), y, (x-wd*2), (y+ht*2), (x-wd*2), (y-ht*2));
  stroke(200, 0, 0);
  break;
     case 2:
  ///fish 2x
  fill(#ED8C16);
  ellipse( x+wd*3, y, (wd*3)*2.75, (3*ht)*1.95);
  triangle( (x+wd*3), y, (x-wd*3), (y+ht*3), (x-wd*3), (y-ht*3));
  stroke(200, 0, 0);
  break;
       case 3:
  ///fish 2x
  fill(#ED8C16);
  ellipse( x+wd*4, y, (wd*4)*2.75, (4*ht)*1.95);
  triangle( (x+wd*4), y, (x-wd*4), (y+ht*4), (x-wd*4), (y-ht*4));
  stroke(200, 0, 0);
  break;
}
  
} // end draw function


////MousePressed changes background color
  void mousePressed()
  {
 background( random( 255),random( 255),random( 255) ); 
  }//end mousePressed
  
  
///Mouse moved makes fish change color
  void mouseMoved() {
    noStroke();
  fill (random( 255),random( 255),random( 255) );
  ellipse( x+wd, y, wd*2.75, ht*1.95);
  triangle( (x+wd), y, (x-wd), (y+ht), (x-wd), (y-ht));
  stroke(200, 0, 0);
  }
  
//// keyPressed
//Up arrow increases size of fish, down arrow decreases fish

void keyPressed(){
  if (key == CODED && keyCode == UP) {
    fish++;
  } else if (key == CODED && keyCode ==DOWN) {
   fish--;
  } else {
   fish = 0; 
  }
  //fish size section outside of bounds
   if(fish == -1){
    fish = 4;
  }else if(fish == 5){
    fish = 0;
  }
}

/// I don't have a mouse wheel :(




