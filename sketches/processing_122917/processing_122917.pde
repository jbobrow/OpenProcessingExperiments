
int monsterX; // int = voor een mooi rond getal
int monsterY; // int = voor een mooi rond getal
int richting; 
int score;
int verandering;
boolean test; 

void setup () {
size(200,200);
monsterX = 100; // begin waarde
monsterY = 150; // begin waarde
richting = 1;
score = 0;
verandering = 0;
test = false;
}

/* commentaar
Inhoud sketch */

void draw () { 
background(220,49,27);
stroke(0);

// hand links

fill(288,189,4);
ellipse(monsterX-40,monsterY,40,20);

// hand rehts

fill(288,189,4);
ellipse(monsterX+35,monsterY,40,20);

// lijfje

fill(0,0,verandering);
ellipse(monsterX,monsterY +1,60,80);

// hoofd

fill(71,203,236);
ellipse(monsterX,monsterY-50,70,90);

// hoedje

fill(0,0,0);
triangle(monsterX-25,monsterY-82,monsterX,monsterY-112,monsterX+25,monsterY-82);

// oog rehts:

fill(0,0,0);
ellipse(monsterX+15,monsterY-60,15,25);

// oog links:

fill(0,0,0);
ellipse(monsterX-10,monsterY-60,15,25);

// mond

fill(0,0,0);
rectMode(CORNER);
rect(monsterX-20,monsterY-40,40,5);

fill(255,0,0);
rect(monsterX-5,monsterY-40,12,5);

// tand links

fill(225);
triangle(monsterX-20,monsterY-35,monsterX-15,monsterY-25,monsterX-10,monsterY-35);

// tand rechts

fill(225);
triangle(monsterX+10,monsterY-35,monsterX+15,monsterY-25,monsterX+20,monsterY-35);

// voet rechts

fill(228,189,4);
ellipse(monsterX+30,monsterY+40,50,30);

// voet links

fill(228,189,4);
ellipse(monsterX-30,monsterY+40,50,30);

// test:

monsterX = monsterX - richting; 

if(monsterX > 200 || monsterX < 0){
  richting = -richting;
  score = score+1;
  println(score);
  println(test);

if(score==10) {
  test = true;
  score = 0;
  verandering = 90;
}
}
}

