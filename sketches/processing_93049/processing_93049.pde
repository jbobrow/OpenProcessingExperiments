
Obj player, pirate1, pirate2, pirate3;
Obj [] islands;
int score, highscore, target;

void setup() {
  size(600, 500);
  smooth();
  highscore = 0;
  score = 0;
  start_game();
}

void draw() {
  background(40, 130, 160);
  
  //draw islands
  fill(230, 230, 180);
  for(int i=0; i<10; i++) {
    ellipse(islands[i].x, islands[i].y, islands[i].r, islands[i].r);
  }
  
  //draw ships
  fill(120, 100, 70);
  ellipse(player.x, player.y, player.r, player.r);
  fill(70);
  ellipse(pirate1.x, pirate1.y, pirate1.r, pirate1.r);
  ellipse(pirate2.x, pirate2.y, pirate2.r, pirate2.r);
  ellipse(pirate3.x, pirate3.y, pirate3.r, pirate3.r);
  
  //draw text
  textSize(18);
  fill(255);
  textAlign(LEFT, BOTTOM);
  text("Score: " + score, 10, 5, width-20, height-10);
  textAlign(RIGHT, BOTTOM);
  text("Best: " + highscore, 10, 10, width-20, height-10);
  fill(200, 25, 45);
  textAlign(CENTER, CENTER);
  text("X", islands[target].x, islands[target].y);
  
  //check for collisions
  for(int i=0; i<10; i++) {
    if(colliding(player, islands[i])) {
      if(i==target) {
        score++;
        target = int(random(10));
      }
      bounce(player);
    }
    
    if(colliding(pirate1, islands[i])) bounce(pirate1);
    if(colliding(pirate2, islands[i])) bounce(pirate2);
    if(colliding(pirate3, islands[i])) bounce(pirate3);
  }
  
  if(colliding(player, pirate1) || colliding(player, pirate2) ||
     colliding(player, pirate3)) start_game();
     
  //adjust movement
  player.xdir = (player.xdir/2) - (player.x - mouseX)/1.2;
  player.ydir = (player.ydir/2) - (player.y - mouseY)/1.2;
  
  //pirate one will go straight for the player
  pirate1.xdir = (pirate1.xdir/2) - (pirate1.x - player.x)*2/3;
  pirate1.ydir = (pirate1.ydir/2) - (pirate1.y - player.y)*2/3;
  
  //pirate two will get between the player and the treasure
  pirate2.xdir = (pirate2.xdir/2) - (pirate2.x - player.x)/2
                                  - (pirate2.x-islands[target].x)/3;
  pirate2.ydir = (pirate2.ydir/2) - (pirate2.y - player.y)/2 
                                  - (pirate2.y-islands[target].y)/3;
  
  //pirate three will mirror the player's movements somewhat
  pirate3.xdir = (pirate3.xdir/2) - (pirate3.x - player.x)/3
                                  + (player.xdir)/3;
  pirate3.ydir = (pirate3.ydir/2) - (pirate3.y - player.y)/3 
                                  + (player.ydir)/3;
  
  move(player);
  move(pirate1);
  move(pirate2);
  move(pirate3);
}

boolean colliding(Obj a, Obj b) {
  return (abs(a.x-b.x) < max(a.r, b.r)) && (abs(a.y-b.y) < max(a.r, b.r));
}

void bounce(Obj o) {
  if(o.xdir < 0) o.x++;
  else o.x--;
  if(o.ydir < 0) o.y++;
  else o.y--;
  o.xdir = 0;
  o.ydir = 0;
}

void move(Obj o) {
  if(abs(o.xdir) < 75) {
    if(o.xdir < 0) o.x -= .5;
    else o.x += .5;
  }
  else o.x += o.xdir/200;
  
  if(abs(o.ydir) < 75) {
    if(o.ydir < 0) o.y -= .5;
    else o.y += .5;
  }
  else o.y += o.ydir/200;
}

void start_game() {
  if(score > highscore) highscore = score;
  score = 0;
  target = int(random(8));
  
  player = new Obj(width/2, height/2, 15);
  pirate1 = new Obj(20, 20, 15);
  pirate2 = new Obj(width-20, 20, 15);
  pirate3 = new Obj(width/2, height-20, 15);
  
  islands = new Obj [10];
  for(int i=0; i<10; i++) {
    int random_x = int(random(20, width-20));
    int random_y = int(random(20, height-20));
    islands[i] = new Obj(random_x, random_y, 20);
  }
}

class Obj{
  float x, y, r, xdir, ydir;
  
  Obj(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    xdir = 0;
    ydir = 0;
  }
}


