
int X = height/2;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  for (int i = -1; i< 7; i++){
  monster((i*120),X);}
} 

void monster(int monsterX, int monsterY){

//POTEN
 fill(3,164,45);
 rect(monsterX -28,monsterY +135,15,25);
 rect(monsterX -11,monsterY +135,15,25);
  
//OREN
 fill(3,164,45);
 ellipse(monsterX -50,monsterY +73,25,25);
 ellipse(monsterX +10,monsterY +73,25,25);
 fill(52,105,33);
 ellipse(monsterX -50,monsterY +73,20,20);
 ellipse(monsterX +10,monsterY +73,20,20);
 
 //HOOFD
 fill(1,183,48);
 ellipse(monsterX -20,monsterY +100,100,75);
 
 //OGEN
 fill(255);
 ellipse(monsterX -32,monsterY +85,17,15);
 ellipse(monsterX -8,monsterY +85,17,15);
 fill(0);
 ellipse(monsterX -32,monsterY +85, 10, 10);
 ellipse(monsterX -8,monsterY +85, 10, 10);
 
 //NEUS
 fill(10,146,45);
 ellipse(monsterX -20,monsterY +100,30,15);
 fill(34,34,34);
 ellipse(monsterX -25,monsterY +100,5,5);
 ellipse(monsterX -15,monsterY +100,5,5);

 //MOND
 fill(0);
 ellipse(monsterX -20,monsterY +120,20,15);
 fill(249,0,41);
 ellipse(monsterX -20,monsterY +125,15,5); 
 
 //HOED
 fill(0);
 rect(monsterX -20,monsterY +65, 50, 8);
 fill(0);
 arc(monsterX -20,monsterY +65,40,40,-PI, 0); 
}
