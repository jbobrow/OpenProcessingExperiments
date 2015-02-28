
int monsterY;
int monsterX;


void setup(){

size(1400,650);
  monsterX = 500;
  monsterY = 500;
  
}

void draw(){
background(48,139,206);




for(int i=0; i < 10; i ++){
  monster (i*300);

  }
}


void monster(int monsterX){
//lijn
stroke(0);
fill(0);
line(monsterX-90,monsterY+50,monsterX-90,monsterY-80);
line(monsterX+90,monsterY+50,monsterX+90,monsterY-80);

//oren
stroke(255,0,255);
fill(255,0,255);
rectMode(CENTER);
rect(monsterX-50,monsterY-50,85,75);
rect(monsterX+50,monsterY-50,85,75);
rect(monsterX,monsterY-100,75,75);
rect(monsterX+50,monsterY-100,50,40);
rect(monsterX-50,monsterY-100,50,40);

//bolletje
stroke(255,0,255);
fill(255,0,255);
ellipse(monsterX-90,monsterY+50,20,20);
ellipse(monsterX+90,monsterY+50,20,20);

//body
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(monsterX,monsterY,150,150);

//buitenogen
stroke(255);
fill(255);
ellipseMode(CENTER);
ellipse(monsterX-37,monsterY-25,45,70);
ellipse(monsterX+37,monsterY-25,70,45);



//binnenogen
stroke(0);
fill (0);
ellipseMode(CENTER);
ellipse(monsterX-37,monsterY-25,25,35);
ellipse(monsterX+37,monsterY-25,35,25);
}



  




