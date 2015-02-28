
//asignment 7, wrap initials / mouse speed
// Copyright Felipe Castelblanco, October, 2011

float x, y, speedX, speedY, dt, deltaX, deltaY, easing;

void setup()
{
    size(400, 400);
    x = width/2;
    y = height/2;
    deltaX = 1; //movement X
    deltaY = 1; //movement Y
    dt = width*.2; //diameter initials
    easing = 0.01; //slows down movement of initials
    ellipseMode(CORNER);//sets ellipse to corner mode in order to align initials inside the circle
    smooth();
    stroke(40);
   
}

void draw()
{
    prepScreen ();
    moveInitials();
    drawinitials();
    mouseSpeed(); 
    speedinfo();
  
}

void mouseSpeed()
{
  
// finds difference between mouse and previous mouse. Then assins value to speed X function
    speedX = (mouseX - pmouseX ) * easing ; //  Slows donw by multipliying the easing function
    speedY = (mouseY - pmouseY) * easing; //  Slows donw by multipliying the easing function
    
    if (speedX < mouseX) // if dif less than mouseX
    {
      deltaX = deltaX + speedX ; // add to delta the result of the dif between mouseX and Previous mouse X. Slows donw by multipliying the easind function 
    }
    if (speedY < mouseY) // if dif less than mouseX
    {
      deltaY = deltaY + speedY ; // add to delta the result of the dif between mouseX and Previous mouse Y. 
    }
  
  
}

void moveInitials() //wraping function
{
   /****** Horizontal wrap *********/
   x = x + deltaX;
     if(x > width + dt/2) // if initials too far right, return to left side
      {
       x =  - dt/2; 
      }
      if(x < -dt/2) // if initals too far left, retunr to right
      {
        x = dt/2 + width;
       }
   
   
  /****** Vertical warp *********/
  y = y + deltaY;
  
    if(y > height + dt/2) //if initials too far down, return to top
    {
      y = -dt/2;
    }
    
    if (y < -dt/2) //if initials too far up, return down
    {
      y = height + dt/2;
    }
    
}

void prepScreen () 
{

fill(200, 200, 25, 50); //color background with 50% opacity
rect (0,0, width, height);

}

void speedinfo()
{

fill(0);  
text ("Vertical Speed: " + deltaY, width*.1, height*.8); //prints speed values on the screen
text ("Horizontal Speed: " + deltaX, width*.1, height*.9); //prints speed values on the screen
  
}

void keyPressed () 
{
  
//puts initials in "ALMOST" the centerof the screen. this is because the Ellipse Mode is adjust to "CORNER"
  x = width/2 - dt/2; 
  y = height/2 - dt;
  
  deltaX = 0; //stops speed
  deltaY = 0; //stops speed
  
}

////initials//////

void drawinitials()
{
  
fill(200,10,250);
ellipse(x + .25*dt, y + .25*dt, dt, dt);

//f
beginShape();
    curveVertex(x + .60*dt, y - .28*dt);
    curveVertex(x + .60*dt, y + .28*dt);
    curveVertex(x + .60*dt, y + .50*dt);
    curveVertex(x + .55*dt, y + .50*dt);
    curveVertex(x + .45*dt, y + .50*dt);
    curveVertex(x + .40*dt, y + .60*dt);
    curveVertex(x + .40*dt, y + .65*dt);
    curveVertex(x + .45*dt, y + .70*dt);
    curveVertex(x + .60*dt, y + .70*dt);
    curveVertex(x + .60*dt, y + .75*dt);
    curveVertex(x + .60*dt, y + .85*dt);
    curveVertex(x + .45*dt, y + .90*dt);
    curveVertex(x + .45*dt, y + dt);
    curveVertex(x + .45*dt, y + (dt + .13*dt));
    curveVertex(x + .40*dt, y + (dt + .20*dt)); 
endShape();
//C
beginShape();
    curveVertex(x + .80*dt, y - .25*dt);
    curveVertex(x + .90*dt, y + .28*dt);
    curveVertex(x + .95*dt, y + .60*dt);
    curveVertex(x + .80*dt, y + .60*dt);
    curveVertex(x + .75*dt, y + .50*dt);
    curveVertex(x + .70*dt, y + .50*dt);
    curveVertex(x + .68*dt, y + .65*dt);
    curveVertex(x + .68*dt, y + .75*dt);
    curveVertex(x + .70*dt, y + .85*dt);
    curveVertex(x + .70*dt, y + .90*dt);
    curveVertex(x + .72*dt, y + .95*dt);
    curveVertex(x + .82*dt, y + .95*dt);
    curveVertex(x + .82*dt, y + .80*dt);
    curveVertex(x + .95*dt, y + .80*dt);
    curveVertex(x + .95*dt, y + dt);
    curveVertex(x + .90*dt, y + (dt + .10*dt));
    curveVertex(x + .80*dt, y + (dt + .23*dt));
    curveVertex(x + .70*dt, y + (dt + .25*dt)); 
endShape();
//O
noFill();
ellipse(x + dt+7, y + .5*dt, .04*dt, .5*dt);
}


