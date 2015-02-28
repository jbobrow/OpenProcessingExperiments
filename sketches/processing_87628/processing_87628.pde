
//
// ITGM 315
// Fundamentals of Programming for Artists
// Professor Altman
//
//           Programming assignment 2, part 2
//           conditionals
//


color black  = color(0, 0, 0);
color gray  = color(211, 211, 211);
color white  = color(255, 255, 255);
color rred   = color(206, 6, 6);

int localX = 400;
int localY = 400;

void setup() {
  size( 800, 800 );
}

void draw() {
  background(150);
  smooth();


  if ( mousePressed && ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
  }

  for( int i=0; i<3; i++ ) {

    if ( i==0 && mousePressed && ( mouseButton == LEFT ) ) {
      draw_creature(localX+(i*225-225),localY); 
    }
    
    if ( i==1 && mousePressed && ( mouseButton == LEFT )) {
      draw_creature1(localX+(i*225-225),localY);
    }
    
    if ( i==2 && mousePressed && ( mouseButton == LEFT )) {
      draw_creature2(localX+(i*225-225),localY);
    }
  }
}

void draw_creature( int x, int y ) {
  
  ellipseMode(CENTER);
  rectMode(CENTER);

  fill(gray);
  ellipse(x+20, y+67, 30, 25);    // Right leg knee
  fill(white);
  rect(x+20, y-25, 25, 150);      // Right leg thigh
  rect(x+20, y+160, 25, 150);      // Right leg shin
  fill(rred);
  triangle(x+35, y+240, x+35, y+260, x+90, y+260);  //Right foot
  fill(gray);
  ellipse(x+20, y+250, 23, 23);
  fill(white);

  fill(gray);
  ellipse(x-20, y+67, 30, 25);    // Left leg knee
  fill(white);
  rect(x-20, y-25, 25, 150);      // Left leg thigh
  rect(x-20, y+160, 25, 150);      // Left leg shin
  fill(rred);
  triangle(x-35, y+240, x-35, y+260, x-90, y+260);  // Left foot
  fill(gray);
  ellipse(x-20, y+250, 23, 23);
  fill(white);

  fill(0,255,0);
  ellipse(x, y-200, 300, 300);
  fill(white);

  ellipse(x, y-300, 100, 120);    //Head
  
  ellipse(x+25, y-320, 25, 25);
  ellipse(x+25, y-320, 20, 22);

  if ( keyPressed  &&  ( key == 'q' ) ) {
    
      ellipse(x-25, y-320, 30, 40);
      ellipse(x-25, y-320, 25, 37);
  } else {
      ellipse(x-25, y-320, 25, 25);
      ellipse(x-25, y-320, 20, 22);
  }
  
  if ( keyPressed  &&  ( key == 'e' ) ) {

      noStroke();
      ellipse(x-25, y-320, 30, 30);
      stroke(0);
      ellipse(x-25, y-320, 10, 10);
      ellipse(x-25, y-320, 6, 8);
  }

  line(x+15, y-267, x+20, y-278);      //Face lines
  line(x+15, y-267, x+20, y-270);
  line(x-20, y-278, x-15, y-267);      //Face lines
  line(x-20, y-270, x-15, y-267);

  stroke(0, 0, 0, ((float)mouseX/width)*255);
  line(x+100, y-100, x+150, y-50);      //Right Arm and hand
  line(x+150, y-50, x+200, y-150);
  line(x+200, y-150, x+218, y-195);
  line(x+200, y-150, x+208, y-188);
  line(x+200, y-150, x+199, y-182);
  line(x+200, y-150, x+189, y-180);
  stroke(0);

  stroke(0, 0, 0, 255-((float)mouseX/width)*255);
  line(x-100, y-100, x-150, y-50);      //Left Arm and hand
  line(x-150, y-50, x-200, y-150);
  line(x-200, y-150, x-218, y-195);
  line(x-200, y-150, x-208, y-188);
  line(x-200, y-150, x-199, y-182);
  line(x-200, y-150, x-189, y-180);
  stroke(0);

  line(x+15,y-275,x+15,y-220);      //Nossle
  line(x-15,y-275,x-15,y-220);
  noStroke();
  rect(x,y-250,28,50);
  stroke(0);
  fill(206,6,6);
  ellipse(x,y-220,30,20);
  fill(211,211,211);
  ellipse(x+3,y-223,5,5);
  ellipse(x-3,y-223,5,5);
  ellipse(x-7,y-217,5,5);
  ellipse(x+7,y-217,5,5);
  ellipse(x,y-217,5,5);
 
}

void draw_creature1( int x, int y ) {
  
  ellipseMode(CENTER);
  rectMode(CENTER);

  fill(gray);
  ellipse(x+20, y+67, 30, 25);    // Right leg knee
  fill(white);
  rect(x+20, y-25, 25, 150);      // Right leg thigh
  rect(x+20, y+160, 25, 150);      // Right leg shin
  fill(rred);
  triangle(x+35, y+240, x+35, y+260, x+90, y+260);  //Right foot
  fill(gray);
  ellipse(x+20, y+250, 23, 23);
  fill(white);

  fill(gray);
  ellipse(x-20, y+67, 30, 25);    // Left leg knee
  fill(white);
  rect(x-20, y-25, 25, 150);      // Left leg thigh
  rect(x-20, y+160, 25, 150);      // Left leg shin
  fill(rred);
  triangle(x-35, y+240, x-35, y+260, x-90, y+260);  // Left foot
  fill(gray);
  ellipse(x-20, y+250, 23, 23);
  fill(white);

  fill(255);
  ellipse(x, y-200, 300, 300);
  fill(white);

  ellipse(x, y-300, 100, 120);    //Head

  if ( keyPressed  &&  ( key == 'e' ) ) {
    
      ellipse(x-25, y-320, 30, 40);
      ellipse(x-25, y-320, 25, 37);
      ellipse(x+25, y-320, 30, 40);
      ellipse(x+25, y-320, 25, 37);
  } else {
      ellipse(x-25, y-320, 25, 25);
      ellipse(x-25, y-320, 20, 22);
      ellipse(x+25, y-320, 25, 25);
      ellipse(x+25, y-320, 20, 22);
  }
  
  if ( keyPressed  &&  ( key == 'q' ) ) {
  
      noStroke();
      ellipse(x-25, y-320, 30, 30);
      ellipse(x+25, y-320, 30, 30);
      stroke(0);
      ellipse(x+25, y-320, 10, 10);
      ellipse(x+25, y-320, 6, 8);
      ellipse(x-25, y-320, 10, 10);
      ellipse(x-25, y-320, 6, 8);
  }

  line(x+15, y-267, x+20, y-278);      //Face lines
  line(x+15, y-267, x+20, y-270);
  line(x-20, y-278, x-15, y-267);      //Face lines
  line(x-20, y-270, x-15, y-267);

  stroke(0, 0, 0, ((float)mouseX/width)*255);
  line(x+100, y-100, x+150, y-50);      //Right Arm and hand
  line(x+150, y-50, x+200, y-150);
  line(x+200, y-150, x+218, y-195);
  line(x+200, y-150, x+208, y-188);
  line(x+200, y-150, x+199, y-182);
  line(x+200, y-150, x+189, y-180);
  stroke(0);

  stroke(0, 0, 0, 255-((float)mouseX/width)*255);
  line(x-100, y-100, x-150, y-50);      //Left Arm and hand
  line(x-150, y-50, x-200, y-150);
  line(x-200, y-150, x-218, y-195);
  line(x-200, y-150, x-208, y-188);
  line(x-200, y-150, x-199, y-182);
  line(x-200, y-150, x-189, y-180);
  stroke(0);

  line(x+15,y-275,x+15,y-220);      //Nossle
  line(x-15,y-275,x-15,y-220);
  noStroke();
  rect(x,y-250,28,50);
  stroke(0);
  fill(206,6,6);
  ellipse(x,y-220,30,20);
  fill(211,211,211);
  ellipse(x+3,y-223,5,5);
  ellipse(x-3,y-223,5,5);
  ellipse(x-7,y-217,5,5);
  ellipse(x+7,y-217,5,5);
  ellipse(x,y-217,5,5);
 
}

void draw_creature2( int x, int y ) {
  
  ellipseMode(CENTER);
  rectMode(CENTER);

  fill(gray);
  ellipse(x+20, y+67, 30, 25);    // Right leg knee
  fill(white);
  rect(x+20, y-25, 25, 150);      // Right leg thigh
  rect(x+20, y+160, 25, 150);      // Right leg shin
  fill(rred);
  triangle(x+35, y+240, x+35, y+260, x+90, y+260);  //Right foot
  fill(gray);
  ellipse(x+20, y+250, 23, 23);
  fill(white);

  fill(gray);
  ellipse(x-20, y+67, 30, 25);    // Left leg knee
  fill(white);
  rect(x-20, y-25, 25, 150);      // Left leg thigh
  rect(x-20, y+160, 25, 150);      // Left leg shin
  fill(rred);
  triangle(x-35, y+240, x-35, y+260, x-90, y+260);  // Left foot
  fill(gray);
  ellipse(x-20, y+250, 23, 23);
  fill(white);

  fill(255,0,0);
  ellipse(x, y-200, 300, 300);
  fill(white);

  ellipse(x, y-300, 100, 120);    //Head
  
  ellipse(x-25, y-320, 25, 25);
  ellipse(x-25, y-320, 20, 22);

  if ( keyPressed  &&  ( key == 'q' ) ) {
    
      ellipse(x+25, y-320, 30, 40);
      ellipse(x+25, y-320, 25, 37);
  } else {
      ellipse(x+25, y-320, 25, 25);
      ellipse(x+25, y-320, 20, 22);
  }
  
  if ( keyPressed  &&  ( key == 'e' ) ) {
    
      noStroke();
      ellipse(x+25, y-320, 30, 30);
      stroke(0);
      ellipse(x+25, y-320, 10, 10);
      ellipse(x+25, y-320, 6, 8);
  }

  line(x+15, y-267, x+20, y-278);      //Face lines
  line(x+15, y-267, x+20, y-270);
  line(x-20, y-278, x-15, y-267);      //Face lines
  line(x-20, y-270, x-15, y-267);

  stroke(0, 0, 0, ((float)mouseX/width)*255);
  line(x+100, y-100, x+150, y-50);      //Right Arm and hand
  line(x+150, y-50, x+200, y-150);
  line(x+200, y-150, x+218, y-195);
  line(x+200, y-150, x+208, y-188);
  line(x+200, y-150, x+199, y-182);
  line(x+200, y-150, x+189, y-180);
  stroke(0);

  stroke(0, 0, 0, 255-((float)mouseX/width)*255);
  line(x-100, y-100, x-150, y-50);      //Left Arm and hand
  line(x-150, y-50, x-200, y-150);
  line(x-200, y-150, x-218, y-195);
  line(x-200, y-150, x-208, y-188);
  line(x-200, y-150, x-199, y-182);
  line(x-200, y-150, x-189, y-180);
  stroke(0);

  line(x+15,y-275,x+15,y-220);      //Nossle
  line(x-15,y-275,x-15,y-220);
  noStroke();
  rect(x,y-250,28,50);
  stroke(0);
  fill(206,6,6);
  ellipse(x,y-220,30,20);
  fill(211,211,211);
  ellipse(x+3,y-223,5,5);
  ellipse(x-3,y-223,5,5);
  ellipse(x-7,y-217,5,5);
  ellipse(x+7,y-217,5,5);
  ellipse(x,y-217,5,5);
 
}

