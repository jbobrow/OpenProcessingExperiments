
int eSize = 5;
int speed = 0;
int i;

size(400,400);
colorMode(RGB,360,100,100,100);
background(250);
noStroke();
smooth();

for(int y=0; y<=400; y+=5){
  for(int x=0; x<=400; x+=5){
    fill(x,y,400,400);
    rect(x,y,eSize,eSize);
  }
}


for(i=0; i<100; i++){
    float diameter;
    fill(random(200,240),random(50,100),random(50,100), 50);
    diameter = random(20,80);
    ellipse(random(400),random(400),diameter,diameter);
}


for(int x=-50; x<width; x+=10){
 speed += 10;
  if(x>70 && x<200){
   fill(255,x,0,100);
  }else{
    fill(200,x,86,57);
  }
 ellipse(x,speed,eSize,eSize);
  if(x>0 && x<400){
   fill(random(20,240),random(50,200),random(50,10), 50);
  }
  ellipse(10,speed,eSize,eSize);
  ellipse(speed,70,eSize,eSize);
 println(speed);
    }


