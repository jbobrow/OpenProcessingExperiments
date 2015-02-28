
int x= 250;
int y= 270;

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
  
   if(mouseY<250) {
    fill(245,345,40);
    ellipse(0,0,150,150);
  } 
    else {if(mouseY>250);
    fill(255,255,255);
    ellipse(100,100,100,50);
    ellipse(150,70,100,50);
    ellipse(420,70,120,60);
    ellipse(350,100,150,70);
    
  } 
   
    
  fill(20,250,40);
  rect(250,450,500,150);
  fill(137,48,33); //dark brown
  ellipse(x+80,y-100,80,80);//ears
  ellipse(x-80,y-100,80,80);//ears
  fill(236,60,150); //pink
  ellipse(x+80,y-100,40,40); //inside ears
  ellipse(x-80,y-100,40,40); //inside ears
  fill(157,48,33); //brown
  ellipse(x,y-20,200,200);//head
  fill(137,48,33); //dark brown
  ellipse(x,y+20,120,70); //mouth piece
  fill(257,257,257); //white
  ellipse(x-40,y-60,40,40); //eyes white
  ellipse(x+40,y-60,40,40); //eyes white
  fill(0,0,0); //black
  ellipse(x-40,y-60,15,15); //eyes black
  ellipse(x+40,y-60,15,15); //eyes black
  stroke(0,0,0);
  //line(x-30,y+30,x+30,y+30); //mouth
  
  fill(236,60,150); //pink
  noStroke();
  ellipse(x,y,35,20); //nose
  fill(157,48,33);
  rect(250,375,30,100); //neck
  ellipse(250,450,100,190); //body
  fill(236,60,150); //pink
  ellipse(250,450,70,100); //tummy
  stroke(137,48,33);
  strokeWeight(7);
  line(210,400,130,350); //arm
  line(290,400,360,350);//arm
  noStroke();
  strokeWeight(0);
  fill(157,48,33);
  ellipse(130,350,40,40); //hands
  ellipse(360,350,40,40);//hands
  fill(236,60,150);
  ellipse(130,350,20,20);//paws
  ellipse(360,350,20,20);//paws
  noFill();
  stroke(0);
  arc(250,280,70,70,0, PI/1);
  line(250,280,250,315);
  noStroke();
  
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
  //line(mouseX+90,mouseY+80,mouseX+110,mouseY+80);
  noFill();
  arc(mouseX+100,mouseY+70,30,30,0,PI/1);
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
  
  stroke(245,335,40);
  strokeWeight(5);
  line(60,60,80,80);
  line(70,40,90,50);
  line(45,65,65,95);
  line(75,20,100,10);
  line(15,80,25,100);
  
   
}

void keyPressed(){
  stroke(137,48,33);
  strokeWeight(5);
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
 
  
  fill (random (0,255));
  ellipse(250,450,70,100); //tummy
   ellipse(130,350,20,20);//paws
  ellipse(360,350,20,20);//paws


}




