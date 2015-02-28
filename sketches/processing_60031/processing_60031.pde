
int sx, sy;   
float density = 0.5;   
int[][][] world; 
float dotsize = 33;

int dx=5;
int dy=10;

int blur,turn;
float turn_MAX = 15;

PFont font;

void setup()   
{   
  size(900, 450);  
  frameRate(30);  
  sx = (int)(width/dotsize)+2;  
  sy = (int)(height/dotsize)+1;  
  world = new int[sx][sy][2];   
  smooth();  
  noStroke();  
  fill(51);   
     
  font = loadFont("CourierNew36.vlw");
  textFont(font, 40);
  textAlign(CENTER);   
     
  // Set random cells to 'on'   
  for (int i = 0; i < sx * sy * density; i++) {   
    world[(int)random(sx)][(int)random(sy)][1] = 1;   
  }   
}   
   
void draw()   
{
  background(255);  
  
  update();
  
  if(turn >= turn_MAX ){
    BD();
    turn = 0;
  }else{
    turn++;
  }
  
  if(90<frameCount){
  fill(255,255+90-frameCount);
  }else{
  fill(255,255);
  }
  textFont(font, 42);
  text("Life Game",width/2.0+1,height/2.0+1);
  text("Life Game",width/2.0+1,height/2.0-1);
  text("Life Game",width/2.0-1,height/2.0+1);
  text("Life Game",width/2.0-1,height/2.0-1);
  if(90<frameCount){
  fill(51,255+90-frameCount);
  }else{
  fill(51,255);
  }
  textFont(font, 42);
  text("Life Game",width/2.0,height/2.0);
  
  fill(51);   
  //saveFrame("./data/s_" + frameCount +".png");
}

// Drawing and update cycle
void update(){   
  for (int x = 0; x < sx; x=x+1) {   
    for (int y = 0; y < sy; y=y+1) {
      // Change recommended by The.Lucky.Mutt  
      if ((world[x][y][1] == 1) && (world[x][y][0] == 0)){
        if(turn >= turn_MAX){ world[x][y][0] = 1; }
        ellipse(dotsize*x+dx, dotsize*y+dy, (dotsize-1)*(turn/turn_MAX), (dotsize-1)*(turn/turn_MAX) );
      }else if((world[x][y][1] == -1) && ( world[x][y][0] == 1)){
        if(turn >= turn_MAX){world[x][y][0] = 0;}
        blur = (int)random(-2,2);
        ellipse(dotsize*x+dx, dotsize*y+dy, dotsize-1 + blur, dotsize-1 + blur);
        fill(255);
        ellipse(dotsize*x+dx, dotsize*y+dy, (dotsize-1)*(turn/turn_MAX), (dotsize-1)*(turn/turn_MAX) );
        fill(51);
      }else if ((world[x][y][1] == 1 || world[x][y][0] == 1)) {   
        if(turn >= turn_MAX){ world[x][y][0] = 1; }
        blur = (int)random(-3,4);
        ellipse(dotsize*x+dx, dotsize*y+dy, dotsize-1 + blur, dotsize-1 + blur);
      }  
      if(turn >= turn_MAX){world[x][y][1] = 0; } 
    }   
  }
}

// Birth and death cycle   
void BD(){  
  for (int x = 0; x < sx; x=x+1) {   
    for (int y = 0; y < sy; y=y+1) {
      int count = neighbors(x, y);   
      if (count == 3 && world[x][y][0] == 0){   
        world[x][y][1] = 1;   
      }   
      if ((count < 2 || count > 3) && world[x][y][0] == 1){   
        world[x][y][1] = -1;   
      }
    }   
  }   
}
   
// Count the number of adjacent cells 'on'   
int neighbors(int x, int y)   
{   
  return world[(x + 1) % sx][y][0] +   
         world[x][(y + 1) % sy][0] +   
         world[(x + sx - 1) % sx][y][0] +   
         world[x][(y + sy - 1) % sy][0] +   
         world[(x + 1) % sx][(y + 1) % sy][0] +   
         world[(x + sx - 1) % sx][(y + 1) % sy][0] +   
         world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] +   
         world[(x + 1) % sx][(y + sy - 1) % sy][0];   
}
