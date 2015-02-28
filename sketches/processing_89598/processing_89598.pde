
/*PImage fire1;
PImage fire2;
PImage fire3;
PImage fire4;*/
PFont gameover;
PImage mario;
PImage cloud;
PImage cloud2;
PImage bush;
PImage bullet;
int x = 0;
int y=0;
int w=0;


void setup(){
  size(750,500);
  background(#5C95FC);
  gameover=loadFont("Monospaced-200.vlw");
  textFont(gameover,100);
  bullet=loadImage("bullet.png");
  cloud2=loadImage("cloud.png");
  cloud=loadImage("cloud.png");
  bush=loadImage("bush.png");
  mario=loadImage("mario.png");


/* fire4=loadImage("4.png");
  fire3=loadImage("3.png");
  fire2=loadImage("2.png");
  fire1=loadImage("top.png");*/
  
}


void draw(){
  background(#5c95fc);
   image(bush,200,320);
  image(bullet,x,320);
  image(cloud2,60,0);
  image(cloud,400,60);
  //image(mario, 560,320);
   image(mario, 560,y);

   //fill(random(255));
  text("Game Over",20,w);
  
   /*image(fire4,560,320);
  image(fire3,560,320);
  image(fire2,560,320);
  image(fire1,560,320);*/
 
  x+=3;
 y++;
 w++;

if (w>300){
 w=300; 
}

if(y>320){
  y=100;
}
 
  if(x > width){
   x=0; 
  }
  
  
  
  
}


