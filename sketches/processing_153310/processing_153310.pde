
int tail;
int tails;
int leftleg;
int leftlegs;
int rightlegs;
int rightleg;

void setup() {



  tail=237;
  rightleg = 400;
  tails=1;
  leftleg = 350;
  leftlegs = 3;
  rightlegs = 3;
  size(1000, 1000);
}

void draw () {
  println(mouseX, mouseY);
  background(255);



  fill(192, 192, 192);
  stroke(0);
  triangle(234, 11, 320, 94, 163, 94);

  //wagging tail and moving legs 

  tail=tail+tails;
  rightleg=rightleg+rightlegs;
  leftleg = leftleg + leftlegs;


  if (rightleg>420) { 
    rightlegs = rightlegs *-1;
  }
  if (rightleg<310) { 
    rightlegs = rightlegs *-1;
  }
  if (leftleg>420) { 
    leftlegs = leftlegs *-1;
  }
  if (leftleg<310) { 
    leftlegs = leftlegs *-1;
  }
  if (tail>=287)
    tails=tails*-1;
  if (tail<=187)
    tails=tails*-1;


  triangle(213, 364, 268, 364, tail, 505);
  triangle(199, 310, 209, 352, 143, leftleg);
  triangle(283, 310, 274, 355, 345, rightleg);
  triangle(205, 152, 197, 201, 128, 151);
  triangle(278, 152, 285, 204, 355, 151);
  fill(192, 192, 192);
  ellipse(241, 245, 90, 300);
  fill(72, 209, 204);
  stroke(192, 192, 192);
  ellipse(240, 245, 50, 250);

  if (mousePressed) {
    fill(192, 192, 192);
  } 
  else {
    fill(72, 209, 204);
  }

  ellipse(240, 245, 50, 250);

  //eyes
  if (mousePressed) {
    //left eye
    fill(255);
    ellipse(221, 48, 24, 24);
    fill(0);
    ellipse(221, 48, 18, 18);

    //right eye
    fill(255);
    ellipse(251, 48, 24, 24);
    fill(0);
    ellipse(251, 48, 18, 18);
  }
}


