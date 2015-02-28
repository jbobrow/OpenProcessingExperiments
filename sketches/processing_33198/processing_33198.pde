
int monster_x = 100;
int monster_Y = 10;
int cola_x = 20;
int cola_Y = 10;
int speed_cola = 20;
int speed_monster = 20;


void setup() {
  size ( 600, 600);
}

void draw() {
  
  PImage back;
  back = loadImage ("back.jpg");
  background (back);
  PImage monster;
  monster = loadImage ("monster.png");
  PImage monster_inverse;
  monster_inverse = loadImage ("monsteri.png");
  PImage cola;
  cola = loadImage ("cola.png");
  PImage cola_inverse;
  cola_inverse = loadImage ("colai.png");
  PImage wtf_left;
  wtf_left = loadImage ("TheFL.jpg");
  PImage wtf_right;
  wtf_right = loadImage ("TheFR.jpg");
  PImage cola_2;
  cola_2 = loadImage ("cola.png");
  PImage monster_2;
  monster_2 = loadImage ("monster.png");
  PImage monster_inverse2;
  monster_inverse2 = loadImage ("monsteri.png");
  PImage cola_inverse2;
  cola_inverse2 = loadImage ("colai.png");
  
   if ((mouseX < 45) && (mouseY < 45)) {
   image(wtf_left, 0, 0);
}
 if ((mouseX > width - 45) && (mouseY < 45)) {
   image(wtf_right, 300, 0);
 }
  
    if ((mouseX > 435) && (mouseY > 465)) {
   cola = monster_2;
   monster = cola_2;
   monster_inverse = cola_inverse2;
   cola_inverse = monster_inverse2;
    }
    
      if (speed_monster < 0){
    monster = monster_inverse;
  }
  if (speed_cola < 0){
    cola = cola_inverse;
  }
    
  image(cola, cola_x, cola_Y);
  image(monster, monster_x, monster_Y);
  
  cola_x = cola_x + speed_cola;
  monster_x = monster_x + speed_monster;
  
  if ((cola_x < -50) || (cola_x > 600)){
    speed_cola = speed_cola * -1;
    cola_Y = cola_Y + 75;
  }
  if ((monster_x < -50) || (monster_x > 600)){
    speed_monster = speed_monster * -1;
    monster_Y = monster_Y + 75;
  }
  if (monster_Y > 600){
    monster_Y = 10;  
  }
  if (cola_Y > 600){
    cola_Y = 10;  
  }
    
}

