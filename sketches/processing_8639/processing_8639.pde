
//my monster by Che Han z3256214

float c1 = 255; float c2 = 255 ;float c3 = 255;
int posx; int posy; 

void setup() {
  size(1000,1000); 
  smooth();
  println("click mouse to attack, press space bar to change background colour!!!");
}

void draw() {
  float x = 0;
  // println(mouseX + "," + mouseY);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //draw last spit/attack
  if ( (posx + posy) != 0 ) {
    background(c1,c2,c3);
    stroke(5,255,5,100);
    fill(5,255,5,100);
    ellipse(posx,posy,100,30);  //draw spit  
  } else {
   background(255); 
  }
  
  //tail
  stroke(47);
  fill(45);
  ellipse(mouseX-150,mouseY+110,40,50);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-140,mouseY+100,50,70);
  fill(45);
  ellipse(mouseX-130,mouseY+90,60,90);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-120,mouseY+80,70,110);
  fill(45);
  ellipse(mouseX-110,mouseY+70,80,130);
  
  
  //body
  stroke(47);
  fill(45);
  ellipse(mouseX-50,mouseY-20,160,310);
  
  //right arm
  rectMode(CORNER);
  stroke(45);
  fill(45);
  rect(mouseX-140,mouseY-150,50,100); //shoulder
  rectMode(CENTER);
  
  //left arm
  rectMode(CORNER);
  stroke(45);
  fill(45);
  rect(mouseX-20,mouseY-150,50,100); //shoulder
  rectMode(CENTER);
  
  //right leg
  fill(50);
  ellipse(mouseX-100,mouseY+70,80,110);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-100,mouseY+80,75,100);
  fill(60);
  ellipse(mouseX-96,mouseY+80,67,85);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-91,mouseY+110,65,140);
  
  //right feet
  stroke(70);
  fill(70);
  rect(mouseX-95,mouseY+180,65,25);
  
  //left leg
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX,mouseY+80,75,100);
  fill(60);
  ellipse(mouseX+4,mouseY+80,67,85);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX+9,mouseY+110,65,140);
  
  
  //left feet
  stroke(70);
  fill(70);
  rect(mouseX+10,mouseY+180,65,25);
  
  
   //neck
  stroke(50);
  fill(50);
  ellipse(mouseX-50,mouseY-100,90,160);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-37.5,mouseY-75,80,150);
  fill(60);
  ellipse(mouseX-25,mouseY-50,75,145);
  fill(127,mouseY%255,mouseX%255);
  ellipse(mouseX-12.5,mouseY-25,70,140);
  
  //monster face
  fill(70);
  ellipse(mouseX,mouseY,70,120);
  
  // mouth
  
  // eye
  fill(255,10,10);
  ellipse(mouseX-10,mouseY-15,15,25);
  
}

void mousePressed() {
  
   background(255);
   
   println("monster attacks!"); 
   
   //monster spits acid
   stroke(5,255,5); //green
   fill(5,255,5);
   
   int x=10; int y =20;
   
   //draw trajectory of spit
   while (x <= 150 || y <= 165) {
     ellipse(mouseX+x,mouseY+x,50,50);
     x = x+10;
     y = y+10;
   }
   
    posx = pmouseX+155;
    posy = pmouseY+165;
}

void keyPressed() {
   println("key pressed"); 
   c1 = (random(255));
   c2 = (random(255));
   c3 = (random(255));
    
   println(key);
}

