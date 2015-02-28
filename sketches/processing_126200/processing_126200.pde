
int monsterX; // int = voor een mooi rond getal // beginwaarde
int monsterY; // int = voor een mooi rond getal
int richting; 
int score;
int verandering;
boolean test; 
PImage img; 

void setup () {
size(500,300);
img = loadImage("DSC_0148.JPG");

monsterX = 250; // begin waarde
monsterY = 250; // begin waarde
richting = 1;
score = 0;
verandering = 0;
test = false;

}

// sneeuw

void sneeuw(){  
  
fill(21,238,67);
for(int i=0; i < 100; i ++) {
ellipse(random(0,500),random(0,500),10,10);
}
}

void monster() {
  
// hand links

fill(288,189,4);
ellipse(monsterX-35,monsterY,40,20);

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
}

void draw () { 
stroke(0);
image(img, 0, 0, 500, 300);
sneeuw();
monster();
bewegen();
grens();
teller();
}

// test:

void bewegen (){
monsterX = monsterX - richting; 
}

void grens (){

if(monsterX > 500 || monsterX < 0){
  richting = -richting;
  score = score+1;
  println(score);
  println(test);
}
}

void teller (){
if(score==10) {
  test = true;
  score = 0;
  verandering = 90;
 
}
}

