
/* @pjs preload="back.jpg, luke.gif, vader.gif, ST.gif"; */
float trooperx = 300;
float troopery = 250;
float vaderx = 100;
float vadery = 300;
float lukex = 300;
float lukey = 300;
float easing = 0.05;
PImage back;
PImage luke;
PImage vader;
PImage trooper;
Trooper strooper = new Trooper();
Vader dvader = new Vader();
Luke lukes = new Luke();

void setup(){
  size(500, 500);
  back = loadImage("back.jpg");
  luke = loadImage("luke.gif");
  vader = loadImage("vader.gif");
  trooper = loadImage("ST.gif");
}

void draw(){
  image(back,0,0,1024,647);
  strooper.draw();
  trooperx = trooperx + strooper.xspeed;
  troopery = troopery + strooper.yspeed;
  
  if(trooperx > height-strooper.xsize || trooperx < 0){
    strooper.xspeed *= -1;
  }
  
  if(troopery > height-strooper.ysize || troopery < 0){
    strooper.yspeed *= -1; 
  }
  
  strooper.xsize -= 0.1;
  strooper.ysize -= 0.1;
  
  if(strooper.xsize <= 0){
    strooper.xsize = 0;
  }
  
  if(strooper.ysize <= 0){
    strooper.ysize = 0;
  }
  
  dvader.draw();
  vaderx = vaderx + dvader.xspeed;
  float waveSpeed = 0.1;
  float waveHeight = 10;
  vadery = 250 + sin(vaderx * waveSpeed) * waveHeight;
  
  if(vaderx > width-70){
    dvader.xspeed *= -1;
  }
  
  if(vaderx < 0){
    dvader.xspeed *= -1;
  }
  
  lukes.update();
  lukes.draw();
  
}

class Trooper{
  float xspeed = 2;
  float yspeed = 3.5;
  float xsize = 90;
  float ysize = 170;
  
  void draw(){
    image(trooper, trooperx, troopery, this.xsize, this.ysize);
  }
}

class Vader{
  float xspeed = 3;
  
  void draw(){
    image(vader, vaderx, vadery);  
  }
}

class Luke{  
  float speed = 1;
  float xsize = 67;
  float ysize = 168;
  
  void update(){
    float toX = vaderx - lukex;
    float toY = vadery - lukey;
    
    if(dist(vaderx, vadery, lukex, lukey) < 100){
    lukex = lukex + (toX*easing);
    lukey = lukey + (toY*easing);
    }
    
    if(dist(vaderx, vadery, lukex, lukey) < 8){
      this.xsize += 20;
      this.ysize += 30; 
      
      vaderx = 2000;
      vadery = 2000;
    }
  }
  
  void draw(){
    image(luke, lukex, lukey, this.xsize, this.ysize);
  }
}


