
void setup () {
  size (300, 300);
}


void draw () {
  if (mousePressed) {  //sunny country scene with house, in color

    colorMode(RGB);
    background(135,215,255); //blue background when mouse is pressed

    fill(40,120,20); //ground line
    rect(0, 250, width, 250);
    
    fill(255); //house
    rect(50,175,100,75); 
    fill(50); //roof of house
    triangle(30,175,170,175,100,125);
   fill(255,50,40); // red door
    rect(100,200,30,50);
    fill(255,236,60); //yellow window
    rect(65,200,20,30);
    
    fill(255,236,60); // sun
    ellipse(250,50,40,40);

   
   
  } 

  else {  // black and white city scene with windows and background changing color with mouse

    colorMode(RGB, width);
    background(width-mouseX); //as mouse moves, background changes from white to black

    fill(50); //ground line
    rect(0, 250, width, 250);

    fill(200);  //building #3
    rect(150, 25, 75, 225);
    fill(mouseX); // all windows change with movement of mouse in opposite if background
    rect(180, 35, 30, 200);  //windows for building #3
    fill(150);

    rect(100, 125, 100, 125); // building #2
    fill(mouseX);
    rect(100, 140, 90, 20);  // windows for building #2
    rect(100, 170, 90, 20);
    rect(100, 200, 90, 20);
    rect(100, 230, 90, 20);

    fill(200); //building #1
    rect(50, 50, 50, 200);
    fill(mouseX);
    rect(60, 60, 30, 50);  // windows for building #1
    rect(60, 120, 30, 50);
    rect(60, 180, 30, 50);

    fill(200); //bulding #4
    rect(175, 200, 150, 50);
    fill(mouseX);
    rect(190, 215, 20, 20); //windows for building #4
    rect(220, 215, 20, 20);
    rect(250, 215, 20, 20);
    rect(280, 215, 20, 20);
  }
}

