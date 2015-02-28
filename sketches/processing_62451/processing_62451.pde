
Player player;

int enemyCount = 2;
int flenemyCount = 2;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.7;
float index = 0;
Enemy[] enemies = new Enemy[enemyCount];
flyingEnemy[] flenemies = new flyingEnemy[flenemyCount];
void setup() {
  size(640,360);
  noStroke();
  player = new Player();
  for (int i = 0; i < enemyCount; i++) {
    float speed = random(0.6,2.5);
    enemies[i] = new Enemy(random(width), height*0.5, 10, i, enemies);
    
  }
  for (int i =0; i< flenemyCount; i++) {
    float speed = random(0.6,2.5);
    flenemies[i] = new flyingEnemy(random(width), height*0.5, 10, i, flenemies);
  }
}
void draw(){
  background(255);
  stroke(0);
  for (int i = 0; i < enemyCount; i++) {
    enemies[i].collide();
    enemies[i].move();
    enemies[i].display();
  }  
    for (int i = 0; i < enemyCount; i++) {
    flenemies[i].move();
    flenemies[i].display();
  } 
    player.display();
    player.move();
    player.keyPressed();
  
}




