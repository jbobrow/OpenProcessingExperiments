
int down;
float angle;
float x;
void setup(){
  fill (random(255),random(255),random(255));
size(300,600);
down=0;
angle=0.0;
 x=0;
 x=(random(50,200));
}
 
void draw(){
  background(0);
  if(down>=550){
  translate(x,down);
  rotate(angle);
  rect(0,0,50,50);
  rect(0,0,70,70);
  rect(0,0,90,90);
  rect(0,0,120,120);
  }
   
else{
translate(x,down);
rotate(angle);
fill(random(255),random(255),random(255));
  rect(0,0,120,120);
fill(255,166,0);
  rect(0,0,90,90);
fill(random(255),random(255),random(255));
   rect(0,0,70,70);
fill(246,255,0);
  rect(0,0,50,50);
fill(random(255),random(255),random(255));
   rect(0,0,40,40);
fill(0,255,210);
  rect(0,0,30,30);
fill(random(255),random(255),random(255));
   rect(0,0,20,20);
fill(0,23,255);
  rect(0,0,10,10);
  angle=angle+0.1;
  
  down=down+4; 
}
}


