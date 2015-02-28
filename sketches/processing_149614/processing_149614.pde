
Player player;
ArrayList<Solid> rocks;
ArrayList<Monster> monsters;
ArrayList<Particle> particles;
int x=0;
int currentWeapon=1;
PImage img;
PImage bullets;
int radii = 29;
void setup(){
  frameRate(10);
  size(800,640);   //800 640
  String bd ="http://i30.photobucket.com/albums/c309/x2yimin2x/nightwallpapers1_zpsc21e79ea.png";
  String pic1="http://i30.photobucket.com/albums/c309/x2yimin2x/hugepng_zps167278b8.png";
  String pic2= "http://i30.photobucket.com/albums/c309/x2yimin2x/smallpng_zpsc48cf04f.png";
  String pic3= "http://i30.photobucket.com/albums/c309/x2yimin2x/frame0027_zps0e102dc7.png";
  String pic4= "http://i30.photobucket.com/albums/c309/x2yimin2x/frame0027_zps1135283f.png";
  String play ="http://i30.photobucket.com/albums/c309/x2yimin2x/fighterpng_zps24778c57.jpg";
  img =loadImage(bd);
  monsters = new ArrayList<Monster>();
  rocks = new ArrayList<Solid>();
  particles = new ArrayList<Particle>();
  player = new Player(width/2, height/2,loadImage(play)); 
  
  
  Solid comet1 = new Solid(800,10, loadImage(pic1),64);
  Solid comet2 = new Solid(800,10,loadImage(pic2),32);
  Solid comet3 = new Solid(800,10,loadImage(pic3),32);
  Solid comet4 = new Solid(800,10,loadImage(pic4),32);
  rocks.add(comet2); rocks.add(comet3); rocks.add(comet4);
  bullets =loadImage("http://i30.photobucket.com/albums/c309/x2yimin2x/bullet02apng_zps7d668d88.png");
  
   
}
 
 void draw(){
   image(img,0,0);
   if(x%100==0){
     for( int a =0  ;a<15 ;a++){
      monsters.add(new Monster(random(800), random(100), rocks.get((int)random(3)) ));
       
     } 
   }
   if(x%50==0){
     for( int a =0  ;a<15 ;a++){
      monsters.add(new Monster(random(800), random(50), rocks.get((int)random(3)) ));
       
     } 
   }
   
   player.render();
   for( Monster a: monsters){
   a.render();
   }
  for(Particle b: particles){
    b.render();
    }
  if(x%15==0){
    particles.add( new Particle(player.loc.x,player.loc.y, currentWeapon,10));
    particles.add(new Particle(player.loc.x-40,player.loc.y+10, currentWeapon,10));
    particles.add(new Particle(player.loc.x+40,player.loc.y+10, currentWeapon,10));
    particles.add(new Particle(player.loc.x+80,player.loc.y+15, currentWeapon,10));
    particles.add(new Particle(player.loc.x-80,player.loc.y+15, currentWeapon,10));
  }
  
  for(int a = particles.size()-1 ;a>0  ;a-- ){
    Particle q = particles.get(a);
    for(int b = monsters.size()-1 ;b>0 ;b-- ){
      Monster w= monsters.get(b);
        if(touch(q,w)){
          particles.remove(a);
          monsters.remove(b);
          break; 
        }
        }        
  } 
  for( int a = 0;a<monsters.size() ;a++){
    Monster b = monsters.get(a);
    if(b.loc.y>640){
      monsters.remove(a);
      a--;
    }
    
  }
  for( int a = 0 ;a<particles.size();a++){
    Particle b = particles.get(a);
    if(b.loc.y<0 ){
      particles.remove(a);
      a--;
    }
    
  }
  
  
  
  
 x++;
 
 }
 void keyPressed(){
    
   if(keyPressed){
  if ( key == 'W' || key =='w'){
    player.change(player.loc.x, player.loc.y-15);
  }
  if(key == 'A' || key== 'a'){
    player.change(player.loc.x-15, player.loc.y);
  }
  if (key =='S'|| key== 's') {
    player.change(player.loc.x, player.loc.y+15);
  }
  if (key =='D' || key== 'd') {
    player.change(player.loc.x+15, player.loc.y);
  }if(key=='E' || key=='e'){
   currentWeapon++;
   if(currentWeapon>2){
    currentWeapon=1;
   }
  }
 
    }
 }
public class Player{
 PVector loc;
 PImage image1;
 public Player(float a , float b , PImage c){
   loc = new PVector(a,b);
   image1= c;
 }
 void render(){
  image(image1,loc.x,loc.y);
 }
 void change(float a, float b){
  loc.x= a;
  if(loc.x<0){
   loc.x = 1;
  }
  if(loc.x>752){
   loc.x=751;
  }
  loc.y= b;
  if(loc.y<0){
    loc.y=1;
  }  
  if(loc.y>565){
     loc.y= 564;
  }
  
}
}
boolean touch(Particle a , Monster b){
  if( a.loc.dist(b.loc)<=29){
  return true;
  }
  return false;
}

public class Solid{
  float HP;  
  float speed;
  PImage image;
  float radius;
  
 public Solid(float a, float b , PImage c,float d){
   HP= a;
   speed= b;
   image = c;
   radius = d;
  } 
}
 
public class Monster{
 Solid type;
 PVector loc;
 
  public Monster( float a , float b , Solid c){
    loc = new PVector(a, b);
    type = c;
  }
 void render(){
   loc.y += type.speed;
   image(type.image, loc.x, loc.y);
    
 }
 
}
public class Particle{
  PVector loc;
  float type;
  float speed;
  public Particle(float a , float b, float c, float d ){
    loc= new PVector(a,b);
    type = c;
    speed =d ;
  }
  void render(){
    loc.y+=-speed;
     
     if(type== 1){ 
      image(bullets,loc.x,loc.y); 
     
    }
    

  }  
}

