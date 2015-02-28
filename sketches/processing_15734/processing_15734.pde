
int x = 0;
int speed = 1;

void setup (){
  size (800,700);
  smooth();
}

void draw (){
  background (150, 20,80);
 mover ();
 rebotar ();
 display ();
}

void mover (){
  x = x + speed;
}
void rebotar (){
  if (( x > width) || (x < 0)) {
    speed = speed * - 1;
  }
}

void display (){
  fill (50,20,50);
  ellipse (x,300,320,320);
  fill (20, 40,50);
  ellipse (x,300, 50,50);
  fill (2,40,50);
  ellipse (x -170, 250,30,30);
   ellipse (x +170, 250,30,30);
   fill (100,200,250);
    ellipse (x -50, 250,45, 15);
   ellipse (x +50, 250,15, mouseY);
   fill (50,20,50);
   ellipse (x,400, 25,25);
   
   fill (60,20,30);
    ellipse (x,480, 50,50);
    
    fill(60,50,20);
     ellipse (x,530, 50,50);
     
     fill (60,30,50);
      ellipse (x,580, 50,50);
  
   stroke(200);
   strokeWeight (8);
   line (x - 50, 605, x+50, 605);
}



