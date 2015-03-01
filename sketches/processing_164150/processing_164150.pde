
int m = 0;
int rand = 0;
int ran = 0;
int megaran = 0;
int x = 500;
int y = 0;
int yy = 0;
int xy = 0;
int dnar = 0;
int nar = 0;
int mm = 0;
int xy = 1;

void setup(){
  size(500,500);
  colorMode(HSB);
}

void draw(){
    m = millis();
    mm = millis();
    rand = random(255);
    ran = random(255);
    megaran = random(255);
    nar = random(500);
    dnar = random(500);
    fill(rand, ran, megaran);
    noStroke();
    rect(0, y, 100, 10);
    rect(101, y, 100, 10);
    rect(201, y, 100, 10);
    rect(301, y, 100, 10);
    rect(401, y, 100, 10);
    y++;
    println(m);
    
    if(m>=10000)
    {
      fill(ran, rand, megaran);
      if(mm>=25000)
      {
        rotate(yy);
      }
      if(mm>=40000)
      {
        scale(xy);
      }
      rect(x, ran, 60, 60);
      rect(rand, yy, 60, 60);
      rect(nar, dnar, 60, 60);
      x--;
      yy=yy+20;
      xy=xy+.001;
      
    }
}


