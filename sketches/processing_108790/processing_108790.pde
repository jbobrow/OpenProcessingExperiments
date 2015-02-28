
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (September 3, 2013) All Rights Reserved

float x, y, wd, ht;
color col;
color col2;
color col3;

void setup()
{
    size (400, 400);
    x = 0;
    y = height*0.6;
    wd = width*0.35;
    ht = height*0.43;
    col = color(0, 0, 0, 0); 
    //noStroke();
    //stroke(255, 0, 0);
    //strokeWeight(10);
    frameRate(50);
}

void mousePressed()
{
      col = color(random(255), random(255), random(255));
      col2 = color(random(255), random(255), random(255), 10);
}

void keyPressed()
{
      col3 = color(random(255), random(255), random(255));
}

void draw()
{
    //background(200, 200, 0);
    fill(col2);
    noStroke();
    rect(0, 0, width, height);
    fill(col);
    //ellipse(x, y, wd, ht);
    stroke(col3);
    ellipse(mouseX, mouseY, mouseX - mouseY, mouseY - mouseX); 
    //x = x + 1;
    //beginShape();
    //vertex(random(400), random(400));
    //vertex(random(400), random(400));
    //vertex(random(400), random(400));
    //vertex(random(400), random(400));
    //vertex(random(400), random(400));
    //endShape(CLOSE);
}

