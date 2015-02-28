
// Allen
//July 9, 2013
//Bouncing Ball
//Reference:???
void setup(){//background
  size(500,500);//size
  background(0);//color
  frameRate(60);//framerate
}

int dx = 2;//slope x
int dy = 3;//slope y

int x = 50;//beg x
int y = 50;//beg y

void draw(){//shape
    fill(0);//color
    rect(0,0,500,500);//take away trail
    fill(255);//color
    ellipse(x,y,25,25);//circle
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){//bounce off wall x
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){
       dy = -1 * dy;  //bounce off wall y
    }
if (mousePressed == true){//if click
  x=mouseX;//ball to x where mouse is
  y=mouseY;//ball to y where mouse is
}

}
