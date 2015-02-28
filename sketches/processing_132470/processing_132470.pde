
// monster werkt wel in het processing programma 
Monster mijnMonster;
Monster mijnMonster2;
Monster mijnMonster3;

void setup() {
  size(500,500);
  mijnMonster = new Monster(200,50,1);
  mijnMonster2 = new Monster(60,80,2);
  mijnMonster3 = new Monster(400,20,3);
}

void draw() {
  background(255);
  mijnMonster.update();
  mijnMonster.drawMonster();
  mijnMonster.test();
  
  mijnMonster2.update();
  mijnMonster2.drawMonster();
  mijnMonster2.test();
  
  mijnMonster3.update();
  mijnMonster3.drawMonster();
  mijnMonster.test();
}


class Monster{
int Y = 120;
int X = 100;
int y = 0;
int x = 0;
int stop = 900;
int spatie = 15;
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;

  Monster(int tempX, int tempY, int tempRichting){
    monsterX = tempX;
    monsterY = tempY;
    richting = tempRichting;
    test = true;
  }
  void update(){
    monsterY = monsterY + richting;
    if(monsterY > width){
      richting = - richting;}
  }
  
  void test() {
    if(monsterY <=0 || monsterY >= height){
      richting = -richting;
      teller = teller + 1;
    }
  }

void drawMonster(){
  //oorschelp links
  fill (90,45,7);
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX-40,monsterY-45,35,35);

fill (209,150,0); // oor links
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX-40,monsterY-45,25,25);

//oorschelp rechts
fill (90,45,7);
ellipseMode(CENTER);
stroke(0);
ellipse( monsterX+40,monsterY-45,35,35);

fill (209,150,0); // oor rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX+40,monsterY-45,25,25);

//body
fill (116,56,7);
ellipseMode(CENTER);
stroke(0);
ellipse( monsterX,monsterY,100,100); //x80 y140

//arm links   
fill (90,45,7);
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX-50,monsterY-10,20,20);

//arm rechts
fill (90,45,7);
ellipseMode(CENTER);
stroke(0);
ellipse( monsterX+50,monsterY-10,20,20);

fill (0); //neus
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX,monsterY,20,10);

fill (255); //neusgat links
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX-5,monsterY+1,3,3);

fill (255); //neusgat rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( monsterX+5,monsterY+1,3,3);

line (monsterX-15,monsterY+12,monsterX+15,monsterY+12); //mond
triangle(monsterX-10, monsterY+12, monsterX-4, monsterY+18, monsterX+2, monsterY+12); //tand


// voet links
fill (90,45,7);
ellipseMode(CENTER);
stroke(0);
ellipse( monsterX-30,monsterY+35,40,40);

// voet rechts
fill (90,45,7);
ellipseMode(CENTER);
stroke(0);
ellipse( monsterX+30,monsterY+35,40,40);

line (monsterX-25,monsterY-35,monsterX-5,monsterY-30); //wenkbrauw links

fill(0); // oog links
stroke(0);
rect( monsterX-10,monsterY-25,2,15,2); 

line (monsterX+5,monsterY-30,monsterX+25,monsterY-35); //wenkbrauw rechts

fill (0); // oog rechts
stroke(0);
rect( monsterX+10,monsterY-25,2,15,2); 

line(monsterX+50,monsterY-20,monsterX+50,monsterY-80); //touw ballon

fill (255,0,0);// ballon
ellipseMode(CENTER);
ellipse( monsterX+50,monsterY-100,60,60);

triangle(monsterX+45, monsterY-60, monsterX+50, monsterY-70, monsterX+55, monsterY-60);

fill (255); // bite
ellipseMode(CENTER); 
noStroke();
ellipse( monsterX-50,monsterY-56,10,10);
fill (255); 
ellipseMode(CENTER); 
noStroke();
ellipse( monsterX-44,monsterY-61,10,10);
}
}
