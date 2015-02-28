
/*felix anderson
homework assignment week 3
creative computing B
benjamin bacon 
*/





int moon = 100;



char previous;
void setup() {
  size(600, 600);
  
}

void draw() {
  background(300);
  if ( mouseX < 300 ) {
      background(0);
    } else {
      background(300);
    }
  ellipse (100,800-moon,100,100);
  
  
  if ( mousePressed ) {
    moon = moon + 1;
  }
     
}

/* Goal for this assignment that I wanted to do was to make a 
a moon rise by pressing on the mouse or clicking. I tried to make
an effect where if the moon got to a certain height/pixel, the 
background would change color for the sky. But since I couldn't
figure that out I used the mouseX background change.*/



