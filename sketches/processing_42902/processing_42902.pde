
float dia = 100;
float x = dia/2;
float speed = 4;
float col = 0;
float colChange = speed-1;

void setup() {

  size (600, 600);
  smooth();
}

void draw () {

  background(255);

  x = x + speed;
  col = col + colChange ;


/* when I make the dia rabdom, circle sometimes 
changed direction after wall. why??*/

  dia = dia + random(-2, 2);

  fill (0, 0, col);
  ellipse (x, mouseY, dia, dia);


  if (x > width-dia/2 || x < dia/2) {
    speed = speed* -1;
  }

  if (x > width-dia/2 || x < dia/2) {
    colChange = colChange* -1;
  }
}
  void mousePressed (){
    speed = speed * -1;
    
  }
    
 /* I want to make it go faster when  press any key
 yet I don't know how to assign specific funtions to key [pressed.
 */
  
    




