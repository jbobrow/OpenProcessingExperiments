
float index = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);

  float my_sin = sin(index);

  float pos = map (my_sin, -1, 1, -255, width/2);

  if (mouseX < 166)

  {

    index += 0.1;

    noStroke();

    fill(18, 34, 196);
    translate(width/2, height/2);
    ellipse(0, 0, 300, 300);
    fill(255);
    ellipse(50, -70, 40, 40);
    ellipse(-50, -70, 40, 40);
    fill(0);
    ellipse(50+pos/17, -70, 10, 10);
    ellipse(-50+pos/17, -70, 10, 10);
    ellipse(0, 60, 60, 60);
    fill(18, 34, 196);
    ellipse(0, 58+pos/17, 60, 60);
    fill(0, 255, 100);
    ellipse(-250, 0, 150, 200);
    fill(0);
    ellipse(-220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);
    rotate(0.5);
    rect(-240, 50, 5, 30);

    popMatrix();

    fill(255, 0, 0);
    ellipse(250, 0, 150, 200);


    fill(0);
    ellipse(220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);

    rotate(0.3);
    rect(180, -120, 5, 30);

    popMatrix();
  }





  if (mouseX < 332 && mouseX > 166)


  {

    index += 0.1;

    noStroke();

    fill(18, 34, 196);
    translate(width/2, height/2);
    ellipse(0, 0, 300, 300);
    fill(255);
    ellipse(50, -70, 40, 40);
    ellipse(-50, -70, 40, 40);
    fill(0);
    ellipse(50+pos/100/17, -70, 10, 10);
    ellipse(-50+pos/100/17, -70, 10, 10);
    ellipse(0, 60, 60, 60);
    fill(18, 34, 196);

    fill(255, 0, 0);
    ellipse(-250, 0, 150, 200);
    fill(0);                           //-----
    ellipse(-220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);
    rotate(-0.5);
    rect(-155, -165, 5, 30);

    popMatrix();

    fill(255, 0, 0);
    ellipse(250, 0, 150, 200);


    fill(0);
    ellipse(220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);

    rotate(0.3);
    rect(180, -120, 5, 30);

    popMatrix();
  }

  if (mouseX > 332)


  {

    index += 0.1;

    noStroke();

    fill(18, 34, 196);
    translate(width/2, height/2);
    ellipse(0, 0, 300, 300);
    fill(255);
    ellipse(50, -70, 40, 40);
    ellipse(-50, -70, 40, 40);
    fill(0);
    ellipse(50+pos/17, -70, 10, 10);
    ellipse(-50+pos/17, -70, 10, 10);
    ellipse(0, 60, 60, 60);
    fill(18, 34, 196);

    ellipse(0, 58-pos/17, 60, 60);
    fill(255, 0, 0);
    ellipse(-250, 0, 150, 200);
    fill(0);                           //-----
    ellipse(-220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);
    rotate(-0.5);
    rect(-155, -165, 5, 30);

    popMatrix();

    fill(0, 255, 100);
    ellipse(250, 0, 150, 200);


    fill(0);
    ellipse(220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);

    rotate(-0.5);
    rect(241, 50, 5, 30);

    popMatrix();
  }
  
  if (mousePressed && mouseX < 332 && mouseX > 166)

{ 
   
pushMatrix();

    fill(0, 255, 100);
    ellipse(250, 0, 150, 200);


    fill(0);
    ellipse(220, -50, 15, 20);
   
    rectMode(CENTER);

    rotate(-0.5);
    rect(241, 50, 5, 30);

    popMatrix(); 
    
    fill(0, 255, 100);
    ellipse(-250, 0, 150, 200);
    fill(0);
    ellipse(-220, -50, 15, 20);
    pushMatrix();
    rectMode(CENTER);
    rotate(0.5);
    rect(-240, 50, 5, 30);

    popMatrix();
    
    fill(18, 34, 196);

    ellipse(0, 45, 60, 60);
    
    
    

  
}
}

