
void setup()
{
  size(1000, 700); 
  //background(255, 255, 255); 
  smooth();
}

void draw()
{
  background(random (255), random (255), random(255));

  line (100, 100, 100, 300);
  fill(random(255), random(255), random(255));
  ellipse(100, 100, 100, 100);
  line(100, 300, 50, random(250, 350));
  line(100, 300, 150, random(250, 350));
  line(100, 200, 50, random(175, 275));
  line(100, 200, 150, random(175, 275));
  fill(0, 0, 0);
  arc(100, 110, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(80, 85, 15, 15);
  ellipse(120, 85, 15, 15);

  line (300, 100, 300, 300);
  fill( random(255), random  (255), random(255));
  ellipse(300, 100, 100, 100);
  line(300, 300, 250, random(250, 350));
  line(300, 300, 350, random(250, 350));
  line(300, 200, 250, random(175, 275));
  line(300, 200, 350, random(175, 275));
  fill(0, 0, 0);
  arc(300, 110, 50, 50, 0, PI);
  fill(random(255), random(255), random(255));
  ellipse(280, 85, 15, 15);
  ellipse(320, 85, 15, 15);

  line(500, 100, 500, 300);
  fill(random (255), random (255), random(255));
  ellipse(500, 100, 100, 100);
  line(500, 300, 450, random(250, 350));
  line(500, 300, 550, random(250, 350));
  line(500, 200, 450, random(175, 275));
  line(500, 200, 550, random(175, 275));
  fill(0, 0, 0);
  arc(500, 110, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(480, 85, 15, 15);
  ellipse(520, 85, 15, 15);

  line(700, 100, 700, 300);
  fill(random (255), random (255), random(255));
  ellipse(700, 100, 100, 100);
  line(700, 300, 650, random(250, 350));
  line(700, 300, 750, random(250, 350));
  line(700, 200, 650, random(175, 275));
  line(700, 200, 750, random(175, 275)); 
  fill(0, 0, 0);
  arc(700, 110, 50, 50, 0, PI);
  ellipse(680, 85, 15, 15);
  ellipse(720, 85, 15, 15);

  line(900, 100, 900, 300);
  fill(random (255), random (255), random(255));
  ellipse(900, 100, 100, 100);
  line(900, 300, 850, random(250, 350));
  line(900, 300, 950, random(250, 350));
  line(900, 200, 850, random(175, 275));
  line(900, 200, 950, random(175, 275));
  fill(0, 0, 0);
  arc(900, 110, 50, 50, 0, PI);
  fill(random(255),random(255),random(255));
  ellipse(880, 85, 15, 15);
  ellipse(920, 85, 15, 15);

  line (100, 450, 100, 650);
  fill(random (255), random (255), random(255));
  ellipse(100, 450, 100, 100);
  line(100, 650, 50, random(650, 750));
  line(100, 650, 200, random(650, 750));
  line(100, 550, 50, random(510, 610));
  line(100, 550, 150, random(510, 610));
    fill(0, 0, 0);
    arc(100, 460, 50, 50, 0, PI);
 fill(random (255), random (255), random(255));
  ellipse(80, 435, 15, 15);
  ellipse(120, 435, 15, 15);

  line(300, 450, 300, 650);
  fill(random (255), random (255), random(255));
  ellipse(300, 450, 100, 100);
  line(300, 650, 250, random(650, 750));
  line(300, 650, 400, random(650, 750));
  line(300, 550, 250, random(510, 610));
  line(300, 550, 350, random(510, 610));
  fill(0, 0, 0);
  arc(300, 460, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(280, 435, 15, 15);
  ellipse(320, 435, 15, 15);  

  line(500, 450, 500, 650);
  fill(random (255), random (255), random(255));
  ellipse(500, 450, 100, 100);
  line(500, 650, 450, random(650, 750));
  line(500, 650, 600, random(650, 750));
  line(500, 550, 450, random(510, 610));
  line(500, 550, 550, random(510, 610)); 
  fill(0, 0, 0);
  arc(500, 460, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(480, 435, 15, 15);
  ellipse(520, 435, 15, 15); 

  line(700, 450, 700, 650);
  fill(random (255), random (255), random(255));
  ellipse(700, 450, 100, 100);
  line(700, 650, 650, random(650, 750));
  line(700, 650, 800, random(650, 750));
  line(700, 550, 650, random(510, 610));
  line(700, 550, 750, random(510, 610));
   fill(0, 0, 0);
  arc(700, 460, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(680, 435, 15, 15);
  ellipse(720, 435, 15, 15);

  line(900, 450, 900, 650);
  fill(random (255), random (255), random(255));
  ellipse(900, 450, 100, 100);
  line(900, 650, 850, random(650, 750));
  line(900, 650, 1000, random(650, 750));
  line(900, 550, 850, random(510, 610));
  line(900, 550, 950, random(510, 610));
  fill(0, 0, 0);
  arc(900, 460, 50, 50, 0, PI);
  fill(random (255), random (255), random(255));
  ellipse(880, 435, 15, 15);
  ellipse(920, 435, 15, 15);
}
