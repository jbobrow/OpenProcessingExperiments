
//copyright Sophie Vennix, siv
//Homework3
//1.22.14

float x,y,w,h;
{
  x=200;
  y=200;
  w=50;
  h=50;
}


void setup()
{  
   size(400,400);
   //noCursor();
}

void draw()
{ 
    x=mouseX;
    y=mouseY;
    fill(0,10);
    rectMode(CORNER);
    rect(0,0, width, height); 
    
    //head//
    fill(255,206,64);
    noStroke();
    ellipse(x,y, w,h);

    //eyes//
    fill(0);
    ellipse(x-.10*w,y-.10*h, .06*w,.06*h);
    ellipse(x+.10*w,y-.10*h, .06*w,.06*h);

    //mouth//
    noFill();
    stroke(0);
    strokeWeight(2);
    arc(x,y-.20*h, .80*w, .80*h, .20*PI, .80*PI);
}



