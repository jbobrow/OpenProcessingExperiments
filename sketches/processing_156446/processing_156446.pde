
PImage background1;
PImage grass;
PImage moutain1;
PImage moutain2;
PImage moutain3;
PImage moutain4;
PImage sheep;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage food;
PFont lifetext;
PFont end;
float moutainx1=0;
float moutainx2=0;
float moutainx3=0;
float moutainx4=0;
float cloudx1=50;
float cloudy1=100;
float cloudx2=50;
float cloudy2=300;
float cloudx3=400;
float cloudy3=400;
float r = 255;
float g = 255;
float b = 255;
float sheepy = 600;
float life = 50;

void setup() {
  size(876, 1000);
  lifetext = loadFont("8BITWONDERNominal-48.vlw");
  end = loadFont("8BITWONDERNominal-48.vlw");
  background1 = loadImage("background.png");
  grass = loadImage("grass.png");
  moutain1 = loadImage("moutain1.png");
  moutain2 = loadImage("moutain2.png");
  moutain3 = loadImage("moutain3.png");  
  moutain4 = loadImage("moutain4.png"); 
  food = loadImage("food.png"); 
  sheep = loadImage("sheep.png");  
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud2.png");
}

void draw() {
  smooth();
  float t= millis()*0.001;
  image(background1, 0, 0);   

  if (mouseY>260 && mouseY<587 && mouseX>190 &&mouseX<625){
      moutainx1=cos(t)*60;
      moutainx2=sin(3/2*t)*30;
      moutainx3=cos(6/5*t)*20;
      moutainx4=sin(t/2)*20;
      image(moutain4,moutainx4,0);
      image(moutain3,moutainx3,0);
      image(moutain2,moutainx2,0);
      image(moutain1,moutainx1,0);    
      image(grass,0,0);
     }else if(mouseY>600 && mouseY<height){
      image(moutain4,moutainx4,0);
      image(moutain3,moutainx3,0);
      image(moutain2,moutainx2,0);
      image(moutain1,moutainx1,0);    
      image(grass,0,0);
      float time= sin (millis()*0.001);
      float sheepx;
      sheepx = map(time,-1,1,100,700);
      image(sheep,sheepx,sheepy);
      if(life>0){
      life=life-0.5/2;
      if(dist(mouseX,mouseY,sheepx+80,sheepy+100)<100){
         image(food,mouseX-60,mouseY-50,125,100);   
         if(mousePressed){
         life+=1;
         }
       }
      }else{
        fill(255,0,0);
        textFont(end,50);
        text("Game over",width/2,height/2);
      }
     }else{
      image(moutain4,moutainx4,0);
      image(moutain3,moutainx3,0);
      image(moutain2,moutainx2,0);
      image(moutain1,moutainx1,0);
      image(grass,0,0);
     }
    image(cloud1,cloudx1,cloudy1);
    image(cloud2,cloudx2,cloudy2); 
    image(cloud3,cloudx3,cloudy3);  
    if(cloudx1 > -415){
      cloudx1-=2;
    }else{
      cloudx1=width;
      cloudy1=random(50,350);
    }
    if(cloudx2 < width){
      cloudx2+=3;
    }else{
      cloudx2=-175;
      cloudy2=random(50,350);
    }
    if(cloudx3>-175){
      cloudx3--;
    }else{
      cloudx3=width;
      cloudy3=random(150,450);
    }
    textFont(lifetext,30);
    g = map(life,50,0,255,0);
    b = map(life,50,0,255,0);
    fill(r,g,b);
    text("LIFE: "+life,50,600);
    println(life);
}


