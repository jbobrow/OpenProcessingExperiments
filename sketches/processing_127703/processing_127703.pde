

void setup() { 
  size(500, 500);

  

}

void draw() {  //draw function loops 
      if (mousePressed == true) {
      background(0);
  } else { 
      background(255);
  }
    if (mousePressed == true) {
        fill(0,0,255);
    }
    else {
        fill(250,250,0);
    }
    rectMode(CENTER);
    rect(250,250,200,200);
    fill (255,255,255);
    ellipse(210,220,40,40);
    ellipse(290,220,40,40);
        if (mousePressed == true) {
            fill (255,40,40);
        } 
        else {
            fill (0,185,255);
        }
    ellipse(210,220,20,20);
    ellipse(290,220,20,20);
    fill (0,0,0);
    ellipse(210,220,10,10);
    ellipse(290,220,10,10);
    fill (255,40,100);
    arc(250, 280, 80, 80,0, PI);
    fill (255,255,255);
    rect (263,290,20,20);
    rect (238,290,20,20);
    fill (255,255,100);
    ellipse(250,250,25,25);
    fill (200,200,0);
    ellipse (320,330,30,30);
    ellipse (170,170,20,20); 
    ellipse (190,165,10,10);
    

}
