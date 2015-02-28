
/*Well I kind of did what I intended. The character is less complex than I intended
but it ascends from a darker (less enlightened) background to meld with white at the
top while constantly becoming more opaque. The character is 'reincarnated' when it 
reaches enlightenment but one element of the previous incarnation remains despite the
next version being a randomly selected shape this changes the characer's relationship
with the background and what it lookes like when it reaches the top again. It is only
possible to go forward on the journey although using the down key will halt progress and
decrease size, opacity and the background color showing lost ground in the search for
enlightenment and a starker contrast against the 'nothingness' ideally sought by the time
the character reaches the top. I guess it's a Buddist brand of enlightenment?*/

float x = 10;
float y = 10;
float x1 = 0;
float y1 = 0;
float back = 50;
float filler = 10;
float R = 0;
boolean restart = false;

void setup() {
  size(210, 640);
  background(0);
  R=random(1, 4);
}

void draw() {

  println("reincarnate" + R);
  println("restart = " + restart);
  println("y1 = " + y1);
}

void keyPressed() {

  if (R>0 && R<2) {
    background(back+10, back+40, back+ 30);
    ellipse(width/2, y1+height, x, y);
    noStroke();
    fill(255, filler);
  }
  if (R>2 && R<3) {
    background(back+10, back+10, back+ 50);
    rect (width/2, y1+height, x, y);
    rectMode(CENTER);
    noStroke();
    fill(255, filler);
  }
  if (R>3) {
    background(back+40, back+10, back+ 10);
    triangle(width/2-x, y1+height+x, width/2, y1+height, width/2+x, y1+height+y);
    noStroke();
    fill(255, filler);
  }

  switch(keyCode) {

  case UP:
    //the orb will grow and move up with the up buttons towards "enlightenment"
    //and the background will get lighter
    x++;
    y++;
    y1=y1-10;
    back=back+3;
    filler+=4;
    break;

  case DOWN:
    //  The orb will not descend but it will shrink and the background will get darker showing
    //  loss of ground in the overall level of 'enlightenment'
    x--;
    y--;
    y1++;
    back=back-6;
    break;
  }

  if (y1==height*-1) {
    restart = true;
    if (restart=true) {
      x = 10;
      //      y = 10;
      x1 = 0;
      y1 = 0;
      back = 50;
      filler = 10;
      R=random(1, 4);
    }
  }
}



