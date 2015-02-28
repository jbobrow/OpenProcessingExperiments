
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;


//declare variables
float x, y, xD, yD, xVel, yVel,xOld, yOld, w, wOld, fade;
float spring = 0.01;
float damp = 0.95;

void setup () {
  size (1980,1020);
  smooth ();
    background(#FFFFFF);
}

void draw () {
  if (keyPressed == true){
  background (255);
}
  if (button1) {
    //pass on previous position and line width
    xOld = x;
    yOld = y;
    wOld = w;

    //calculate distance and springing 
    xD = (mouseX - x) * spring;
    yD = (mouseY - y) * spring;

    //calculate velocity and damping
    xVel = (xVel + xD) * damp;
    yVel = (yVel + yD) * damp;

    //calculate position;
    x+=xVel;
    y+=yVel;

    //only draw on mousedown, overall this part has some ugly code but it works
    if(mousePressed == true) {
      //fade in the line opacity
      fade+=5;
      fade=min(fade,100);
      //fade in the line width
      w+=0.5;
      w=min(w,xVel*fade/50); //should probably be based on window size to be fully dynamic
    }
    else {
      //fade out the line opacity
      fade-=3;
      fade=max(fade,0);
      //fade out the line width
      w=xVel*fade/50;
    }

    //draw the line
    fill(0,154,233,fade-50);
    noStroke();
    quad(xOld-wOld, yOld, x-w, y, x+w, y, xOld+wOld, yOld);

    //draw the outline
    stroke(0,154,233,fade);
    line(xOld-wOld, yOld, x-w, y);
    line(xOld+wOld, yOld, x+w, y);
  }

else if (button2) {
  //pass on previous position and line width
    xOld = x;
    yOld = y;
    wOld = w;

    //calculate distance and springing 
    xD = (mouseX - x) * spring;
    yD = (mouseY - y) * spring;

    //calculate velocity and damping
    xVel = (xVel + xD) * damp;
    yVel = (yVel + yD) * damp;

    //calculate position;
    x+=xVel;
    y+=yVel;

    //only draw on mousedown, overall this part has some ugly code but it works
    if(mousePressed == true) {
      //fade in the line opacity
      fade+=5;
      fade=min(fade,100);
      //fade in the line width
      w+=0.5;
      w=min(w,xVel*fade/50); //should probably be based on window size to be fully dynamic
    }
    else {
      //fade out the line opacity
      fade-=3;
      fade=max(fade,0);
      //fade out the line width
      w=xVel*fade/50;
    }

    //draw the line
    fill(228,156,0,fade-50);
    noStroke();
    quad(xOld-wOld, yOld, x-w, y, x+w, y, xOld+wOld, yOld);

    //draw the outline
    stroke(228,156,0,fade);
    line(xOld-wOld, yOld, x-w, y);
    line(xOld+wOld, yOld, x+w, y);
}

else if (button3) {
  //pass on previous position and line width
    xOld = x;
    yOld = y;
    wOld = w;

    //calculate distance and springing 
    xD = (mouseX - x) * spring;
    yD = (mouseY - y) * spring;

    //calculate velocity and damping
    xVel = (xVel + xD) * damp;
    yVel = (yVel + yD) * damp;

    //calculate position;
    x+=xVel;
    y+=yVel;

    //only draw on mousedown, overall this part has some ugly code but it works
    if(mousePressed == true) {
      //fade in the line opacity
      fade+=5;
      fade=min(fade,100);
      //fade in the line width
      w+=0.5;
      w=min(w,xVel*fade/50); //should probably be based on window size to be fully dynamic
    }
    else {
      //fade out the line opacity
      fade-=3;
      fade=max(fade,0);
      //fade out the line width
      w=xVel*fade/50;
    }

    //draw the line
    fill(74,229,154,fade-50);
    noStroke();
    quad(xOld-wOld, yOld, x-w, y, x+w, y, xOld+wOld, yOld);

    //draw the outline
    stroke(74,229,154,fade);
    line(xOld-wOld, yOld, x-w, y);
    line(xOld+wOld, yOld, x+w, y);
}
noStroke();
fill (0,154,233);
rect (10,10,30,30);

fill (228,156,0);
rect (10,60,30,30);

fill (74,229,154);
rect (10,110,30,30);

}

void mousePressed () {

  if ((mouseX <50) && (mouseY <50 )) {

    button1 =!button1;
    button2 = false;
    button3 = false;
  }

  else if((mouseX < 50) &&(mouseY < 100 )) {

    button2 =!button2;
    button1 = false;
    button3 = false;
  }
  else if((mouseX < 50) &&(mouseY < 150 )) {

    button3 =!button3;
    button2 = false;
    button1 = false;
  }
}             
