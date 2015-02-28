
// comment on my little scketch for today.  good luck
/*I guess I could keep talking here and make it into some blog about nothing but it seems as 
if I dont have much time */






float x= 150;
float y= 100;
float speed = 1;


void setup () {
  size (800, 800);
  background (#778899);
  strokeWeight(10);
  stroke(#800000);
  line (0, 0, 800, 0);
  line (800, 0, 800, 800);
  line (800, 800, 0, 800);
  line (0, 800, 0, 0);
 //sun
 strokeWeight(5);
  stroke(#000000);
  noSmooth();
  fill (#ffd700);
  arc (800, 3, 250, 250, PI/2, PI);
  stroke (#87CEFA);
  fill (#A4D3EE);
  
  // clouds
  ellipse (150, 120, 160, 80);
  ellipse (200, 130, 180, 80);
  ellipse (390, 120, 160, 80);
  ellipse (490, 130, 180, 80);
  
  // array? rectMode(CENTER)
  

  
}


  

void draw (){
  move();
  display();
  noSmooth ();
  stroke (#adff2f);
  fill (#228b22);
  ellipse (200, 600, 200, 100);
 stroke (#cd853f);
 smooth();
 fill (#8b4513);
 rect (150, 650, 100, 200); 
  move();
  display();
}
void move() {
  x= random (0, 800);
  y = y + speed;
  if (y > width) {
    y = 0;
  }
}

void display() {
  fill(#8B3E2F);
  rect (x,y,8, 15);
}
 


