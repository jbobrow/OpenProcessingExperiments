
//variable
float bob = 50;
float jane = mouseX;
float josh = mouseY;
float chaserX = 0;
float chaserY = 0;
 
//function
void setup(){
size(640,360);
background(225);
smooth();
noCursor();
}
void draw() {
   
 // if (chaserX<mouseX){chaserX++;}
 // else if (chaserX>mouseX){chaserX--;}
   
 // if (chaserY<mouseY){chaserY++;}
 // else if (chaserY>mouseY){chaserY--;}
   
  if(mousePressed){ 
jane = mouseX;
josh = mouseY;
  }
   
  if(keyPressed){
   jane=random(640);
    josh=random(360);
  }
   
background(225);
stroke (0);
strokeWeight(0);
rect(95,125,10,10);
fill(255,0,0);
rect(70,135,65,75);
fill(255,222,173);
ellipse(150,150,50,25);
ellipse(50,150,50,25);
fill(255,0,0);
rect(75,210,20,50);
rect(110,210,20,50);
fill(255,222,173);
rect(65,250,30,15);
rect(110,250,30,15);
fill(255,222,173);
ellipse(100,100,jane,josh);
louis ();
 
//if(keyPressed){if(key==" "){saveFrame("mary.png");}}
//frameRate(25);
 
}
 
void louis(){
  stroke(255,0,0);
  strokeWeight(10);
  point(mouseX,mouseY);
}

