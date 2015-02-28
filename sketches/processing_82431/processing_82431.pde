
int var = 400;
float [] x = new float [var];
float y;
float Y;
float angle;
float j;
float degree;
float mmc;
float speedX;  //speed of rotation
float speedY;
float colorP; //color control
float ranCol;
float inc;

void setup(){
  size(600,600);
  smooth();

  for (int i = 0; i < x.length; i++){
    x[i] = random (-1000, 500);
    y = 290;
    Y = 25;
    angle = 180;
    j = 4;
    degree = 100;
    mmc = 1;
    colorP = 0;   
    
  }
  ranCol = color(random(255), random(255), random(255));
}

void draw(){
  background(noise(inc)*255);
  inc*=8;
  stroke(0);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      rect(x,y,10,10);
      
    }
 }

  y += Y*sin(radians(angle));
  for (int i = 0; i < x.length; i++){              
    x[i] += 10*cos(sin(y)); 
    if(x[i] > 50){
      x[i] = 10;
   }
  
    
    rotate(degree);
    fill(random(255), random(255), random(255),80);
    stroke(0,0,0,0);
    triangle(x[i] ,mouseY ,50,25,75,180);
    if(mousePressed){
      fill(0);
      //fill(noise(inc)*255);
     // inc+=.05;
    }
    
    }
   
    var +=10;
    if(degree > 200)
   degree = 100;
    if(angle > 250)
    angle = 180;
    
  }




