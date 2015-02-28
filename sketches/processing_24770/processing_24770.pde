
float placementOne = random(0,50);
int y = 0;

int x = 0;

void setup () {
  
  size (500,500);
  strokeWeight(1);
  background(255);
  smooth();
  
}

void draw() {
  
  while (x<15000){
  stroke(0,56,124,random(0,200));
  line (random(-1000,1000),random(-2000,2000),random(-1000,1000),random(-2000,2000));
x=x+1;  
}

while (y<1){
noStroke();
bezier(placementOne,height/2,placementOne+50,height/3,placementOne+130,height/3,placementOne+180,height/2);

fill(0,56,124);
arc(placementOne+90,height/2,90,90,PI,TWO_PI);

fill(255,234,0);
arc(placementOne+90,height/2,80,80,PI,TWO_PI);

fill(0,56,124);
arc(placementOne+90,height/2,60,60,PI,TWO_PI);

placementOne = placementOne + random(-30,30);

fill(255);
bezier(placementOne,height/2,placementOne+50,height/1.5,placementOne+130,height/1.5,placementOne+180,height/2);

fill(0,56,124);
arc(placementOne+90,height/2,90,90,0,PI);

fill(255,234,0);
arc(placementOne+90,height/2,80,80,0,PI);

fill(0,56,124);
arc(placementOne+90,height/2,60,60,0,PI);

//

placementOne = placementOne+random(200,400);

noStroke();
fill(255);
bezier(placementOne,height/2,placementOne+50,height/3,placementOne+130,height/3,placementOne+180,height/2);

fill(0,56,124);
arc(placementOne+90,height/2,90,90,PI,TWO_PI);

fill(255,234,0);
arc(placementOne+90,height/2,80,80,PI,TWO_PI);

fill(0,56,124);
arc(placementOne+90,height/2,60,60,PI,TWO_PI);

placementOne = placementOne + random(-30,30);

fill(255);
bezier(placementOne,height/2,placementOne+50,height/1.5,placementOne+130,height/1.5,placementOne+180,height/2);

fill(0,56,124);
arc(placementOne+90,height/2,90,90,0,PI);

fill(255,234,0);
arc(placementOne+90,height/2,80,80,0,PI);

fill(0,56,124);
arc(placementOne+90,height/2,60,60,0,PI);

y = y+1;
}

stroke(255,200);
line(0,height/2,width,height/2);


}

