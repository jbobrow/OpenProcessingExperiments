
float x;
float xlimit;
float ylimit;
float angle;
float yangle;
float dista;

//setup size
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
  strokeWeight(15);
  fill(255);
  ellipseMode(CENTER);
  
  //draw two big ellipses
  ellipse(width/2-100, height/2-50, 100, 200);
  ellipse(width/2+100, height/2-50, 100, 200);
  strokeWeight(1);
  fill(0);

  //set boundaries of eye movement
  //y-axis boundaries
  ylimit = mouseY;
  if (mouseY >= height/2+25) {
    ylimit = height/2+25;
  }
  else if (mouseY <= height/2-125) {
    ylimit = height/2-125;
  }
 
  //x-axis boundaries
  if(mouseX-100 > width/2-125 && mouseX-100 < width/2-75) {
    x = mouseX-100;
  }
  
  //ellipse boundaries for the pupils to move around the circumference
  else{
    //boundaries for right circumference
    if (mouseX-100 >= width/2-75) {
      xlimit = width/2-75;
      dista = dist(xlimit, ylimit, width/2-100, height/2-50);
      angle = acos(dista/100);
      yangle = acos(dista/200);
      
      //formulae: x = cx + r*cos(a) where
      //cx is centre x coordinates of ellipse, r is radius, and a is angle in radians
      x = (width/2-100) - (50* cos(angle));
      x += 50;
    }
    //boundaries for left circumference
    else if (mouseX-100 <= width/2-125) {
      xlimit = width/2-125;
      dista = dist(xlimit, ylimit, width/2-100, height/2-50);
      angle = acos(dista/100);
      yangle = acos(dista/200);
 
      x = (width/2-100) + (50 * cos(angle));
      x -= 50;
    }
  } 

  //draw the pupils
  ellipse(x, ylimit, 45, 45);
  ellipse(x+200, ylimit, 45, 45);
 
  squint();

  noFill();
  strokeWeight(15);
  arc(width/2, height/2+150, 200, 100, 0, PI);
}


//move eyelids up and down when mouse is pressed
void squint() {
  float rads;
  float liney;
  
  //when mouse is pressed, draw the eyelids
  if (mousePressed) {
    rads = radians(mouseY-(height/2-100)-70);
    
    //arc mode should be CHORD, but unsupported in processing.js :(
    arc(width/2-100, height/2-50, 100, 200, PI-rads, TWO_PI+rads, OPEN);
    arc(width/2+100, height/2-50, 100, 200, PI-rads, TWO_PI+rads, OPEN);
      
    strokeWeight(15);
    liney = height/2-50 + 100*sin(PI-rads);
    
    //boundaries for the eyelids
    if (mouseY >= height/2+55) {
      liney = ylimit+25;
    }
    else if(mouseY <= height/2-180) {
      liney = ylimit-80;
    }
    else if (mouseY <= height/2-130) {
      liney = ylimit-((height/2-100)-mouseY);
    }
      
    line(width/2-170, liney, width/2-30, liney);
    line(width/2+30, liney, width/2+170, liney);
  }
}


