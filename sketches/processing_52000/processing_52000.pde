
//K.I.T.T


float v;
float xpos;
float xpos2;
float xdirection = 9;
float ypos;
float ydirection = 3; 
float xh; 
float yh;


void setup () {
  size (700, 400);
  xpos = width/2 ;
  xpos2 = width/2;
  v = width/7;
  ypos = height/4;
  xh = width/7;
  yh = height/4;
    rectMode(CENTER);
    noStroke();
}

void draw () {
  fill(0, 05);
  rect(width/2, height/2, 700, 400);


  if ((mouseY<=height/2-30) || (mouseY>=height/2+30)) {
    fill(50, 20);
    rect(width/2, height/2, v*4, 20);

    xpos = xpos + xdirection;

    println(mouseY);
  }
  else if ((mouseY>=height/2-30) || (mouseY<=height/2+30)) {
    strokeWeight(1);
    fill(150, 50, 20);
    rect(xpos, height/2, 50, 20);
    xpos =xpos + xdirection;
    fill(150, 10, 10, 10);
    rect(width/2, height/2, 400, 20);
    //lights1
    fill(50, 20);
    //    rect(v*5.40, height/3, 80, ypos*.5);
    //    rect(v*1.60, height/3, 80, ypos*.5); 
    ypos = ypos + ydirection;
  }
  if  (xpos>=v*5.25) 
  {
    xdirection = xdirection*-1;
  }
  if (xpos<=v*1.75) {
    xdirection = xdirection *-1;
  }
  if (ypos>= 150)
  {
    ydirection = ydirection*-.5;

    //lights on
    strokeWeight(.5);
    stroke (220,99);
    fill(255);
    ellipse(v*6.20, height/3, 70, 60);
    ellipse(v*.60, height/3,70, 60);
    fill (220, 99);
    //    rect (v*5.40, height/3, 60, 50);
    //    rect (v*1.60, height/3, 60, 50);
    rect(width/2, height/2, 700, 400);
    quad(v*5.90, height/2+50, v*6.50,height/2+50, 720,400,350,500);
    quad(v*.30, height/2+50, v*.90,height/2+50, 260,400,-20,400);
    stroke (0,100);
  }
}
          
                
