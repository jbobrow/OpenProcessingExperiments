
/*a simple interactive sketch that allows the user to modify it 
  when the mouse is clicked , that offers the possibility of a 
  snapshot and to modify the stroke .
*/

// global variables
color strokeC = color(141, 24);
int st = 1;

//setup
void setup() {
   
size(800, 600);
background(0);
 
}

// draw with mouse interaction 
void draw() {
  if (mousePressed){ 
    fill(0);
    rect(0,0,width,height);
    int d = mouseY*2 - mouseX/2;
    for (int x = 0; x<=width; x+=50){
      for(int y = 0; y<= height; y+=50){
        noFill();
        strokeWeight(st);
        stroke(strokeC);
        ellipse(x, y, d, d);
      } 
    }
  } 
}

//key interaction
void keyReleased(){
  if (key == 's' || key == 'S') saveFrame("screenshot.png") ;
  switch (key){
    case '1':
      st = 2;
      break;
    case '2':
      st = 5;
      break;
    case '3':
      st = 10;
      break;
  }
}

