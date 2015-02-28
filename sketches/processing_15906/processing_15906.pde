
// 20 bouncing lama's if you click hats will appear and the color of the eyes chance with their position
 
// make array of 20 objects 
Lama[] Lamas = new Lama[20]; 
 
void setup() {
  // set the size of the window
  size(500,500);
  smooth();
  for (int i = 0; i < Lamas.length; i ++) {
   /* lama with start position x, start position y, random color of the hat, 1 for the bounce, random x speed and random y speed
      and giving them a value*/
    Lamas[i] = new Lama
      (200, 200, color(int(random(0,255)),int(random(0,255)),int(random(0,255))), 1,int(random(1,4)),int(random(1,4)));
  }
}
 
void draw() {
  // the background color
  background(55,160,20);
  // loop and executes the voids move, colission and display
  for (int i = 0; i <Lamas.length; i ++) {
    Lamas[i].move();
    Lamas[i].colission();
    Lamas[i].display();
  }
}
 
// making the class lama 
class Lama { 
  // the variables
  int x = int(random(65,435));
  int y = int(random(55,445));
  color c;
  color c2;
  float s;
  int xdirection=1;
  int ydirection=1;
  int xspeed;
  int yspeed;
 
 
 // the function lama with start position x, start position y, random color of the hat, 1 for the bounce, random x speed and random y speed
  Lama(int x, int y, color hat,float bounce, int xs, int ys) {
    // declaring the variables
    x=x;
    y=y;
    c=color(hat);
    c2 = color(255,153,0);
    s=bounce; 
    xspeed = xs;
    yspeed = ys;
    // makes the lama half the size
    s=0.5;
  }
 
 
// how the lama moves, and makes it bounce against the wall 
  void move() {
    x += xdirection*xspeed;
    y += ydirection*yspeed;
    // the bounce on the x-axes
    if (x > width-60*s || x<60*s) {
      // chances the direction if it hits the wall
      xdirection=-xdirection;
    }
    // the bounce on the y-axes
    if (y > (height-50*s) || y<50*s) {
      // chances the direction if it hits the wall
      ydirection=-ydirection;
    } 
  }
 
 // letting the lama's collite
  void colission() {
    // loop
    for(int i = 0; i < Lamas.length ; i++)
    {
      //creates other virtual lama's to compare
      Lama Lamas2 = Lamas[i]; 
      // check if there are other lama's
      if(Lamas2 != this) 
      {
        // calculates the distance between the lama's
        float totalsize = Lamas2.s*35 + s*35; 
        // if this is true they collite
        int xdis = abs((Lamas2.x+int(60*Lamas2.s))-int(x+60*s));
        int ydis = abs((Lamas2.y+int(50*Lamas2.s))-int(y+50*s));
        // when the creatures collite
        if (abs(xdis) < abs(totalsize) && abs(ydis)<abs(totalsize)) 
        {
          // if the lama's collite in the x-axes they go to direction -x
          if (abs(xdis)>abs(ydis)) 
          {
            xdirection = -xdirection;
            // when two or more lama's overlap move them away from each other so that they wouldn't get stuck
            while (abs(xdis)<abs(totalsize)) 
            {
              if(x>Lamas2.x)
              {
                x++;
                Lamas2.x--;
              }
              else
              {
                x--;
                Lamas2.x++;
              }
              xdis = abs((Lamas2.x+int(60*Lamas2.s))-int(x+60*s));
            }
          }
           // if the lama's collite in the y-axes they go to direction -y
          else if(abs(ydis)>abs(xdis))
          {                              
            ydirection= -ydirection;
            // when two or more lama's overlap move them away from each other so that they wouldn't get stuck
            while (abs(ydis)<abs(totalsize)) 
            {
              if(y>Lamas2.y)
              {
                y++;
                Lamas2.y--;
              }
              else
              {
                y--;
                Lamas2.y++;
              }
              ydis = abs((Lamas2.y+int(50*Lamas2.s))-int(y+50*s));
            }
          }
          // when two lama's hit each other they both move in the other direction
          else 
          {
            xdirection = -xdirection;
            ydirection= -ydirection;
          }
        }
      }
    }
  }
 
 
  //draw  the Lama
  void display() {
    fill(c2);
    ellipseMode(CENTER);
 
    rect(x-30*s,y-40*s,10*s,40*s);
    ellipse(x-33*s,y-40*s,30*s,15*s);
 
    // body
    ellipse(x,y,60*s,50*s);
 
    //legs
    line(x-15*s,y+10*s,x-20*s,y+50*s);
    line(x-10*s,y+23*s,x,y+50*s);
    line(x+10*s,y+10*s,x+13*s,y+50*s);
    line(x+15*s,y+21*s,x+23*s,y+50*s);
 
    //tail
    line(x+30*s,y,x+45*s,y+5*s);
    line(x+38*s,y+3*s,x+44*s,y+2*s);
    line(x+37*s,y+3*s,x+42*s,y+8*s);
 
    //eye
    fill(x+75,y+75,20);
    ellipse(x-28*s,y-42*s,3*s,6*s);
 
    //when the mouse is pressed
    if(mousePressed) {
      //hoedje
      fill(c);
      triangle(x-35*s,y-46*s,x-25*s,y-60*s,x-17*s,y-42*s);
    }
  }
}



                
                                
