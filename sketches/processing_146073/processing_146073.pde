
int speed = 20;

static final int SPRITE_W=32;
static final int SPRITE_H=32;

static final int X_MAX=20;
static final int Y_MAX=15;

int[][] tiles = new int[Y_MAX][X_MAX];

static final int EARTH=0;
static final int GRASS=1;
static final int SKY=2;
static final int HOLE=3;
static final int COIN=4;
static final int PLAYER=5;
static final int ENEMY=6;

int dig_pos_x = 10;
int dig_pos_y = 6;

int enemy_pos_x = 0;
int enemy_pos_y = 5;
int enemy_state = 0;
int enemy_dir = RIGHT;

int dig_dir = DOWN;


void draw_tile( int type, int y, int x )
{
  switch( type )
  {
    case (0) : // brown earth
    {
      strokeWeight(0);
      fill(170,85,0);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case (1) : // grass
    {
      strokeWeight(0);
      fill(65,255,0);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case (2) : // sky
    {
      strokeWeight(0);
      fill(0,125,255);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case 3: // black hole
    {
      strokeWeight(0);
      fill(0,0,0,255);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case 4: // coin
    {
      strokeWeight(0);
      fill(255,255,0,255);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case 5: // player
    {
      strokeWeight(0);
      fill(255,255,255,255);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
    case 6: // enemy
    {
      strokeWeight(0);
      fill(255,0,0,255);
      rect(x,y,SPRITE_W,SPRITE_H);
      break;
    }
  }
}

void setup()
{
  size(640,480);
  
  dig_pos_x = 10;
  dig_pos_y = 6;
  dig_dir = DOWN;
  
  enemy_pos_x = 0;
  enemy_pos_y = 5;
  enemy_state = 0;
  enemy_dir = RIGHT;
  
  for( int Y=0; Y<5; Y++)
  {
    for ( int X=0; X< X_MAX; X++)
    {
      tiles[Y][X]=SKY;
    }
  }
  for( int Y=5; Y<6; Y++)
  {
    for ( int X=0; X< X_MAX; X++)
    {
      tiles[Y][X]=GRASS;
    }
  }
  for( int Y=6; Y<Y_MAX; Y++)
  {
    for ( int X=0; X< X_MAX; X++)
    {
      tiles[Y][X]=EARTH;
    }
  }
  tiles[dig_pos_y][dig_pos_x]=HOLE;
  tiles[dig_pos_y-1][dig_pos_x]=SKY;
  
  for ( int i = 0; i < 6; i++ )
  {
    tiles[int(random(6,Y_MAX))][int(random(X_MAX))]=COIN;
  }
}

int draw_tiles()
{
  int coins = 0;
  for ( int Y=0; Y<Y_MAX; Y++)
  {
    for ( int X=0; X<X_MAX; X++)
    {  
      draw_tile(tiles[Y][X], Y*SPRITE_W, X*SPRITE_H);
      if ( tiles[Y][X]==COIN)
        coins++;
      if ( X==dig_pos_x && Y==dig_pos_y )
        draw_tile( PLAYER, Y*SPRITE_W, X*SPRITE_H);
      if ( X==enemy_pos_x && Y==enemy_pos_y )
        draw_tile( ENEMY, Y*SPRITE_W, X*SPRITE_H);
      
    }
  }
  
  return coins;
}

void keyPressed()
{
  switch( dig_dir )
  {
    case LEFT:
      dig_dir=UP;
      break;
    case UP:
      dig_dir=RIGHT;
      break;
    case RIGHT:
      dig_dir=DOWN;
      break;
    case DOWN:
      dig_dir=LEFT;
      break;
  }
}

void updatePlayer()
{
  switch( dig_dir )
  {
    case LEFT:
      if (dig_pos_x==0)
        break;
      dig_pos_x--;
      tiles[dig_pos_y][dig_pos_x]=HOLE;
      break;
    case UP:
      if (dig_pos_y==6)
        break;
      dig_pos_y--;
      
      tiles[dig_pos_y][dig_pos_x]=HOLE;
      break;
    case RIGHT:
      if ( dig_pos_x==X_MAX-1)
        break;
      dig_pos_x++;
      tiles[dig_pos_y][dig_pos_x]=HOLE;
      break;
    case DOWN:
      if (dig_pos_y==Y_MAX-1)
        break;
      dig_pos_y++;
      tiles[dig_pos_y][dig_pos_x]=HOLE;
      break;
  }
}

void updateEnemy()
{
  switch( enemy_state )
  {
    case 0 :
     enemy_pos_x++;
     if ( enemy_pos_x==10)
     {
       enemy_state=1;
       enemy_dir=DOWN;
     }
     break;
   case 1 :
     {
       
       int enemy_pos_x_new=enemy_pos_x;
       int enemy_pos_y_new=enemy_pos_y;
       switch( enemy_dir )
       {
         case DOWN:
           enemy_pos_y_new=enemy_pos_y+1;
           break;
         case UP:
           enemy_pos_y_new=enemy_pos_y-1;
           break;
         case LEFT:
           enemy_pos_x_new=enemy_pos_x-1;
           break;
         case RIGHT:
           enemy_pos_x_new=enemy_pos_x+1;
           break;
       }
       
       if ( enemy_pos_x_new >=0 && enemy_pos_x_new < X_MAX &&
            enemy_pos_y_new <Y_MAX && enemy_pos_y_new >= 6 &&
            tiles[enemy_pos_y_new][enemy_pos_x_new]==HOLE)
        {
          enemy_pos_x = enemy_pos_x_new;
          enemy_pos_y = enemy_pos_y_new;
        }
        else
        {
          switch( enemy_dir )
          {
            case LEFT :
              enemy_dir=UP;
              break;
            case UP:
              enemy_dir=RIGHT;
              break;
            case RIGHT :
              enemy_dir=DOWN;
              break;
            case DOWN :
              enemy_dir=LEFT;
              break;
          }
        }
     }
     
  }
}

void draw()
{
  int coins = draw_tiles();
  
  if ( coins == 0 || ( dig_pos_x == enemy_pos_x &&
                       dig_pos_y == enemy_pos_y ) )
  {
    //speed *= 0.75;
    setup();
  }
  if ( (frameCount%speed)==0 )
  {
    updatePlayer();
    updateEnemy();
  }
}



