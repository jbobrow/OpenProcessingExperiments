
int money = 0;

float cd = 60;

int pop = 0;
int cap = 0;
int popsek = 1;
int onesek = 60;

//coppermønt
int copperx = 60;
int coppery = 540;
float coppers = 1.0;

//silvermønt
int silverx = 140;
int silvery = 540;
float silvers = 1.0;

//goldmønt
int goldx = 220;
int goldy = 540;
float golds = 1.0;

//unlocks
boolean unsilver = false;
boolean ungold = false;

//town
int house = 0;
int hoejhouse = 0;

void setup() {
  size(800, 600);
  frameRate(60);
}

void draw() {
  background(49, 202, 255);
  //gras
  fill(56, 167, 68);
  rect(-1, 100, width+2, height-99);
  //sol
  fill(255, 246, 70);
  ellipse(width-210, 10, 60, 60);
  //skyer
  noStroke();
  fill(255, 255, 255);
  ellipse(160, 40, 60, 40);
  ellipse(190, 50, 60, 40);
  ellipse(175, 60, 60, 40);
  ellipse(450, 40, 60, 40);
  ellipse(430, 30, 60, 40);

  //sidebar
  stroke(0, 0, 0);
  fill(196, 196, 196);
  rect(width-201, -1, 202, height+2);

  //money
  textSize(32);
  fill(214, 214, 214);
  rect(0, height-140, 599, 140);
  fill(0, 0, 0);
  text("Print some money ", 6, 500);
  //copper
  fill(222, 149, 101);
  ellipse(copperx, coppery, cd*coppers, cd*coppers);
  fill(255, 217, 77);
  text(money, 6, 32);
  fill(0, 0, 0);
  text("1", 50, 550);
  if (coppers<1) {
    coppers +=0.05;
  }

  //silver
  if (unsilver) {
    fill(185, 185, 185);
    ellipse(silverx, silvery, cd*silvers, cd*silvers);
    if (silvers<1) {
      silvers +=0.05;
    }
  }

  //gold
  if (ungold) {
    fill(250, 226, 91);
    ellipse(goldx, goldy, cd*golds, cd*golds);
    if (golds<1) {
      golds +=0.05;
    }
  }

  //cap & pop
  textSize(16);
  fill(0, 0, 0);
  if (pop<cap&&onesek==60) {
    pop+=popsek;
  }
  text("Pop: "+pop, width-194, 28);
  text("Cap: "+cap, width-194, 48);

  //income
  if (onesek==60) {
    money+=pop;
  }


  onesek-=1;
  if (onesek<0) {
    onesek=60;
  }

  //housefelt
  textSize(32);
  fill(214, 214, 214);
  rect(width-200, 64, 199, 50);
  fill(0, 0, 0);
  text(house, width-190, 100);
  dhouse(width-50, 70);
  textSize(8);
  fill(0, 0, 0);
  text("Cost: "+(8+round(1.5*(house+1)*(house+1)))+" Cap: +1", width-190, 110);
  //tegn på map
  for (int i = house; i > 0; i -= 1) {
    dhouse(8+32*((i-1)%8), 80+floor((i-1)/8)*38);
  }

  //hoejhousefelt
  textSize(32);
  fill(214, 214, 214);
  rect(width-200, 114, 199, 50);
  fill(0, 0, 0);
  text(hoejhouse, width-190, 150);
  dhoejhouse(width-50, 120);
  textSize(8);
  fill(0, 0, 0);
  text("Cost: "+(80+round(5*(hoejhouse+2)*(hoejhouse+2)))+" Cap: +5", width-190, 160);
  //tegn på map
  for (int i = hoejhouse; i > 0; i -= 1) {
    dhoejhouse(320+32*((i-1)%8), 80+floor((i-1)/8)*38);
  }
  //tegnmennesker
  for (int i = pop; i>0; i-=1) {
   dmand(10+i*7,-i%3*20+420);
  }
}

void mousePressed() {
  if (mouseX>copperx-cd/2&&mouseX<copperx+cd/2&&mouseY>coppery-cd/2&&mouseY<coppery+cd/2) {
    money += 1;
    coppers = 0.7;
  }
  if (mouseX>silverx-cd/2&&mouseX<silverx+cd/2&&mouseY>silvery-cd/2&&mouseY<silvery+cd/2) {
    money += 2;
    silvers = 0.7;
  }
  if (mouseX>goldx-cd/2&&mouseX<goldx+cd/2&&mouseY>goldy-cd/2&&mouseY<goldy+cd/2) {
    money += 5;
    golds = 0.7;
  }
  if (mouseX>width-200&&mouseX<width&&mouseY>64&&mouseY<114&&money>=8+round(1.5*(house+1)*(house+1))) {
    cap += 1;
    money -= 8+round(1.5*(house+1)*(house+1));
    house += 1;
  }
  if (mouseX>width-200&&mouseX<width&&mouseY>114&&mouseY<164&&money>=80+round(5*(hoejhouse+2)*(hoejhouse+2))) {
    cap += 5;
    money -= 80+round(5*(hoejhouse+2)*(hoejhouse+2));
    hoejhouse += 1;
  }
}


void dhouse(int placex, int placey) {
  fill(255, 188, 41);
  rect(0+placex, 15+placey, 30, 20);
  fill(126, 107, 66);
  beginShape();
  vertex(0+placex, 15+placey);
  vertex(30+placex, 15+placey);
  vertex(15+placex, 0+placey);
  vertex(0+placex, 15+placey);
  endShape();
}

void dhoejhouse(int placex, int placey) {
  fill(200, 200, 200);
  rect(0+placex, 15+placey, 30, 20);
  fill(200, 200, 200);
  beginShape();
  vertex(0+placex, 15+placey);
  vertex(30+placex, 15+placey);
  vertex(15+placex, 0+placey);
  vertex(0+placex, 15+placey);
  endShape();
}

void dmand(int placex, int placey) {
  fill(237, 204, 163);
  ellipse(5+placex, 5+placey, 10, 10);
  line(5+placex, 10+placey, 5+placex, 20+placey);
  line(5+placex, 10+placey, 10+placex, 13+placey);
  line(5+placex, 10+placey, 0+placex, 13+placey);
  line(5+placex, 20+placey, 10+placex, 25+placey);
  line(5+placex, 20+placey, 0+placex, 25+placey);
}



