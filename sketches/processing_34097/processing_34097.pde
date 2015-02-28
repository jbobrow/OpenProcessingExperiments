
float click = 0.0;
int yoyosize = 40;
int away = 40;
int speed = 5;
int gravity = 10;
int fingersize = 10;

int xpos = 0;
int ypos = 0;

int dottrack = 0;
int wayxpos = 0;
int wayypos = 0;

int linex = 0;
int liney = 0;

void setup() {
  size(700, 400);
}

void draw() {
  background(0);
  stroke(255);
  line(xpos-away, ypos-away,linex,liney);
  ellipse(xpos-away, ypos-away, yoyosize, yoyosize); 
  
  ypos = ypos + gravity;
  
  if(dottrack > 0) {
    stroke(255,0,0);
    ellipse(wayxpos, wayypos, fingersize, fingersize);
    
  }
}

void mouseMoved(){
  xpos = mouseX + speed;
  ypos = mouseY + speed + gravity;
}

void mouseClicked() {
  if(dottrack == 0){
    dottrack = 1;
    wayxpos = mouseX;
    wayypos = mouseY;
    liney = wayypos;
    linex = wayxpos;
  }
}


