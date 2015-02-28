
Ball[] Ball=new Ball[20];

void setup (){
size(800,800);
for (int i=0; i <20; i++) {         
 Ball[i]=new Ball();
}

}

void draw(){
background(100);
for (int i=0; i <20; i++) {         
Ball[i].draw_ball();
Ball[i]. move_ball();
}
//snowman total height=175
//snowman total width=120

}
class Ball {
color c;
float xpos;
float ypos;
int snowman_size;
boolean fromlefttoright;
boolean toptobottom;

Ball() {
c = color(255);
xpos= random(width);
ypos= random(height);
snowman_size=1;
}

void draw_ball() {
//snowmann
fill(255);
stroke(0);

///left hand
line(xpos-(60*snowman_size),ypos-(50*snowman_size),xpos-0,ypos-(10*snowman_size));

///right hand
line(xpos+(60*snowman_size),ypos-(50*snowman_size),xpos-0,ypos-(10*snowman_size));

///body-biggest
fill(255);
ellipseMode(CENTER);
ellipse(xpos,ypos+(50*snowman_size),(100*snowman_size),(100*snowman_size));

///body-smallest
fill(255);
ellipseMode(CENTER);
ellipse(xpos,ypos-(10*snowman_size),(70*snowman_size),(70*snowman_size));

///head
fill(255);
ellipseMode(CENTER);
ellipse(xpos,ypos-(50*snowman_size),(50*snowman_size),(50*snowman_size));


///Eyes
fill(0);
ellipseMode(CORNER);
ellipse(xpos-(20*snowman_size),ypos-(60*snowman_size),(10*snowman_size),(10*snowman_size));
ellipse(xpos,ypos-(60*snowman_size),(10*snowman_size),(10*snowman_size));
//makes it bounce
}


void move_ball(){
  
 //xmovement 
if (fromlefttoright) {
xpos = xpos+1;
if (xpos>=width-60) fromlefttoright = false;
}
else {
xpos = xpos-1;
if (xpos<=60) fromlefttoright = true;


//y movement
if (toptobottom) {
ypos = ypos+1;
if (ypos>=height-100) toptobottom = false;
}
else {
ypos = ypos-1;
if (ypos<=75) toptobottom = true;
}
}
}
}


