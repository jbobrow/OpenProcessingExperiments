
int radius = 10, direction = 1,time,intervel = 700;
//time and intervel to open and close mouth 
float x = 10, y = 10, speed = 0.5; 
void setup() 
{ 
  size(500,500); 
  smooth(); 
  ellipseMode(RADIUS);
  fill(62,1,124);
  noStroke(); 
  time = millis();//number of milliseconds since program is run...
} 
void draw() 
{ 
  background(175);  
  if((x > width - radius) || (x < radius)) 
     direction = -direction;
  arc(x,y,radius,radius,0.52,5.76);
  if(key == CODED)//when a key is pressed...
  {
    background(175);
    frameRate(13);
    //slows it down a bit (program runs 13 times a second as opposed to 60) 
    //so you can see the mouth close
    if(keyCode == UP)// if the up arrow is pressed... 
      {
        arc(x,y,radius,radius,5.2,10.6);
        if(millis() > time + intervel)
        //milliseconds plus 700 - 700 milliseconds - 
        //if milliseconds is greater than 700 milliseconds
        //something will happen (every 0.7 seconds)
        {
          time = millis();
          arc(x,y,radius,radius,5.18,10.6);
          arc(x,y,radius,radius,5.08,10.7);
          arc(x,y,radius,radius,4.8,10.8);
          arc(x,y,radius,radius,4.5,11);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,4.5,11);
          arc(x,y,radius,radius,4.8,10.8);
          arc(x,y,radius,radius,5.08,10.7);
          //lots of different arcs with the angles geting smaller/bigger 
          //to give the illusion of a mouth opening/closing
        }
        y = y - 1;
        //changes the y value of the arcs every time the draw function is run 
        //so the pacman moves up on the y axis  
       
      }
    else if(keyCode == DOWN)
      {
        arc(x,y,radius,radius,8.4,13.7);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,8.3,13.6);
          arc(x,y,radius,radius,8.2,13.5);
          arc(x,y,radius,radius,8.1,13.4);
          arc(x,y,radius,radius,8,13.3);
          arc(x,y,radius,radius,7.8,14);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,7.8,14);
          arc(x,y,radius,radius,8,13.3);
          arc(x,y,radius,radius,8.1,13.4);
          arc(x,y,radius,radius,8.2,13.5);
        }
        y = y + 1;
      }
    else if(keyCode == RIGHT)
      {
        arc(x,y,radius,radius,0.52,5.76);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,0.52,5.76);
          arc(x,y,radius,radius,0.32,5);
          arc(x,y,radius,radius,0.12,3.5);
          arc(x,y,radius,radius,-3,0);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,-3,0);
          arc(x,y,radius,radius,0.12,3.5);
          arc(x,y,radius,radius,0.32,5);
        } 
        x = x + 1;
      }
    else
      {
        arc(x,y,radius,radius,3.67,8.90);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,3.67,8.90);
          arc(x,y,radius,radius,3.47,9.1);
          arc(x,y,radius,radius,3.37,9.2);
          arc(x,y,radius,radius,3.17,9.4);
          arc(x,y,radius,radius,3.07,9.5);
          arc(x,y,radius,radius,3.17,9.4);
          arc(x,y,radius,radius,3.37,9.2);
          arc(x,y,radius,radius,3.47,9.1);
        }
        x = x - 1;
      } 
    if(x <= 10) 
      x = 10;
    if(x >= width - 10)
      x = width - 10; 
    if(y >= height - 10)
      y = height - 10;
    if(y <= 10)
      y = 10;
    //that's all to make it stop when it reaches the edge of the box.
    //if y = 10 then its stationary. 
    //I made it stop 10 away from the edge because 
    //otherwise half of it goes through the the edge/wall. 
  }
} 



