
Player player;
ArrayList<Solid> rocks;
ArrayList<Monster> monsters;
ArrayList<Particle> particles;
ArrayList<Particle2> particle2s;
ArrayList<PImage> special;
ArrayList<String> ending;
PImage img;
PImage bullet;
PImage bulletleft;
PImage bulletright;
PImage bulletRIGHT;
PImage bulletLEFT;
PImage specialbullet;
PImage specialRIGHT;
PImage specialLEFT;
PImage end;
int level=0;
int score=-10000;
int lives=10;
int x=0;
int fireRate=12;
void setup() {
  frameRate(20);
  size(600, 650);  
  monsters = new ArrayList<Monster>();
  rocks = new ArrayList<Solid>();
  particles = new ArrayList<Particle>();
  particle2s = new ArrayList<Particle2>();
  special = new ArrayList<PImage>();
  ending = new ArrayList<String>();
  String bd ="http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_1_6898518979_zps59a599b2.jpg";
  String pic1="http://i30.photobucket.com/albums/c309/x2yimin2x/hugepng_zps167278b8.png";
  String pic2= "http://i30.photobucket.com/albums/c309/x2yimin2x/smallpng_zpsc48cf04f.png";
  String pic3= "http://i30.photobucket.com/albums/c309/x2yimin2x/frame0027_zps0e102dc7.png";
  String pic4= "http://i30.photobucket.com/albums/c309/x2yimin2x/frame0027_zps1135283f.png";
  String pic5= "http://i30.photobucket.com/albums/c309/x2yimin2x/frame0025_zps15533940.png";
  String pic6="http://i30.photobucket.com/albums/c309/x2yimin2x/ufo2-small2_zps29144af9.png";
  String pic7="http://i30.photobucket.com/albums/c309/x2yimin2x/ufo2-small3_zps27cd3255.png";
  String pic8="http://i30.photobucket.com/albums/c309/x2yimin2x/ufo1-boss1_zpse722ad9a.png";
  String play ="http://i30.photobucket.com/albums/c309/x2yimin2x/airplane_zpsa5440afe.gif";
  PImage green =loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/blastwave-green_zpsad13a79c.png");
  PImage blue=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/shock-big_zps0b4a85c8.png");
  PImage purple=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/plasma-explosive-red_zps416fcdfe.png");
  special.add(green);
  special.add(blue);
  special.add(purple);
  end= loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/green-spring-background_zpscde8b03d.jpg");
  bullet =loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/bullet02a_zps057a0fe3.png");
  bulletleft=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_1_7612150579_zps91ede1be.png");
  bulletright=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_1_8895949147_zps1ea0dbe0.png");
  bulletRIGHT=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_2_8234313994_zps68d6ac56.png");
  bulletLEFT=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_3_8281943850_zpsff8d4cfc.png");
  specialbullet=loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/enemybullet03_zps165c1333.png");
  specialRIGHT = loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_2_6510518398_zpsf701e1a3.png");
  specialLEFT = loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/imageedit_3_3792498696_zps3cecfbd5.png");
  img =loadImage(bd);
  player = new Player(width/2, height/2+200, loadImage(play)); 
  Solid comet1 = new Solid(500, 1, loadImage(pic2), 40);
  Solid comet2 = new Solid(500, 1, loadImage(pic3), 40);
  Solid comet3 = new Solid(500, 1, loadImage(pic4), 40);
  Solid comet4= new Solid(500, 1, loadImage(pic4), 40);
  Solid comet5= new Solid(500, 1, loadImage(pic5), 40); // HP, SPEED,IMAGE, RADII
  Solid comet6= new Solid(500, 1, loadImage(pic6), 40);
  Solid comet7= new Solid(500, 1, loadImage(pic7), 40);
  Solid comet8= new Solid(2000, 1, loadImage(pic8), 80);
  rocks.add(comet1); 
  rocks.add(comet2); 
  rocks.add(comet3); 
  rocks.add(comet4); 
  rocks.add(comet5);
  rocks.add(comet6);
  rocks.add(comet7);
  rocks.add(comet8);
  imageMode(CENTER);
}
void draw() {
  if(lives>0){
  
  image(img, width/2, height/2);
  textSize(32);
  text("Score= "+ score, 30, 50);
  text("Lives = " + lives, 400, 50);

  player.render();  // player's ship
  player.fire(fireRate);  //attack speed
  if (keyPressed) {   //player's controls
    if ( key == 'W' || key =='w') {
      player.change(0, -8);
    }
    if (key == 'A' || key== 'a') {
      player.change(-8, 0);
    }
    if (key =='S'|| key== 's') {
      player.change(0, 8);
    }
    if (key =='D' || key== 'd') {
      player.change(8, 0);
    }
  }
  spawn(level);
  allmove();  
  objecthit(); // monsters touches particles ? 
  erase(); // //erase unnecessary objects
  if (x%400==0) { 
    level++;
  }
  if (x!=0 && x%800==0) { 
    for (Solid a : rocks) {
      a.speedup();
    }
  }
  if (score!=0 && score%100000==0) {
    fireRate-=1;
  }
  x++;
  }
  else{
    image(end,width/2,height/2, 600,650);
    fill(0,255,0);
    textSize(50);
    text("Thanks for Playing!", 10,height/2-100);
    text("GAME OVER",10,height/2);
    text("SCORE: " + score,10 , height/2+100);
  }
}
void spawn(int a) {
  int rate = 100-(a*1);
  if (x%rate==0) {

    for ( int number= 7+(a*3);number>0;number--) {
      monsters.add(new Monster(random(600)+20, -random(150), rocks.get((int)random(8) )));
    }
    particle2s.add(new Particle2(random(590)+10, -random(150), special.get((int)random(3))));
  }
}
void erase() {
  for ( int a = 0;a<monsters.size() ;a++) {
    Monster b = monsters.get(a);
    if (b.loc.y>640) {
      monsters.remove(a);
      a--;
      lives--;
    }
  }//decomposer
  for ( int a = 0 ;a<particles.size();a++) {
    Particle b = particles.get(a);
    if (b.loc.y<0 || b.loc.x < -60 || b.loc.x >700) {
      particles.remove(a);
      a--;
    }
  }
} 
void allmove() {
  for ( Monster a: monsters) { // monsters move
    a.render();
  }
  for (Particle b: particles) {  // particles move
    b.render();
  }
  for (Particle2 c: particle2s) {
    c.render();
  }
}
void objecthit() {
  for (int a = particles.size()-1 ;a>=0  ;a-- ) {
    Particle q = particles.get(a);
    for (int b = monsters.size()-1 ;b>=0 ;b-- ) {
      Monster w= monsters.get(b);
      if (touch(q, w)) {
        w.type.HP = w.type.HP- 200;
        particles.remove(a);
        if (w.type.HP<0) {
          monsters.remove(b);
          score+=100;
        }
        break;
      }
    }
  }
  for ( int c = particle2s.size()-1; c>=0; c--) {
       Particle2 w = particle2s.get(c);
    if (w.loc.dist(player.loc)<= 40) {
      score+=1000;
      particle2s.remove(c);
    }
  }
}
public class Player {
  PVector loc;
  PImage image1;
  public Player(float a, float b, PImage c) {
    loc = new PVector(a, b);
    image1 = c;
  }

  void change(float a, float b ) {
    loc.x += a ; //600,650)
    loc.y += b;  //38 and 43
    if (loc.x>562) {
      loc.x = 561;
    }
    if (loc.y>607) { 
      loc.y= 606;
    }
    if (loc.x<18) {
      loc.x =19;
    }
    if (loc.y<15) {
      loc.y=16 ;
    }
  }
  void render() {
    image(image1, loc.x, loc.y);
  }
  void fire(float a) {
    if (x%a==0) {
      particles.add(new Particle(player.loc.x, player.loc.y-25, 8, bullet, 0));
      particles.add(new Particle(player.loc.x-45, player.loc.y-25, 8, bullet, 0));
      particles.add(new Particle(player.loc.x+45, player.loc.y-25, 8, bullet, 0));
      particles.add(new Particle(player.loc.x-40, player.loc.y-10, 8, bulletleft, 1));
      particles.add(new Particle(player.loc.x+40, player.loc.y-10, 8, bulletright, 2));
      particles.add(new Particle(player.loc.x-80, player.loc.y-15, 8, bulletleft, 3));
      particles.add(new Particle(player.loc.x+80, player.loc.y-15, 8, bulletright, 4));
      particles.add(new Particle(player.loc.x-20, player.loc.y, 8, bulletLEFT, 5));
      particles.add(new Particle(player.loc.x+20, player.loc.y, 8, bulletRIGHT, 6));
    }
  }
  void skill() {   //size(600,650); 
    for (int a = 650 ;a>=0 ;a -=50) {
      particles.add(new Particle(a, 700, 5, specialbullet, 7));
    } 
    for (int a = 650;a>100 ;a-=50) {
      particles.add(new Particle(-50, a, 5, specialRIGHT, 8));
    }
    for (int a = 650; a>100 ;a-=50) {
      particles.add(new Particle(600, a, 5, specialLEFT, 9));
    }
  }
}
boolean touch(Particle a, Monster b) { 
  if ( a.loc.dist(b.loc)<= b.type.radius ) {

    return true;
  }
  return false;
}

public class Solid {
  float HP;  
  float speed;
  PImage image;
  float radius;

  public Solid(float a, float b, PImage c, float d) {
    HP= a;
    speed= b;
    image = c;
    radius = d;
  }
  void speedup() {
    speed++;
  }
}

public class Particle2 {
  PVector loc;
  PImage pic;
  public Particle2(float a, float b, PImage c) {
    loc = new PVector(a, b);
    pic = c;
  }
  void render() {
    loc.y+=5;
    image( pic, loc.x, loc.y, 50, 50)  ;
  }
}
public class Particle {
  PVector loc;
  PImage pic;
  float speed;
  int pictype;
  public Particle(float a, float b, float c, PImage f, int g) {
    loc= new PVector(a, b);
    speed= c;
    pic =f ;
    pictype = g;
  }
  void render() {
    if (pictype==0) {
      loc.y+=-speed;
      image(pic, loc.x, loc.y-20);
    }
    if (pictype==1) {
      loc.x +=-2;
      loc.y+=-speed;
      image(pic, loc.x, loc.y);
    }
    if (pictype==2) {
      loc.x +=2;
      loc.y+=-speed;
      image(pic, loc.x, loc.y);
    }
    if (pictype==3) {
      loc.x +=-5;
      loc.y+=-speed;
      image(pic, loc.x, loc.y);
    }
    if (pictype==4) {
      loc.x +=5;
      loc.y+=-speed;
      image(pic, loc.x, loc.y);
    }
    if (pictype==5) {
      loc.x +=-speed;
      image(pic, loc.x, loc.y);
    }  
    if (pictype==6) {
      loc.x +=speed;
      image(pic, loc.x, loc.y);
    }
    if (pictype==7) {
      loc.y+=-6;
      image(pic, loc.x, loc.y);
    }
    if (pictype==8) {
      loc.x +=5;
      image(pic, loc.x, loc.y);
    }
    if (pictype==9) {
      loc.x -=5;
      image(pic, loc.x, loc.y);
    }
  }
}
public class Monster {
  Solid type;
  PVector loc;
  public Monster( float a, float b, Solid c) {
    loc = new PVector(a, b);
    type = c;
  }
  void render() {
    loc.y += type.speed;
    image(type.image, loc.x, loc.y);
  }
}
