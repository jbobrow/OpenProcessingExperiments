
//declare variables
ArrayList squares;
ArrayList colorSquares;
boolean pause = false; 


void setup() {
  background(0);
  size(400, 400);
  squares = new ArrayList();
  colorSquares = new ArrayList(); 

  for (int i = 0; i< width; i+=2) {
    PVector loc = new PVector(); 
    PVector loc2 = new PVector();

    loc.set(i, i);
    loc2.set(width - i, i);
    squares.add(new AliveSquare(loc, width/int(random(50, 100)), int(random(255)), int(random(15))));
    colorSquares.add(new AliveSquare(loc2, width/int(random(50, 100)), color(random(50, 255), 0, 0), int(random(15))));
  }
}
void draw() {

  for (int i = 0; i < squares.size(); i++) {
    AliveSquare alivesquare = squares.get(i); 
    AliveSquare colorSquare = colorSquares.get(i);
    if (pause == false) {
      if (squares.get(i).xy.x < width && 
        squares.get(i).xy.y < height) { 
        alivesquare.twitch();
        alivesquare.draw();
      }

      if (colorSquares.get(i).xy.x < width &&
        colorSquares.get(i).xy.y < height) {
        colorSquare.twitch(); 
        colorSquare.draw();
      }
    }
  }
}

void mousePressed() {
  pause = !pause;
}

class AliveSquare {

  int size, alpha; 
  color c;
  PVector xy;

  AliveSquare(PVector _xy, int _size, color _c, int _alpha) {
    size = _size; 
    c = _c; 
    alpha = _alpha;
    xy = _xy;
  }

  void twitch() {
   //int r = int(random(-2, 2));
   //println(r);
   xy.set(xy.x += (random(-2,2)), xy.y += (random(-2,2)));
  }

  void draw() {
    rectMode(CENTER);
    fill(c, alpha);
    noStroke();
    //stroke(0);
    rect(xy.x, xy.y, size, size, size/5);
  }
}



