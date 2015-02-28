
int pandaY;
int horizon;
int richting;
boolean kleurtje;
int counter;
float i = 50;

int spatie = 30;
int stop = 550;
int breedte = 15; 
int hoogte = 15;

void setup() {
  size(500, 500);
  frameRate(60);
  pandaY=500;
  
  richting = -5;
  kleurtje = false;
  counter = 0;
  
}

void draw() {
  if ( kleurtje == false ){background(245);}
  if ( kleurtje == true ){background(30);}
  horizon=mouseX;
  
  snowyBackground();
  panda();
  pandaBounce();
  snow();
  klok();
  shoot();

}



void panda(){



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
  if (kleurtje == true){  rect(horizon,pandaY+70, 7,7);}

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
  
}
void pandaBounce(){ 
  pandaY = pandaY + richting;
  if (pandaY == -200 || pandaY == 700) { 
  richting = -richting;
 counter = counter+1;
  }
  if (counter==10){ 
    kleurtje= !kleurtje;
    counter = 0;
  }
}

 void snow(){  
  //sneeuw
    for(int x=10; x < stop;x = x+spatie){
     stroke(0);
    fill(255);
  ellipse(random(500),random(500),breedte,hoogte); 
  
  i = i+0.1;
   }
  while (i > 500) { i = 0; }
 }
    
void klok(){
    
  if(kleurtje == false){fill(26);}
  if(kleurtje == true){fill(240);}
  text(counter, 15, 35);
  textSize(30);
  
}

  void snowyBackground(){
  
      stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(293,1402 , 1476, 2245);
  
     stroke(0);
  fill(253);
  ellipseMode(CENTER);
  ellipse(-457,1064 , 2254, 1693);
  
  stroke(0);
  fill(250);
  ellipseMode(CENTER);
  ellipse(758,1242 , 1941, 1819);
  }
  
  
  void shoot(){
    if (mousePressed){ if(kleurtje == false) {
      stroke(0);
  fill(5);
  rectMode(CORNER);
  rect(horizon+30, pandaY-24, 10, height*2);
    
    
        stroke(0);
  fill(5);
  rectMode(CORNER);
  rect(horizon-40, pandaY-24, 10, height*2);
    }
    if (kleurtje == true){
      
  noStroke();
  fill(211,26,26);
  ellipseMode(CENTER);
  ellipse(horizon-35, pandaY-40, 200, 200);
  
    noStroke();
  fill(211,26,26);
  ellipseMode(CENTER);
  ellipse(horizon+35, pandaY-40, 200, 200);
  
    noStroke();
  fill(230,20,20);
  ellipseMode(CENTER);
  ellipse(horizon-35, pandaY-40, 100, 100);
  
      noStroke();
  fill(230,20,20);
  ellipseMode(CENTER);
  ellipse(horizon+35, pandaY-40, 100, 100);
  
    noStroke();
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(horizon-35, pandaY-40, 50, 50);
  
  
    noStroke();
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(horizon+35, pandaY-40, 50, 50);
  
  stroke(0);
  fill(0);
  rectMode(CORNER);
  rect(horizon-14,pandaY+60, 28,843);
    }
    
  }}

