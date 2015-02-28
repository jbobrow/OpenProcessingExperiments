
int vierkantX;
int vierkantY;
int richting;
int teller;
int y;
boolean test;

int spatie;
int stop;
int breedte;

void setup () {
  size (500, 500);
  vierkantX = 100;
  vierkantY = 100;
  richting = -10;
  teller = 0;
  test = true;
  spatie = 10;
  stop = height;
  breedte = 10;
  
}

void draw () {
  background (255, 200, 255);
  
  while (y < stop) {
    line(500, y, 0, y);
    y = y + spatie;
  }
    y = 255;
 
  
  stroke(0, 255, 0);
    if (test == true) {
    fill(0,255,0);
  }
  if(test ==false) {
    fill(255);
  }
  //fill(0, 255, 0);
  

  
  ellipse(vierkantX+60, vierkantY+115, 25, 25);
  ellipse(vierkantX, vierkantY+115, 25, 25);
    if (test == true) {
    fill(255,100,150);
  }
  if(test ==false) {
    fill(0,0,150);
  }
  //fill(255, 100, 150);
  rect(vierkantX-20, vierkantY-20, 100, 130);
    if (test == true) {
    fill(0,255,0);
  }
  if(test ==false) {
    fill(255);
  }
  //fill(0, 255, 0);
  rect(vierkantX-10, vierkantY, 30, 30);
  rect(vierkantX+30, vierkantY-10, 40, 40);
    if (test == true) {
    fill(255);
  }
  if(test ==false) {
    fill(255,0,0);
  }
  //fill(255);
  rect(vierkantX-10, vierkantY, 15, 15);
  rect(vierkantX+30, vierkantY-10, 20, 20);
    if (test == true) {
    fill(0);
  }
  if(test ==false) {
    fill(0,0,250);
  }
  //fill(0);
  rect(vierkantX-7, vierkantY+3, 7, 7);
  rect(vierkantX+35, vierkantY-5, 10, 10);
  line(vierkantX-40, vierkantY, vierkantX-20, vierkantY+80);
  line(vierkantX+100, vierkantY, vierkantX+80, vierkantY+80);
    if (test == true) {
    fill(255,150,150);
  }
  if(test ==false) {
    fill(0,255,0);
  }
  //fill(255, 150, 150);
  ellipse(vierkantX+30, vierkantY+70, 50, 20);
  
  vierkantX = vierkantX +richting;


   if(vierkantX >500 || vierkantX <0) {
    richting = -richting;
    teller = teller +1;
  }
  
  if (teller == 10) {
    teller = 0;
    test = !test;
   
  }
  
  
  println(teller);
}
