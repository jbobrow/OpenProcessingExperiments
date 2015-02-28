
//_ks

float x;
float di = 20.0;
float[] ar = new float[20];
float xCord = 50;
float speed = 0;
float f = 20;
int count;

float col = 0;

void setup(){
  for (int i = 0; i < di; i ++){
   ar[i] = (width/di)+i*20;
  }
  
  size (700,400);
  noStroke();
  fill(0,20);
  background(0);
  frameRate(100);
}

void draw(){
  //background(0);
  f = random(0,60);
  fill(0,f);
  
  //colour fills
  col = random(0,25);
  fill(col, 0, 0, f);
  for (int i = 0; i < di; i ++){
    xCord = xCord + speed;
    speed = i * random(0,1.5);
    
  ellipse(xCord, ar[i], (random(0,20)),random(10,20));
  
      if (xCord > width){
        xCord = 0;
        fill(250,40);
        ellipse((xCord+random(-5,5)),(random(-5,5)+ar[i]), random(6,10*count), random(6,15));
        count += 1;
        if (count > width){;
        count = 1;
      }
      }
  }
  
  
  
}

