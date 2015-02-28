
PImage [] bird = new PImage[6];
PImage [] hawk = new PImage[6];
PImage [] oldman = new PImage[10];
PImage back;

float sizeX = width;
float sizeY= height;
int birds=1;

float omanX=random(80,350);
float omanY=random(600,675);
float omanSpeed=random(1,20);
  float die = random(3,8);

float bbirdX=random(0,350);
float bbirdY=random(70,200);
float bbSpeed=random(4,9);
float bbmoveX=bbSpeed;
float bbmoveY=bbSpeed;

float lbirdX=random(0,350);
float lbirdY=random(50,200);
float lbSpeed=random(2,5);
float lbmoveX=lbSpeed;
float lbmoveY=lbSpeed;

float size=150;

float timer=0;

void setup(){
  for (int i = 1; i < 6; i ++ ) {
    bird[i] = loadImage( "bird_" + i + ".png" );
  }
    for (int i = 1; i < 6; i ++ ) {
    hawk[i] = loadImage( "hawk_" + i + ".png" );
  }
    for (int i = 1; i < 10; i ++ ) {
    oldman[i] = loadImage( "oldman_" + i + ".png" );
  }
  size(800,800);
  back=loadImage("the-park-trail-65ee12.jpg");
}
  
  
void draw(){
  imageMode(CENTER);
  image(back,400,400);
  
  oldman();
  bigBird();
  littleBird();
  collide();
}

void oldman(){
  int i =8;
  timer+=.013;
  fill(255,0,0);
  if (timer < die){
      image(oldman[i],omanX,omanY);
if (omanX >= (width-50) || omanX <= 50)
      {
        omanSpeed = -omanSpeed;
      }
      omanX += omanSpeed;
      i=i+1;
}
  if(timer>die){
    image(oldman[9],omanX,omanY);
  }
}

void bigBird(){
    fill(255,0,0);

image(hawk[1],bbirdX,bbirdY,size,size);
  
if (bbirdX >= (width-50) || bbirdX <= 50)
      {
        bbmoveX = -bbmoveX;
      }
           
      bbirdX += bbmoveX;
if (bbirdY >= (300) || bbirdY <= 52)
      {
        bbmoveY = -bbmoveY;
      }
           
      bbirdY += bbmoveY;
}

void littleBird(){
    fill(255,0,0);
  if (birds==1){
      image(bird[1],lbirdX,lbirdY);
  
if (lbirdX >= (width-25) || lbirdX <= 25)
      {
        lbmoveX = -lbmoveX;
      }
           
      lbirdX += lbmoveX;
if (lbirdY >= (300) || lbirdY <= 25)
      {
        lbmoveY = -lbmoveY;
      }
           
      lbirdY += lbmoveY;
  }
  
  if(birds==3)
  {
    image(bird[3],lbirdX,lbirdY);
    
    if(lbirdX>750){
    lbirdX= lbirdX-5;
    }
  }
}
void collide(){
  
float d = dist(lbirdX, lbirdY, bbirdX, bbirdY);
      float maxWidth = max(0, 50);
      
      if (d < maxWidth)
      {
        size= size + 25;
        birds=3;
      }
        
      

}


