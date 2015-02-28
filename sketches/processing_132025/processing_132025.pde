
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
 stroke(0);
  
  fill(0, 0, 0);
  rectMode(CENTER);
  rect( monsterX, monsterY+25, 50, 100);                    //lichaam
  line(monsterX-50, monsterY, monsterX, monsterY+50 );      //arm links
  line(monsterX, monsterY+50, monsterX+50, monsterY );       //arm rechts
  fill(0,0,255);                
  ellipse(monsterX, monsterY-30, 60, 60);                    //hoofd
  fill(0);                   
  ellipse(monsterX-19, monsterY-30, 16, 32);                 //oogkast links
  ellipse(monsterX+19, monsterY-30, 16, 32);                //oogkast rechts
  fill(0,255,0);
  ellipse(monsterX-17, monsterY-30, 14, 30);              //oogbal links
fill(255,0,0);  
  ellipse(monsterX+18, monsterY-30, 14, 30);                //oogbal rechts
  line(monsterX+20, monsterY+90, monsterX+20, monsterY+75);  //been rechts
  line( monsterX-20, monsterY+90, monsterX-20, monsterY+75);  //been links
  line( monsterX+20, monsterY+90, monsterX+30, monsterY+90);   //voet rechts
  line( monsterX-20, monsterY+90, monsterX-30, monsterY+90);   //voet links
  
  
 }

  
  
