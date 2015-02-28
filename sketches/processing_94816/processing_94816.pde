
int y=5;
int i;

void setup(){
 size(600,625);
background(17,183,179);
frameRate(20);
smooth();
noStroke();
}

void draw(){
y=(y+1)%20;
 
if(random(0,1)<0.5){
    stroke(random(255),random(255),random(255));
} else{
  stroke(random(255),random(255),random(255));
}
 for (i=0;i<10; i++){
   ellipse(random(800), random(50,0), random(3), random(1200,0));
 }
fill(255);
rect(0,315,600,110);
rect(0,100,600,110);
rect(0,515,600,120);

fill(0);
ellipse(300,125,400,400);

fill(0,255,0);
ellipse(300,315,400,400);
fill(0);
ellipse(250,225,50,100);
ellipse(345,225,50,100);
ellipse(300,325,50,50);

arc(300,380,200,200,0, PI/2);
arc(300,380,200,200, PI/2, PI);

noFill();
arc(250, 205+y, 100, 100, PI, TWO_PI-PI/2);
arc(345, 205+y, 100, 100, TWO_PI-PI/2, TWO_PI);



}

  
  


