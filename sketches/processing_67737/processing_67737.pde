
int x = 0;
int y = 0;

void setup () {

  size (500, 500);
  background (230, 230, 50);

  strokeWeight (5);
  line (230,400, 250, 295);
  line (310, 400, 290, 295);

  line (290, 210, 350, 210);
  line (190, 210, 250, 210);

  noStroke ();
  fill (0, 200, 100);
  rect (250, 150, 40, 150);

  fill (200, 0, 120);
  ellipse (270, 150, 80, 80);

  fill (255, 255, 255);
  ellipse (248, 145, 30, 10);

  ellipse (290, 145, 30, 45);

  fill (0);
  ellipse (280, 145, 10, 20);
  ellipse (248, 145, 7, 10);

 stroke (0); 
  strokeWeight (5);

  line (310, 140, 350, 210);
  line (190, 210, 250, 280); 
  
  frameRate(20);
}
void draw (){
   stroke (random(0,255),random(0,255), random(0,255));
  fill (random(0,255),random(0,255), random(0,255));
  ellipse (280, 145, 10, 20);
  ellipse (248, 145, 7, 10);
  
   background (230, 230, 50);
   
stroke (0);
  strokeWeight (5);
  line (x+230,y+400, x+250, y+295);
  line (x+310, y+400, x+290, y+295);

  line (x+290, y+210, x+350, y+210);
  line (x+190, y+210, x+250, y+210);

  noStroke ();
  fill (0, 200, 100);
  rect (x+250, y+150, 40, 150);

  fill (200, 0, 120);
  ellipse (x+270, y+150, 80, 80);

  fill (255, 255, 255);
  ellipse (x+248, y+145, 30, 10);

  ellipse (x+290, y+145, 30, 45);

stroke (random(0,255),random(0,255), random(0,255));
  fill (random(0,255),random(0,255), random(0,255));
  ellipse (x+280, y+145, 10, 20);
  ellipse (x+248, y+145, 7, 10);

 stroke (0); 
 fill (0);
  strokeWeight (5);

  line (x+310, y+140, x+350, y+210);
  line (x+190, y+210, x+250, y+280); 
  
  x = x + 2;
  y = y + 1;
  
}

void mousePressed () {
  background (200, 0, 120);
    size (500, 500);
  
  strokeWeight (5);
  line (270, 400, 250, 295);
  line (340, 400, 290, 295);

  line (290, 210, 350, 210);
  line (190, 210, 250, 210);

  noStroke ();
  fill (0, 200, 100);
  rect (250, 150, 40, 150);

  fill (120, 0, 200);
  ellipse (270, 150, 80, 80);

  fill (255, 255, 255);
  ellipse (248, 145, 30, 10);

  ellipse (290, 145, 30, 45);

  fill (0);
  ellipse (280, 145, 10, 20);
  ellipse (248, 145, 7, 10);

  stroke (0);
  strokeWeight (5);

  line (330, 140, 350, 210);
  line (190, 210, 210, 280);
}

void keyPressed () {

    background (230, 230, 50);
      size (500, 500);
      
  strokeWeight (5);
  line (230, 400, 250, 295);
  line (310, 400, 290, 295);

  line (290, 210, 350, 210);
  line (190, 210, 250, 210);

  noStroke ();
  fill (0, 200, 100);
  rect (250, 150, 40, 150);

  fill (200, 0, 120);
  ellipse (270, 150, 80, 80);

  fill (255, 255, 255);
  ellipse (248, 145, 30, 10);

  ellipse (290, 145, 30, 45);


  stroke (0);
  strokeWeight (5);

  line (310, 140, 350, 210);
  line (190, 210, 250, 280);
}



