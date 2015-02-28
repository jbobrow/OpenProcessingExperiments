
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
int y=320;
int w=0;
int v=60;
int v2=500;

boolean jump=true;

void setup(){
  size(750,500);
  background(#5C95FC);
  gameover=loadFont("Monospaced-200.vlw");
  textFont(gameover,70);
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
  
  //image(cloud2,60,0);
  image(cloud2,v,0);
  
  //image(cloud,400,60);
  image(cloud,v2,60);
  
  //image(mario, 560,320);
   //image(mario, 560,y);

   //fill(random(255));
  text("HIPPOPOTAMUS",20,w);
  
   /*image(fire4,560,320);
  image(fire3,560,320);
  image(fire2,560,320);
  image(fire1,560,320);*/
 
  x+=3;
 y--;
 w++;
  v--;
  v2--;
  
  if(jump){
    image(mario, 560,y);
  }
  
  
  if(v<-300){
   v=580; 
  }
  
  if(v2<-300){
   v2=580; 
  }
  
  
if (w>300){
 w=300; 
}

if(y<200){
  y=325;
}
 
  if(x > width){
   x=0; 
  }
  

}

void keyPressed(){
 if(key=='j') jump = true;
else jump=false; 
}


