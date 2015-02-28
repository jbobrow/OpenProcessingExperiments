
int x = 0;
int speed = 1;

void setup(){
  size(300,300);
  smooth();
}

void draw(){
  background(255);
    moveBunny();
  bounce();
  display();
}

void moveBunny(){
  x = x + speed;
}

void bounce() {
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
}

void display(){

//set ellipses and rects to CENTER mode
//ellipseMode(CENTER);
//rectMode(CENTER);

//bunny ear left
stroke(50);
fill(209);
ellipse(x-20,50,35,65);


//bunny ear right
stroke(50);
fill(209);
ellipse(x+20,50,35,65);


//bunny head
stroke(50);
fill(209);
ellipse(x,100,50,50);
//bunny nose
fill(100);
ellipse(x,110,10,10);
//bunny eye right
fill(100);
ellipse(x+10,100,5,5);
//bunny eye left
fill(100);
ellipse(x-10,100,5,5);

//bunny body
stroke(50);
fill(209);
ellipse(x,170,70,90);
//bunny belly button
fill(100);
ellipse(x,185,5,5);

//bunny tail
fill(100);
ellipse(x-45,185,25,25);

//bunny foot right
stroke(50);
fill(209);
ellipse(x+50,220,75,35);

//bunny foot left
stroke(50);
fill(209);
ellipse(x-50,220,75,35);
}






