
float x;
float y;
float directionX;
float directionY;


void setup(){
  size(600,600);
  background(147,147,147);

x = 10;
y = 10;
directionX = 2;
directionY = 2;
  
}


void draw(){
  
x += directionX;
y += directionY;




for(int i = 0; i < 500; i+=4){
  strokeWeight(1);
  rect(i+random(1000),mouseY+50,50,50);
 noFill();
 stroke(random(255),random(mouseX),150);
}

for(int i = 0; i < 400; i+=15){
 strokeWeight(2); 
  ellipse(x,y,100,100);  
}

if(x > 600){
  x = random(0,200);
  y = random(0,300);
}

for(int i = 0; i < 600; i+=6){
  strokeWeight(1);
  ellipse(i+mouseX,mouseY,30,30);
}

for (int i = 0; i < 600; i = i+30) {
    strokeWeight(4);
  line(0, i, 140, i);
}

for (int i = 0; i < 600; i = i+30) {
  strokeWeight(4);
  line(160, i, 300, i);
  
}
  for (int i = 0; i < 600; i = i+30) {
    strokeWeight(4);
  line(310, i, 500, i);
}

for (int i = 0; i < 600; i = i+30) {
    strokeWeight(4);
  line(510, i, 600, i);
 }
}

