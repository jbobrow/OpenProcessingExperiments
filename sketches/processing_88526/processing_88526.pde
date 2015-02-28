
int scene =1;
float timer = 0;




//images
PImage t;
PImage b;
PImage c;
PImage cs;
PImage b1;
PImage b2;
PImage sun1;
PImage sun2;


void setup ()
{
 size (800, 800);
 frameRate(3);
  t = loadImage("test.png"); 
  b = loadImage("background.png");
  c = loadImage("circle.png");
  cs = loadImage("circle_s.png");
  b1 = loadImage("bird1.png");
  b2 = loadImage("bird2.png");
  sun1 = loadImage("sun1.png");
  sun2 = loadImage("sun2.png");
}

void draw ()
{
  timer += 1.0;
  
  if(timer ==1){
  image(b, 0, 0);
  image(b1, 0, 0);
  image(b2, 10, 30);
  image(sun1, 600, 0);
  }
   if(timer ==2){
   image(b, 0, 0);
  image(c, 0, 612);
  image(b1, 40, 0);
  image(b2, 50, 30);
  image(sun2, 600, 0);
  }
  if(timer ==3){
    image(b, 0, 0);
  image(c, 40, 582);
   image(b1, 80, 0);
  image(b2, 90, 30);
  image(sun1, 600, 0);
  }
  if(timer ==4){
    image(b, 0, 0);
  image(c, 80, 612);
   image(b1, 120, 0);
  image(b2, 130, 30);
    image(sun2, 600, 0);
  }
  if(timer ==5){
    image(b, 0, 0);
  image(c, 120, 582);
   image(b1, 160, 0);
  image(b2, 170, 30);
  image(sun1, 600, 0);
  }
  if(timer ==6){
    image(b, 0, 0);
  image(c, 160, 612);
   image(b1, 200, 0);
  image(b2, 210, 30);
    image(sun2, 600, 0);
  }
   if(timer ==7){
    image(b, 0, 0);
  image(c, 200, 582);
   image(b1, 240, 0);
  image(b2, 250, 30);
  image(sun1, 600, 0);
  }
   if(timer ==8){
    image(b, 0, 0);
  image(c, 240, 612);
   image(b1, 280, 0);
  image(b2, 290, 30);
    image(sun2, 600, 0);
  }
   if(timer ==9){
    image(b, 0, 0);
  image(c, 280, 582);
   image(b1, 320, 0);
  image(b2, 330, 30);
  image(sun1, 600, 0);
  }
   if(timer ==10){
    image(b, 0, 0);
  image(c, 320, 612);
   image(b1, 360, 0);
  image(b2, 370, 30);
    image(sun2, 600, 0);
  }
   if(timer ==11){
    image(b, 0, 0);
  image(c, 360, 582);
   image(b1, 400, 0);
  image(b2, 410, 30);
  image(sun1, 600, 0);
  }
   if(timer ==12){
    image(b, 0, 0);
  image(c, 400, 612);
   image(b1, 440, 0);
  image(b2, 450, 30);
    image(sun2, 600, 0);
  }
    if(timer ==13){
    image(b, 0, 0);
  image(c, 400, 612);
   image(b1, 480, 0);
  image(b2, 490, 30);
  image(sun1, 600, 0);
  }
    if(timer ==14){
    image(b, 0, 0);
  image(c, 480, 562);
   image(b1, 520, 0);
  image(b2, 530, 30);
    image(sun2, 600, 0);
  }
    if(timer ==15){
   image(b, 0, 0);
  image(c, 540, 542);
   image(b1, 560, 0);
  image(b2, 570, 30);
  image(sun1, 600, 0);
  }
    if(timer ==16){
   image(b, 0, 0);
  image(cs, 600, 562);
   image(b1, 600, 0);
  image(b2, 610, 30);
    image(sun2, 600, 0);
  }
     if(timer ==17){
   image(b, 0, 0);
  image(cs, 600, 562);
   image(b1, 640, 0);
  image(b2, 650, 30);
  image(sun1, 600, 0);
  }
    if(timer ==18){
   image(b, 0, 0);
  image(cs, 630, 612);
    image(sun2, 600, 0);
       image(b1, 680, 0);
  image(b2, 690, 30);
  }
  if(timer ==19){
   image(b, 0, 0);
  image(cs, 640, 652);
  image(sun1, 600, 0);
     image(b1, 720, 0);
  image(b2, 730, 30);
  }
   if(timer ==20){
   image(b, 0, 0);
  image(cs, 645, 692);
    image(sun2, 600, 0);
     image(b1, 760, 0);
  image(b2, 770, 30);
  }
   if(timer ==21){
   image(b, 0, 0);
  image(cs, 650, 732);
  image(sun1, 600, 0);
  }
    if(timer ==22){
   image(b, 0, 0);
     image(sun2, 600, 0);
  }
     if(timer ==23){
   image(b, 0, 0);
     image(sun1, 600, 0);
  }
     if(timer ==24){
   image(b, 0, 0);
     image(sun2, 600, 0);
  }
  if(timer == 25){
    timer =1;
  }
}

void mouseClicked()
{
  scene +=1;
}


