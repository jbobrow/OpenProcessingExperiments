
int i = 0;
int j = 0;
float xPos = 0;
int[] X2 = new int[3];
int[] Y = new int[5];
int[] X = new int[5];
int phase = 0;
int frames = 4;
int F = 1;
PImage[] rocks = new PImage[3];
PImage cactus;
PImage money;
PImage mesa;
PImage[] rail = new PImage[frames];
PImage tracks;

void setup(){
  size(600,600);
  frameRate(10);
  for(i=0;i<3;i++){
    X2[i] = random(600);
  }
  for(i=0;i<3;i++){
    rocks[i] = loadImage("rocks"+i+".png");
  }
  mesa = loadImage("mesa.jpg");
  cactus = loadImage("cactus.png");
  tracks = loadImage("rail.png");
  money = loadImage("money.png");
  for(i=0;i<5;i++){
    X[i] = random(600);
    Y[i] = 200 + random(150);
  }
  
  for(i = 0;i < 4;i++){
    rail[i] = loadImage(i+".png");
  }
  i = 0;
}

void draw(){
  
  // Backgrounds
  noStroke();
  fill(224,186,104);
  rect(0,0,600,600);
  image(mesa,xPos-=5,-500);
  image(mesa,xPos+1500,-500);
  if(xPos<-1500){
    xPos = 0;
  }
  
  for(i=0;i<5;i++){
    image(cactus, X[i]-=10,Y[i]);
  }
  
  for(i=0;i<5;i++){
    if(X[i] <= -10){
      X[i] = 610+random(100);
      Y[i] = 200 + random(150);
    }
  }
  for(i=0;i<3;i++){
    image(rocks[i], X2[i]-=15,550);
  }
  
  for(i=0;i<3;i++){
    if(X2[i] <= -10){
      X2[i] = 610+random(100);
    }
  }
 
  image(tracks,0,25);
  
  image(rail[j+=F],20,25);
  if(j==0){
    F = 1;
  }
  else if(j==3){
    F = -1;
  }
  image(money, 228+random(4),325+random(3));
}




