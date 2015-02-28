
int Y;
int X;
int y = 0;
int x = 0;
int stop = 300;
int spatie = 15;

void setup() {

size(500,500);
background(255);
X = height/2;
}


void draw(){

 
for (int i = 1; i< 4; i++){
  tekenen((i*135),X);
}

}




 
 void tekenen (int monsterX, int monsterY) {
  fill(31,222,40);
ellipse(monsterX, monsterY-30, 100, 70); //lichaam
  
fill(252);
  ellipse(monsterX-20, monsterY-65, 40, 40);
  ellipse(monsterX+20, monsterY-65, 40, 40);//ogen
  
fill (5, 0, 5);
  stroke(7, 0, 6);
  ellipse (monsterX-10, monsterY-60, 10, 10);
  ellipse (monsterX+10, monsterY-60, 10, 10);//pupillen
 
fill(224,103,225);
  ellipse (monsterX-35, monsterY-30, 12, 12);
  ellipse (monsterX+35, monsterY-30, 12, 12);//wangen
  fill (0);
  stroke(0);
  ellipse( monsterX, monsterY-15, 40, 20);//mond
  
  
 }

