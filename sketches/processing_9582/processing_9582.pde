
/*
A recreation of Frank Stella's 'Fez' + some 'movement'

By Diana Klatt
2010
*/


color mustardYellow, seafoamGreen;
int rWidth, rHeight;

void setup(){
  size(500, 500);
  smooth();
  
  colorMode(HSB, 360);
  stroke(360);
  mustardYellow = color(37, 260, 360);
  seafoamGreen = color(151, 350, 250);

  rWidth = width/20;
  rHeight = height/20;
}


void draw() {
  background(mustardYellow);
  fill(seafoamGreen);
  
  // top left
  quad(0, 0,
       0, rHeight,
       rWidth, 0,
       0, 0);
  quad(0, 2*rHeight,
       0, 3*rHeight,
       3*rWidth, 0,
       2*rWidth, 0);
  quad(0, 4*rHeight,
       0, 5*rHeight,
       5*rWidth, 0,
       4*rWidth, 0);
  quad(0, 6*rHeight,
       0, 7*rHeight,
       7*rWidth, 0,
       6*rWidth, 0);
  quad(0, 8*rHeight,
       0, 9*rHeight,
       9*rWidth, 0,
       8*rWidth, 0);
  // inner cross
  quad(0, 10*rHeight,
       rWidth, 10*rHeight,
       10*rWidth, rHeight,
       10*rWidth, 0);
  quad(2*rWidth, 10*rHeight,
       3*rWidth, 10*rHeight,
       10*rWidth, 3*rHeight,
       10*rWidth, 2*rHeight);
  quad(4*rWidth, 10*rHeight,
       5*rWidth, 10*rHeight,
       10*rWidth, 5*rHeight,
       10*rWidth, 4*rHeight);
  quad(6*rWidth, 10*rHeight,
       7*rWidth, 10*rHeight,
       10*rWidth, 7*rHeight,
       10*rWidth, 6*rHeight);
  quad(8*rWidth, 10*rHeight,
       9*rWidth, 10*rHeight,
       10*rWidth, 9*rHeight,
       10*rWidth, 8*rHeight);
       
  // top right
  quad(19*rWidth, 0,
       18*rWidth, 0,
       width, 2*rHeight,
       width, rHeight);
  quad(17*rWidth, 0,
       16*rWidth, 0,
       width, 4*rHeight,
       width, 3*rHeight);
  quad(15*rWidth, 0,
       14*rWidth, 0,
       width, 6*rHeight,
       width, 5*rHeight);
  quad(13*rWidth, 0,
       12*rWidth, 0,
       width, 8*rHeight,
       width, 7*rHeight);
  quad(11*rWidth, 0,
       10*rWidth, 0,
       width, 10*rHeight,
       width, 9*rHeight);
  // inner cross
  quad(10*rWidth, rHeight,
       10*rWidth, 2*rHeight,
       18*rWidth, 10*rHeight,
       19*rWidth, 10*rHeight);
  quad(10*rWidth, 3*rHeight,
       10*rWidth, 4*rHeight,
       16*rWidth, 10*rHeight,
       17*rWidth, 10*rHeight);
  quad(10*rWidth, 5*rHeight,
       10*rWidth, 6*rHeight,
       14*rWidth, 10*rHeight,
       15*rWidth, 10*rHeight);
  quad(10*rWidth, 7*rHeight,
       10*rWidth, 8*rHeight,
       12*rWidth, 10*rHeight,
       13*rWidth, 10*rHeight);
  quad(10*rWidth, 9*rHeight,
       10*rWidth, 10*rHeight,
       10*rWidth, 10*rHeight,
       11*rWidth, 10*rHeight);

  // bottom left
  quad(0, 19*rHeight,            
       0, 18*rHeight,
       2*rWidth, height,
       rWidth, height);
  quad(0, 17*rHeight,
       0, 16*rHeight,
       4*rWidth, height,
       3*rWidth, height);
  quad(0, 15*rHeight,
       0, 14*rHeight,
       6*rWidth, height,
       5*rWidth, height);
  quad(0, 13*rHeight,
       0, 12*rHeight,
       8*rWidth, height,
       7*rWidth, height);
  quad(0, 11*rHeight,
       0, 10*rHeight,
       10*rWidth, height,
       9*rWidth, height);
  // inner cross
  quad(rWidth, 10*rHeight,
       2*rWidth, 10*rHeight,
       10*rWidth, 18*rHeight,
       10*rWidth, 19*rHeight);
  quad(3*rWidth, 10*rHeight,
       4*rWidth, 10*rHeight,
       10*rWidth, 16*rHeight,
       10*rWidth, 17*rHeight);
  quad(5*rWidth, 10*rHeight,
       6*rWidth, 10*rHeight,
       10*rWidth, 14*rHeight,
       10*rWidth, 15*rHeight);
  quad(7*rWidth, 10*rHeight,
       8*rWidth, 10*rHeight,
       10*rWidth, 12*rHeight,
       10*rWidth, 13*rHeight);
  quad(9*rWidth, 10*rHeight,
       10*rWidth, 10*rHeight,
       10*rWidth, 10*rHeight,
       10*rWidth, 11*rHeight);
  
  // bottom right     
  quad(width, height,
       width, 19*rHeight,
       19*rWidth, height,
       width, height);
  quad(0, 37*rHeight,
       0, 38*rHeight,
       38*rWidth, 0,
       37*rWidth, 0);
  quad(0, 35*rHeight,
       0, 36*rHeight,
       36*rWidth, 0,
       35*rWidth, 0);
  quad(0, 33*rHeight,
       0, 34*rHeight,
       34*rWidth, 0,
       33*rWidth, 0);
  quad(0, 31*rHeight,
       0, 32*rHeight,
       32*rWidth, 0,
       31*rWidth, 0);
  // inner cross
  quad(19*rWidth, 10*rHeight,
       20*rWidth, 10*rHeight,
       10*rWidth, 20*rHeight,
       10*rWidth, 19*rHeight);
  quad(17*rWidth, 10*rHeight,
       18*rWidth, 10*rHeight,
       10*rWidth, 18*rHeight,
       10*rWidth, 17*rHeight);
  quad(15*rWidth, 10*rHeight,
       16*rWidth, 10*rHeight,
       10*rWidth, 16*rHeight,
       10*rWidth, 15*rHeight);
  quad(13*rWidth, 10*rHeight,
       14*rWidth, 10*rHeight,
       10*rWidth, 14*rHeight,
       10*rWidth, 13*rHeight);
  quad(11*rWidth, 10*rHeight,
       12*rWidth, 10*rHeight,
       10*rWidth, 12*rHeight,
       10*rWidth, 11*rHeight);  
}

  void keyPressed() {
    // alters green color 
    if(key == 'g') {
      seafoamGreen = color((hue(seafoamGreen)+10)%360,
                            saturation(seafoamGreen),
                            brightness(seafoamGreen));
    }
    // alters yellow color
    else if(key == 'y') {
      mustardYellow = color((hue(mustardYellow)+15)%360,
                             saturation(mustardYellow),
                             brightness(mustardYellow));
    }
    // reset colors
    else if(key == 'r') {
      mustardYellow = color(37, 260, 360);
      seafoamGreen = color(151, 350, 250);
    }
    // both, slow
    else if(key == 'h') {
       mustardYellow = color((hue(mustardYellow)+15)%360,
                             saturation(mustardYellow),
                             brightness(mustardYellow));
      seafoamGreen = color((hue(seafoamGreen)+10)%360,
                            saturation(seafoamGreen),
                            brightness(seafoamGreen));
    }
    // seizurific
    else if(key == 's') {
      seafoamGreen = color((hue(seafoamGreen)+220)%360,
                            saturation(seafoamGreen),
                            brightness(seafoamGreen));
      mustardYellow = color((hue(mustardYellow)+220)%360,
                             saturation(mustardYellow),
                             brightness(mustardYellow));
    }
  }

