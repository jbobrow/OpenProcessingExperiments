
int monsterX;
int monsterY;

int richting;
int teller;
boolean test;

void setup() {
  size(500, 500);
  monsterX = 150;
  monsterY = 250;
  
  test = true;
  richting = 10;
  teller = 0;
}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(0, 0, 0);
  rectMode(CENTER);
  rect(monsterX, monsterY+25, 50, 100);
  line(monsterX-50, monsterY, monsterX, monsterY+50); 
  line(monsterX, monsterY+50, monsterX+50, monsterY);
  fill(255);                
  ellipse(monsterX, monsterY-30, 60, 60);  
  fill(0);                   
  ellipse(monsterX-19, monsterY-30, 16, 32);   
  ellipse(monsterX+19, monsterY-30, 16, 32);
  fill(255, 255, 255);
  ellipse(monsterX-17, monsterY-30, 14, 30);
  ellipse(monsterX+18, monsterY-30, 14, 30);
  line(monsterX-10, monsterY-30, monsterX+10, monsterY-30);
  line(monsterX+20,monsterY+90,monsterX+20,monsterY+75);
  line( monsterX-20,monsterY+90,monsterX-20,monsterY+75);
  line( monsterX+20,monsterY+90,monsterX+30,monsterY+90);
  line( monsterX-20,monsterY+90,monsterX-30,monsterY+90);
  
  monsterX =  mouseX;
  
   if(test == true){
     fill(250,0,0);
   }
  
  if(test == false){
    fill(0,255,0);
    ellipse(monsterX, monsterY-30, 60, 60);  
  }
  
  monsterY = monsterY + richting;
  if (monsterY > 500 || monsterY < 0){
  richting= -richting;
  teller = teller +1;
  }
  
  if(teller == 10){
    teller = 0;
    test = !test;
  }

  
  
  


}

