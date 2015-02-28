
int x = 10;
int y = 0;

void setup () {
 size (500,500);
}


void keyPressed () {
  background (150, 100, 100); 
  stroke (0);
  strokeWeight (3);
  fill ( 0, 200, 50);
  size (500, 500);
  rect (175, 250, 50, 100);
  ellipse (200, 200, 100, 100);
  ellipse (180, 200, 30, 50);
  ellipse (220, 200, 30, 50);
  line (250, 250, 225, 300);
  line (150, 250, 175, 300);
  line (180, 350, 150, 400);
  line (225, 350, 250, 400);

  ellipse (185, 200, 20, 20);
  ellipse (215, 200, 20, 20);
}

void mousePressed () {
  rect (150,125,100,25);
  rect (175, 90, 50, 35);
  fill (237,139,34);
  ellipse (200, 230, 20, 20);
}



void draw () {
  background (150, 0, 50);
  
  stroke (0);
  strokeWeight (3);
  fill ( 0, 200, 50);
  
  float x = random (1,100);
  float y = random (1,100);
  
  rect (x+175, y+250, 50, 100); 
  ellipse (x+200, y+200, 100, 100);
  ellipse (x+180, y+200, 30, 50);
  ellipse (x+220, y+200, 30, 50);

  line (x+250, y+250, x+225, x+300);
  line (x+150, y+250, x+175, y+300);
  line (x+180, y+350, x+150, y+400);
  line (x+225, y+350, x+250, y+400);
 

  ellipse (x+185, y+200, 20, 20);
  
  ellipse (x+215, y+200, 20, 20); 
  
  rect (x+150,y+125,100,25);
  rect (x+175, y+90, 50, 35);
  fill (237,139,34);
  ellipse (x+200, y+230, 20, 20);
  
  x = int (random(0.100));
  y = int (random(0,100));
  

}





