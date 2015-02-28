
//Artistic Description:
// For this assignment I have to be honest I was trying to do 
// something completely different.
// It was a wonderful accident after long hours of work. 
// I can't complain.

//Press the Mouse button and it Draws.
//Press 1, 2, or 3 for different colors.
//To erase press backspace or delete.
//Once you erase the background color changes to black.
//To save your work press S.

color strokeColor = color(0,25);

void setup() {
  size(1200,600);
  background(255);
}

void draw(){
  for ( float i=0; i<=width; i = i + 200){
    for ( float j=0; j<=height; j= j +300){
      if (mousePressed){
        noFill();
        stroke(strokeColor);
        strokeWeight(.005);
        bezier(mouseX,mouseY, j+20 , i+20 , mouseY+i , mouseX-j ,i,j);
      }
    }
  }
}
void keyReleased(){
  if ( key ==DELETE || key == BACKSPACE) background(0);
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
  
  switch (key){
    case '1':
      strokeColor = color(255,0,0,50);
      break;
    case '2':
      strokeColor = color(0,255,255,75);
      break;
    case '3':
      strokeColor = color(0,255,0,50);
      break;
  }
}

