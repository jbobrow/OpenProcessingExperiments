
int theShape = 0;
int theColor = 0;
color[] colors = { 
  color(26,0,0,100), color(255,255,0,100), color(0,255,0,100), color(0,0,255,100) };

void setup (){ 
  size (400,600); 
  background (255); 
  smooth ();
  stroke(0,0,0,5); 
  strokeWeight(5);
} 

void draw (){
  if (mousePressed) {
  fill( colors[theColor] );
  switch( theShape ){
  case 0:
  default:
    rect(mouseX,mouseY,60,60);
    break;
  case 1:
    rect(mouseX-30, mouseY-30,60,60);
    break;
  case 2:
    beginShape(ELLIPSE);
    vertex(mouseX+50, mouseY+50);
    vertex(pmouseX-20, pmouseX-20);
    vertex(mouseX-20, mouseY-20);
    endShape();
    break;
  case 3:
    rect(mouseX, mouseY-20,20,60);
    rect(mouseX-20, mouseY,60,20);
    break;
  } 
} 
}

void keyPressed () {
  if( key==CODED ){
    if( keyCode == UP ){ 
      theShape=(theShape+1)%4; 
    }
    if( keyCode == DOWN ){ 
      theShape=(theShape+3)%4; 
    }
    if( keyCode == LEFT ){ 
      theColor=(theColor+1)%4; 
    }
    if( keyCode == RIGHT ){ 
      theColor=(theColor+3)%4; 
    }
  }
    if( key == DELETE ){
      background(255);
    }
}


