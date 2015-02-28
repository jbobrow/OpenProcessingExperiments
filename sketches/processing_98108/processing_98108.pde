
int spin = 0;
int speed = 0;
int fps = 60;
boolean doWork = true;
int s = 40;

int opposite;
int adjacent;
float hypotenuse;

int heightToWidth;

float theta;

float diameter;

int blades = 10;

void keyReleased(){
  doWork = true;
}

void setup(){
size(700,700);
}

void draw(){
background(255);
  
//pushMatrix();
translate(350,350);
rotate(radians(spin));

frameRate(fps);

////the below code draws a circle to demonstrate that the arcs on the spinner are in fact a part of a circle
//fill(100);
//ellipse(0,0,2*(sqrt((100*100)+(300*300))),2*(sqrt((100*100)+(300*300))));

adjacent = 300;
heightToWidth = blades/2;
opposite = adjacent/heightToWidth;
hypotenuse = sqrt(sq(opposite)+sq(adjacent));
theta = asin(opposite/hypotenuse);
diameter = hypotenuse * 2;

for(int i = 1; i <= blades; i++){
fill(0);
noStroke();
arc(0,0,diameter,diameter,radians((360/blades)*i) - theta, radians((360/blades)*i) + theta);
//arc(0,0,diameter,diameter,radians(090) - theta, radians(090) + theta);
//arc(0,0,diameter,diameter,radians(180) - theta, radians(180) + theta);
//arc(0,0,diameter,diameter,radians(270) - theta, radians(270) + theta);
}

spin = spin + speed;
//println(frameRate);


if (keyPressed == true && doWork == true){
  if(keyCode == 39){
    speed ++;
    doWork = false;
  }
  if(keyCode == 37){
    speed --;
    doWork = false;
  }
    if(keyCode == 38){
    fps ++;
    doWork = false;
  }  
  if(keyCode == 40){
    fps --;
    doWork = false;
  }
  if(key == '+'){
    s ++;
    doWork = false;
  }  
  if(key == '-'){
    s --;
    doWork = false;
  }
  if(key == 'm'){
    blades ++;
    doWork = false;
  }
  if(key == 'l'){
    blades --;
    doWork = false;
  }
}

//fill(0,255,0);
//ellipse(0,-275,s,s);
//ellipse(0,-187.5,s,s);
//ellipse(0,-100,s,s);
//
//ellipse(0,275,s,s);
//ellipse(0,187.5,s,s);
//ellipse(0,100,s,s);
////
//ellipse(-275,0,s,s);
//ellipse(-187.5,0,s,s);
//ellipse(-100,0,s,s);
//
//ellipse(275,0,s,s);
//ellipse(187.5,0,s,s);
//ellipse(100,0,s,s);

}


