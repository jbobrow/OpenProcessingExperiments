
//Pinocchio Rose Looses her Head
//by Allison Eve Zell

void setup() {

  size(1000,700);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw () {

  background(0);

  if (mousePressed == true) {

    // Body
    fill(255,100,100);
    quad (120,220,380,220,520,480,230,480);

    // Head
    fill(255,100,100);
    noStroke();
    ellipse(mouseX,mouseY,160,160); 

    // Eye
    fill(255); 
    ellipse(220,110,26,42); 
    fill(0); 
    ellipse(215,110,16,32); 

    //Nose
    fill(255); 
    rect(107,140,130,15); 

    //Mouth
    noStroke();
    fill(0); 
    ellipse(190,180,50,35); 

    // Wheels
    fill (255);
    ellipse (270,470,50,50);
    ellipse (320,470,50,50);
    ellipse (370,470,50,50);
    ellipse (420,470,50,50);
    ellipse (470,470,50,50);

    //Hubcaps
    fill(150);
    ellipse (270,470,30,30);
    ellipse (320,470,30,30);
    ellipse (370,470,30,30);
    ellipse (420,470,30,30);
    ellipse (470,470,30,30);
  } 
  else {

    background(255);

    // Body
    fill(255,100,100);
    rect(850,550,260,260);

    // Head
    fill(255,100,100);
    noStroke();
    ellipse(850,340,160,160); 

    // Eye
    fill(255,255,255); 
    ellipse(820,310,26,42); 
    fill(0,0,0); 
    ellipse(825,310,16,32); 

    //Nose
    fill(0,0,0); 
    rect(707,340,130,15); 

    //Mouth
    noStroke();
    fill(255,255,255); 
    ellipse(790,380,50,35); 

    // Wheels
    fill(0,0,0);
    ellipse (750,670,50,50);
    ellipse (800,670,50,50);
    ellipse (850,670,50,50);
    ellipse (900,670,50,50);
    ellipse (950,670,50,50);

    //Hubcaps
    fill(150,150,150);
    ellipse (750,670,30,30);
    ellipse (800,670,30,30);
    ellipse (850,670,30,30);
    ellipse (900,670,30,30);
    ellipse (950,670,30,30);
  }
}


