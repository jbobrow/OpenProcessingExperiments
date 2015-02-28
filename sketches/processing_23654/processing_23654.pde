
void setup(){
  size(500,500); //size of screen
  smooth(); //less pixelated
  frameRate(40); //frames per second
}
void draw(){
  background(50,75,157); //RGB
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  
  fill(137,48,33); //dark brown
  ellipse(330,170,80,80);//ears
  ellipse(170,170,80,80);//ears
  fill(236,60,150); //pink
  ellipse(330,170,40,40); //inside ears
  ellipse(170,170,40,40); //inside ears
  fill(157,48,33); //brown
  ellipse(250,250,200,200);//head
  fill(137,48,33); //dark brown
  ellipse(250,290,120,70); //mouth piece
  fill(257,257,257); //white
  ellipse(210,210,40,40); //eyes white
  ellipse(290,210,40,40); //eyes white
  fill(0,0,0); //black
  ellipse(210,210,15,15); //eyes black
  ellipse(290,210,15,15); //eyes black
  stroke(0,0,0);
  line(220,300,280,300); //mouth
  fill(236,60,150); //pink
  noStroke();
  ellipse(250,270,35,20); //nose
  fill(157,48,33);
  rect(250,375,30,70); //neck
  ellipse(250,450,100,190); //body
  fill(236,60,150); //pink
  ellipse(250,450,70,100);
  stroke(137,48,33);
  line(210,400,130,350); //arm
  line(290,400,360,350);//arm
  noStroke();
  fill(157,48,33);
  ellipse(130,350,40,40); //hands
  ellipse(360,350,40,40);//hands
  fill(236,60,150);
  ellipse(130,350,20,20);//paws
  ellipse(360,350,20,20);//paws
  
  fill(209,211,212); //grey
  ellipse(mouseX+60,mouseY+70,40,20); //wing
  ellipse(mouseX+140,mouseY+70,40,20); //wing
  fill(245,345,40); //yellow
  stroke(0,0,0);
  line(mouseX+90,mouseY+60,mouseX+85,mouseY+25);
  line(mouseX+110,mouseY+60,mouseX+115,mouseY+25); 
  noStroke();
  ellipse(mouseX+100,mouseY+70,50,50); //bee body
  fill(0,0,0);
  ellipse(mouseX+90,mouseY+60,10,10); //eye
  ellipse(mouseX+110,mouseY+60,10,10); //eye
  ellipse(mouseX+85,mouseY+25,10,10);
  ellipse(mouseX+115,mouseY+25,10,10);
  stroke(0,0,0);
  line(mouseX+90,mouseY+80,mouseX+110,mouseY+80);
  noStroke();
  
}


void mousePressed(){
  frameRate(5);
  fill(137,48,33);
  ellipse(210,210,50,50); //eyes white
  ellipse(290,210,50,50); //eyes white
  stroke(0,0,0);
  line(190,210,230,210);
  line(270,210,310,210);
 
}

void keyPressed(){
  stroke(137,48,33);
  line(210,400,130,380); //arm
  line(290,400,360,380);//arm
  noStroke();
  fill(157,48,33);
  ellipse(130,380,40,40); //hands
  ellipse(360,380,40,40);//hands
  fill(236,60,150);
  ellipse(130,380,20,20);//paws
  ellipse(360,380,20,20);//paws
  
  stroke(137,48,33);
  line(210,400,130,320); //arm
  line(290,400,360,320);//arm
  noStroke();
  fill(157,48,33);
  ellipse(130,320,40,40); //hands
  ellipse(360,320,40,40);//hands
  fill(236,60,150);
  ellipse(130,320,20,20);//paws
  ellipse(360,320,20,20);//paws
  
}


