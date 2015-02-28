
class Dood {
  int x,y;
  int jumpHeight;
  int yAtJump;
  boolean jumping, falling;
  boolean rebounded, beingHit;
  PImage imgL;
  PImage imgHitL;
  PImage imgR, imgHitR;
  int counterHit;
  int hp;
  int accel;
  char facing;
  String vColor;
  final static int L = 0;
  final static int R = 1;
  final static int J = 2;
  boolean[] keys;
  char[] assigns;
  int roundWin;
  
  Dood(int x,int y,int jumpHeight, String vColor, char facing, char l, char r, char j) {
    this.x = x;
    this.y = y;
    imgR = loadImage(vColor+"dood.png");
    imgHitR = loadImage(vColor+"doodXP.png");
    imgL = loadImage(vColor+"dood_flip.png");
    imgHitL = loadImage(vColor+"doodXP_flip.png");
    this.vColor = vColor;
    this.jumpHeight = jumpHeight;
    this.facing = facing;
    hp = 3;
    yAtJump = y;
    jumping = false;
    falling = false;
    rebounded = false;
    beingHit = false;
    counterHit = 0;
    keys = new boolean[3];
    assigns = new char[3];
    assigns[L] = l;
    assigns[R] = r;
    assigns[J] = j;
    roundWin = 0;
  }
  void setAssing(int pos, char value)
  {
    assigns[pos] = value;
  }
  boolean collision(Dood other) {
   if(over(other))   
      if(y+70 > other.y)
      if(falling && !rebounded)
      {
        other.hp--;
        other.beingHit = true;
        other.counterHit = 0;
        return true;
      }
      return false;
  }
  boolean over(Dood other)
  {
    if(x >= other.x && x <= other.x+62)
      return true;
    else if(x < other.x && x+62 >= other.x)
      return true;
    return false;
  }
  void drawDood()
  {
    textFont(f, 48);
    text("HP:"+hp,x+12,y-10);
    if(facing == 'L')
    {
      if(!beingHit)
        image(imgL, x,y);
      else
        image(imgHitL, x, y);
    }
    else
    {
      if(!beingHit)
        image(imgR, x,y);
      else
        image(imgHitR, x, y);
    }
    counterHit++;
    if(counterHit >= 25)
      beingHit = false;
  }
  void jump(Dood other, int jumpHeight) {
    y-=8;
    if(y <= yAtJump-jumpHeight){
      jumping = false;
      falling = true;
    }
  }
  void fall(Dood other) {
    y+=8;
    if(collision(other) && other.hp > 0 && hp > 0 && !rebounded) {
       rebounded = true;
       yAtJump = y;
       jumping = true;
       falling = false;
    }
    if(y == 280) {
     falling = false;
     rebounded = false;
    }
  }
  void left() {
    if(facing == 'R')
      accel = 0;
    else
    {
      if(x+62 > 0) {
         x -= 6+accel/2;
      }
      else
        x = width;
      if(accel < 20)
        accel++;
    }
    facing = 'L';
  }
  void right() {
    if(facing == 'L')
      accel = 0;
    else
    {
      if(x<width) {
          x += 6+accel/2;
      }
      else
        x = -62;
      if(accel < 20)
        accel++;
    }
    facing = 'R';
  }
}

