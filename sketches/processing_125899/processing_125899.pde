
int monsterX;
int monsterY;

int richting;
int teller;

boolean test;

void setup() {
  size(200, 200);
  richting= 3;
  teller= 0;
  test= true;
  monsterY= height/2;
}

void draw() {
  
  background(73, 170, 174);
  stroke(255);
  //oren L+R
  fill(0);
  ellipse(monsterX-40, monsterY-50, 50, 50);
  fill(0);
  ellipse(monsterX+40, monsterY-50, 50, 50);

  //poten
  fill(0);
  ellipse(monsterX+40, monsterY+50, 45, 35);
  fill(0);
  ellipse(monsterX-40, monsterY+50, 45, 35);

  //voorpoten
  fill(0);
  ellipse(monsterX-80, monsterY, 45, 35);
  fill(0);
  ellipse(monsterX+80, monsterY, 45, 35);



  //body
  fill(255);
  ellipse(monsterX, monsterY, 150, 150);
  fill(0);
  rect(monsterX-75, monsterY, 150, 25);


  //ogen L+R

  if (test==true) {
    fill(0);
  }
  if (test==false) {
    fill(0,255,0);
  }
  ellipse(monsterX-30, monsterY-10, 50, 40);

  ellipse(monsterX+30, monsterY-10, 50, 40);
  fill(255, 0, 0);
  ellipse(monsterX+25, monsterY-5, 20, 20);
  ellipse(monsterX-25, monsterY-5, 20, 20);



  //neus
  ellipse(monsterX, monsterY+15, 30, 10);
  //mond
  rect(monsterX-15, monsterY+20, 30, 50);



  //tanden
  fill(255);
  ellipse(monsterX-17, monsterY+33, 15, 12);
  fill(255);
  ellipse(monsterX-5, monsterY+33, 10, 12);
  fill(255);
  ellipse(monsterX+5, monsterY+33, 10, 12);
  fill(255);
  ellipse(monsterX+18, monsterY+33, 15, 12);


//monster moves up

monsterX = monsterX +richting;

if (monsterX > width || monsterX < 0) {
  richting =-richting;
  if (teller== 10) {
    teller=0;
    test= !test;
  }

  teller=teller+1;
  println(teller);
 }
}

