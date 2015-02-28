
float x = 300; // horizontal position of bomb
float y = 90; // vertical position of bomb

float vx=3; // horizontal speed of bomb
float vy=2; // vertical speed of bomb

float tank_x = 200; // horizontal position of tank
float tank_vx = -1; // horizontal speed of tank
int how_many_tanks_exploded = 0;

int level = 1;
int stage = 1;

PImage background_image,bomb_image;
PImage tank_explosion1_image,tank_explosion2_image,tank_image;

int tank_width,tank_height;
int explosion_frame = 0;
int explosion_subframes = 0;
int bombs_remaining = 1;

int message_frames_remaining = 60*5;
String current_message = "Level 1 - Stage 1";

int line_height;

void setup() // do this once at the beginning
{
  size( 400, 300 ); // size of the world, in pixels
  //orientation(LANDSCAPE);

  bomb_image = loadImage("bomb.gif");
  background_image = loadImage("bg1.png");
  tank_image = loadImage("Tanks.gif");
  tank_explosion1_image = loadImage("tank_explosion1.gif");
  tank_explosion2_image = loadImage("tank_explosion2.gif");
  
  tank_width = width/5;
  tank_height = int( (tank_width/float(tank_image.width)) * tank_image.height );
  
  line_height = height/4;
}

void draw() // do this again and again
{
  image(background_image, 0,0,width,height);
  
  if(message_frames_remaining>0)
    show_message();
  else
  {
    draw_things();
    update();
  }
}

void draw_things()
{
  image(bomb_image, x,y,bomb_image.width/8,bomb_image.height/8);
  switch(explosion_frame)
  {
    case 0: image(tank_image,tank_x,height-tank_height,tank_width,tank_height); break;
    case 1: image(tank_explosion1_image,tank_x,height-tank_height,tank_width,tank_height); break;
    case 2: image(tank_explosion2_image,tank_x,height-tank_height,tank_width,tank_height); break;
    default: break;
  }
      
  stroke(255,255,255,50);
  strokeWeight(10);
  line(0,line_height,width,line_height);
  
  fill(255,255,255);
  textSize(20);
  textAlign(LEFT);
  text("Tanks exploded: "+how_many_tanks_exploded,20,20);
  text("Bombs remaining: "+bombs_remaining,20,40);
}

void show_message()
{
  textAlign(CENTER);
  int tx=width/2,ty=height/2;
  textSize(40);
  fill(0,0,0,100);
  text(current_message,tx+3,ty+3);
  fill(255,255,255);
  text(current_message,tx,ty);
  message_frames_remaining--;
}

void update()
{
  // move bomb
  x = x + vx;
  y = y + vy;

  // move tank
  tank_x = tank_x + tank_vx;

  // gravity on bomb
  vy = vy + 0.1;
  
  // if exploding, continue
  if(explosion_frame>0)
  {
    explosion_subframes--;
    if(explosion_subframes<=0)
    {
      explosion_subframes = 3;
      explosion_frame++;
    }
  }

  // has the bomb hit the tank?
  if(explosion_frame==0 && y>height-tank_height && y<height
     && x>tank_x && x<tank_x+tank_width)
  {
    // explosion
    explosion_frame = 1;
    explosion_subframes = 3;
    how_many_tanks_exploded++;
    if(how_many_tanks_exploded==5)
    {
      stage++;
      
      if(stage==5) {
        level++;
        stage = 1;
        current_message = "Level "+level+" - Stage "+stage;
      }
      else
        current_message = "Stage "+stage;
        
      message_frames_remaining = 60*5;
      how_many_tanks_exploded = 0;
      tank_vx = tank_vx - 1;
    }
  }
  
  // teleport tank
  if(tank_x<-tank_width)
  {
    tank_x = width;
    explosion_frame = 0;
    bombs_remaining = 1;
  }
}

void mousePressed()
{
  // if showing a message then do nothing
  if(message_frames_remaining>0)
    return;
    
  // click to drop a bomb
  if(mouseY<line_height && bombs_remaining>0)
  {
    x = mouseX;
    y = mouseY;
    vy=0;
    vx=0;
    bombs_remaining--;
  }
}


