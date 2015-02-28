
void setup(){
size(1000,1000);
background(23,151,173);
frameRate(15);

}

void draw(){
  stroke(0,0,0);
  line(random(1000),random(750),5,500);
  line(random(600),random(800),1000,1000);
  line(random(300),random(1000),400,1000);
stroke(255,100,72);
fill(255,117,93,10);
rect(mouseX,255, 500,250);
fill(247,156,140,35);
rect(300,random(1000),100,50);
rect(150,random(1000),80,40);
rect(70,random(1000),60,30);
rect(0,random(1000),30,20);
tint(150,60,200);
rect(850,850,random(150),random(150));
tint(252,235,232,3);
noStroke();
rect(620,650,random(300),random(300));


noStroke();
fill(145,236,247,10);
rect(200,380,random(550),random(450));
rect(350,20, random(625), random(900));


  
}

void mousePressed(){
 saveFrame("img###.jpg"); 
}
