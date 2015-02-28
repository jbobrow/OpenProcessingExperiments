
int monsterY;
int monsterX;

int richting; 
int teller = 0;

boolean test = true;

void setup(){

size(500,500);
  monsterX = 250;
  monsterY = 250;
  richting = 10;
}

void draw(){
monsterY--;
background(48,139,206);


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

if(test == true){
    fill(255,0,0);
  }
   
  if(test == false){
    fill(0,255,0);
  }
  
//binnenogen
stroke(0);
ellipseMode(CENTER);
ellipse(monsterX-37,monsterY-25,25,35);
ellipse(monsterX+37,monsterY-25,35,25);

  monsterY = monsterY +richting;
    
  if(monsterY > 500 || monsterY < 0){
    richting= -richting;
    teller = teller + 1;
  }
  
  if(monsterY==-30) {
    monsterY=530;
  }
   
  if(teller ==10){
    teller = 0;
    test = !test;
  }
  
//println("breng me naar je moeder"); 
  println(monsterX);
  println(teller);
  println(test);
}



