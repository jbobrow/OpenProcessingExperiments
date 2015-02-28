
/*abstraction flap
  
  created with processing 0135
  by rce12
  
  - click anywhere to paint
  - press spacebar to clear screen and painter
  
  my first work with ArrayList. I was use that to flexible 
  interaction [clicking anywhere, funky motion, etc.] and i was
  creating a unique-aquarel-monochrome painter where you cilickin
  at location.
*/

ArrayList flap;

void setup(){
  size(500,500);
  background(255);
  flap=new ArrayList();
  smooth();
}

void draw(){
  for(int a=0;a<flap.size();a++){
   flapper fp=(flapper)flap.get(a);
   fp.interact();
   fp.trail();
  }
}

void mousePressed(){
  //launch that
  flapper launch=new flapper();
  launch.x=mouseX;
  launch.y=mouseY;
  flap.add(launch);
}

void keyPressed(){
  //reset
  if(key==' '){
    background(255);
    flap.clear();
  }
}

