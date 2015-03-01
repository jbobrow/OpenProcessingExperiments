

float y = 80;       
float x = 50; 
float xSpeed = 1.5;
float ySpeed = 1.5;  
float count = 100;
int state = 0;
float redder = 255;
float greener = 255;
float bluer = 255;
float fillerR = 0;
float fillerB = 0;
float fillerG = 0;
void setup(){
  
size(800,600);

}

void draw(){
background(redder,greener,bluer);
ellipseMode(CENTER);
stroke(3);
fill(fillerR,fillerB,fillerG);
int spacing = 0;
if (count>0) {
while (spacing <= 100) { 
  ellipse(x+spacing,y+spacing,count,count);
  spacing+=50;
}
  if (x>=width-(100+count/2)) {
  xSpeed=-xSpeed*random(.5,1.5);

  count= count-random(10);
  redder = random(122,255);
  greener = random(122,255);
  bluer = random(122,255);
  fillerR = random(0,122);
  fillerB = random(0,122);
  fillerG = random(0,122);
    }
  
    if (x<0+count/2) {
  xSpeed=-xSpeed*random(.5,1.5);

  count= count-random(10);
 redder = random(122,255);
  greener = random(122,255);
  bluer = random(122,255);
 fillerR = random(10,122);
  fillerB = random(0,122);
  fillerG = random(0,122);
  
    }
  if (y>=height-(100+count/2)) {
  ySpeed=-ySpeed*random(.5,1.5);

  count= count-random(10);
 redder = random(122,255);
  greener = random(122,255);
  bluer = random(122,255);
 fillerR = random(0122);
  fillerB = random(0,122);
  fillerG = random(0,122);
  
  }
   if (y<=0+count/2) {
  ySpeed=-ySpeed*random(.5,1.5);

  count= count-random(10);
 redder = random(122,255);
  greener = random(122,255);
  bluer = random(122,255);
 fillerR = random(0,122);
  fillerB = random(0,122);
  fillerG = random(0,122);
  
   }
  x+=xSpeed;
  y+=ySpeed;
  
  
}
if (count <=0) {
  count=100;
  x=width/2;
  y=height/2;
}
}



