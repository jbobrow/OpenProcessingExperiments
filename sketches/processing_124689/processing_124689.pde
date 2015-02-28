
int pandaY;
int horizon;
int richting;
boolean kleurtje;
int counter;
float i = 50;

int spatie = 30;
int stop = 550;
int breedte = 10; 
int hoogte = 10;

void setup() {
  size(500, 500);
  frameRate(60);
  pandaY=500;
  horizon=mouseX;
  richting = -5;
  kleurtje = false;
  counter = 0;
  
}

void draw() {
  background(255, 255, 255);
  pandaY = pandaY + richting;
  if (pandaY == -200 || pandaY == 700) { 
  richting = -richting;
 counter = counter+1;
  }
  if (counter==10){ 
    kleurtje= !kleurtje;
    counter = 0;
  }
  
  horizon=mouseX;
  
  // klok WERKT NIET MEER SINDS LOOP ? :(
  text(counter, 15, 35);
  textSize(30);
  fill(26);


  //oren
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon-80, pandaY-80, 60, 60);


  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon+80, pandaY-80, 60, 60);

  //hoofd
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(horizon, pandaY, 200, 200);

  //neus
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon, pandaY, 40, 40);

  //linker oog
  stroke(0);
  fill(5);
  ellipseMode(CENTER);
  ellipse(horizon-40, pandaY-40, 50, 50);

  stroke(0);
  if (kleurtje == false){fill(0, 150, 255);}
  if (kleurtje == true){fill(211,26,26);}
  ellipseMode(CENTER);
  ellipse(horizon-35, pandaY-40, 20, 20);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon-35, pandaY-40, 6, 6);

  //rechter oog
  stroke(0);
  fill(5);
  ellipseMode(CENTER);
  ellipse(horizon+40, pandaY-40, 50, 50);

  stroke(0);
  if (kleurtje == false){fill(0, 150, 255);}
  if (kleurtje == true){fill(211,26,26);}
  ellipseMode(CENTER);
  ellipse(horizon+35, pandaY-40, 20, 20);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon+35, pandaY-40, 6, 6);

  // mond
  stroke(0);
  fill(0);
  rectMode(CENTER);
  if (kleurtje == false){  rect(horizon, pandaY+50, 7, 7);}
  if (kleurtje == true){  rect(horizon,pandaY+70, 27,62);}

  //bamboo
  noStroke();
  if (kleurtje == false){fill(28, 148, 24);}
  if (kleurtje == true){fill(211,26,26);}
  rectMode(CENTER);
  if (kleurtje == false){rect(horizon-60, pandaY+90, 10, 150);}
  if (kleurtje == true){rect(horizon-60, height/2, 10, height);}



  //hands
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon-70, pandaY+80, 70, 50);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(horizon+70, pandaY+80, 70, 50);
  
  //sneeuw
    for(int x=10; x < stop;x = x+spatie){
     stroke(0);
    fill(255);
  ellipse(random(500),random(500),breedte,hoogte); 
  
  i = i+0.1;
   }
  while (i > 500) { i = 0; }
  
 
}

