
/// Created for psg (pedro_gomes6987@hotmail.com) 
///
/// Original request:
/// "
/// I have a square and wanted him
/// move with a finger
/// rotate with two fingers
/// And zoom with 4 fingers
/// Someone could make me an example of these!?
/// "
///
/// I put a face on the square too, to keep it from being boring. (BONUS FEATURE!)
///
/// Directions for use:
/// Click to add an aditional finger.
/// If you click with four fingers, you go back to 0 fingers.
/// Move the mouse about to do things, depending on how many fingers you are using.
/// Using 0 fingers does nothing.
/// Using 1 finger allows you to move the square.
/// Using 2 fingers allows you to rotate the square (clockwise is best).
/// Using 3 fingers allows you to recolor the square. (BONUS FEATURE!) 
/// Using 4 fingers allos you to zoom the square. Horizontal for bigger, vertical for smaller.
///
/// KNOWN ISSUE: The color can be a little jumpy at times. I'd like it to transition better.

int fingers = 0;
int sx = 150, sy = 150;
float sr = 0.0;
float ss = 3.0;
int sb = 200;
boolean goup = true;
color sc = color(200);

void setup(){
  size(300,300);
  noCursor();
  smooth();
}

void draw(){
  background(0);
  if( fingers == 1 ){
    sx = sx + mouseX - pmouseX;
    sy = sy + mouseY - pmouseY;
  }   
  if( fingers == 2 ){
    sr = sr + ( 0.01 * ( abs( mouseX - pmouseX)  + abs ( mouseY - pmouseY) ) ); 
  }
  if( fingers == 3 ){
    if( (mouseX != pmouseX) || (mouseY != pmouseY)){
      if( goup ){
        sb++;
        if(sb >= 255 ){
          goup = false;
        }
      } else {
      sb--;
        if(sb <= 0 ){
          goup = true;
        }  
      }
      sc = color( 255* mouseX / width, 255* mouseY / height, sb);
    }
  }
  if( fingers == 4 ){
    ss = ss + ( 0.01 * ( abs( mouseX - pmouseX)  - abs ( mouseY - pmouseY) ) ); 
  }
  sx = constrain(sx, 0, width);
  sy = constrain(sy, 0, height);
  drawSquare();
  drawhand();
}

void drawSquare(){
  pushMatrix();
  translate(sx, sy);
  scale(ss);
  rotate(sr);
  fill(sc);
  noStroke();
  rect(-20,-20,40,40);
  fill(255);
  stroke(0);
  ellipse( -10, -10, 10, 10);
  ellipse( 10, -10, 10, 10);
  fill(0);
  ellipse( -10, -10, 5, 5);
  ellipse( 10, -10, 5, 5);
  line(0,-6,-3,0);
  line(-3,0,3,0);
  ellipse( 0, 10, 30, 5);
  noStroke();
  popMatrix();
}

void drawhand(){
  fill(color(200,200,100));
  rect(mouseX-5,mouseY-5, 11,14);
  rect(mouseX-8, mouseY-5, 2, 14);
  rect(mouseX-8, mouseY+3, 5, 6);
  if( fingers > 0){
    rect(mouseX-5, mouseY-15, 2, 10);
  }
  if( fingers > 1){
    rect(mouseX-2, mouseY-17, 2, 12);
  }
  if( fingers > 2){
    rect(mouseX+1, mouseY-15, 2, 10);
  }
  if( fingers > 3){
    rect(mouseX+4, mouseY-13, 2, 8);
  }

}

void mouseClicked(){
  fingers++;
  if( fingers == 5 ){ 
    fingers = 0; 
  } 
}



