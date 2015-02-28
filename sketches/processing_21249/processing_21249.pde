
//image filter animation


void setup(){
size(1000,1000);
background(255);
int y;
loop();

    PImage planet = loadImage ("planet.jpg");
    frameRate(10);    
    tint(255);
    image(planet,0,0);
    loop();

}

void draw(){

  PImage planet = loadImage ("planet.jpg");
  
  frameRate(10);
noFill();
stroke(random(200,255), 5);
strokeWeight(random(.00001,15));
for (int x = 3000; x > 0; x -= random(1,10)){
  ellipse(300,10,x,x);
}

noFill();
stroke(random(200,255), 5);
strokeWeight(random(.00001,15));
for (int x = 3000; x > 0; x -= random(1,10)){
  ellipse(300,990,x,x);
}

noFill();
stroke(random(200,255), random(1,100));
strokeWeight(random(.00001,15));
for (int x = 3000; x > 0; x -= random(1,10)){
  ellipse(10,300,x,x);
}

noFill();
stroke(random(200,255), random(1,100));
strokeWeight(random(.00001,15));
for (int x = 3000; x > 0; x -= random(1,10)){
  ellipse(990,300,x,x);
}
 
  tint(255,random(1,255));
  image(planet,0,0);
  
  noFill();
stroke(random(1,150));
strokeWeight(random(.00001,15));
for (int x = 10; x > 0; x -= random(1,10)){
  ellipse(random(width),random(height),x,x);
}
}

