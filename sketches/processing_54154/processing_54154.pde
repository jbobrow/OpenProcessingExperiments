


void setup()
{
  smooth();
  size(1000, 500);
}

void draw()

{
  int legs1=int(random(2,5));
   int legs2=int(random(2,5));
    int legs3=int(random(2,5));
    
    int ht1=int(random(0,55));
    int ht2=int(random(0,55));
    int ht3=int(random(0,55));
    int smile1= int(random(0,80));
    int smile2= int(random(0,80));
    int smile3= int(random(0,80));
  background(-mouseY);

  smiley(width/2, height/4, 180, ht1, legs1, smile1);
  smiley(width/2+280, height/4, 180, ht2, legs2, smile2);
  smiley(width/2-280, height/4, 180, ht3, legs3, smile3);
  
noLoop();

}

void smiley(float x, float y, color greyval, float ht, float numblegs, float happiness)
{  
  fill(greyval, greyval, greyval, mouseY);

  pushMatrix();
  translate(x, y);
  strokeWeight(10);

  triangle(-50-ht, 130+ht, -30-ht, 130+ht, -90-ht/2, 250+ht);
  triangle(50+ht, 130+ht, 30+ht, 130+ht, 90+ht/2, 250+ht);
  
  if (numblegs==2)
  {
  }

  if (numblegs==3)
  {
    triangle(-10, 130+ht, 10, 130+ht, 0, 250+ht);
  }

  if (numblegs==4)
  {
    triangle(-10+ht/2, 130+ht, 10+ht/2, 130+ht, ht/2, 250+ht);
    triangle(-10-ht/2, 130+ht, 10-ht/2, 130+ht, -ht/2, 250+ht);
  }

  line(0, -50, 0, -100);
  line(20, 50, 20, 80);
  line(-20, 50, -20, 80);
  line(0, 50, 0, 100);

  ellipse (0, 0, 100, 100);
  ellipse(-20, -20, 5, 5);
  ellipse(0, -25, 5, 5);
  ellipse(20, -20, 5, 5);

  rect(0, 80, 50+ht, 50+ht);
  rect(-50-ht, 80, 50+ht, 50+ht);

  ellipseMode(CENTER);
  ellipse(0, -100, 10, 10);
  noFill();
  arc(0, -5, 80, happiness, radians(30), radians(150));
  popMatrix();
}

void mousePressed()
{
  redraw();
}



