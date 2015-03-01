
int m = millis(), a = 300, da = 2, b = 400, db = 5, c = 350, d = 600, e = 550, f = 900, g = 10, i = 40;
int h = random(0, 90), hh = random(0, 90), hhh = random(0, 90), hhhhh = random(0, 90), hhhhhh = random(0, 90);
void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
//images
  helipad = loadImage("helipad.jpg");
  xwing = loadImage("xwing.png");
  xwing2 = loadImage("xwing2.png");
  tieFighter = loadImage("tieFighter.png");
  tieBomber = loadImage("tieBomber.ico");
  stars = loadImage("stars.jpg");
  asteroid = loadImage("asteroid.png");
  fire = loadImage("fire.png");
  smoke = loadImage("smoke.png");
  deathStar = loadImage("deathStar.png");
  deathStarB = loadImage("deathStarBroken.png");
  hitMarker = loadImage("hitMarker.png");
  cockpit = loadImage("cockpit.gif");
  kamehameha = loadImage("kamehameha.png");
  
}

void draw(){
  counter = millis()/1000;

//PHASE 1 COUNTER = 0-24
  if(counter>0){
    if(counter<24){

//helipad
  helipad.resize(500, 500);
  image(helipad, 0 ,0);
  
//xwing
  if(counter>0){
    if(counter<17){
      xwing.resize(100, 100);
      image(xwing, 300, 300);
    }
  }
  if(counter>17){
    if(counter<24){
      image(xwing, 300, a);
      a-=da;
    }
  }
  
//deathStar
  deathStar.resize(50, 50);
  image(deathStar, 400, 30);
  
//countdowntext
  fill(#000000);
  textSize(50);
  if(counter>2){
    if(counter<4){
      text("T minus 5!", 50, 40);
    }
  }
  if(counter>5){
    if(counter<7){
      text("4!", 50 , 40);
    }
  }
  if(counter>8){
    if(counter<10){
      text("3!", 50, 40);
    }
  }
  if(counter>11){
    if(counter<13){
      text("2!", 50, 40);
    }
  }
  if(counter>14){
    if(counter<16){
      text("1!", 50, 40);
    }
  }
  if(counter>17){
    if(counter<19){
      for( int i = 40; i<300; i = i+50){
      text("LAUNCH", 50, i);
      }
    }
  }
  
//smoke
  if(counter>8){
    if(counter<23){
      smoke.resize(200, 100);
      image(smoke, 250, 350);
    }
  }
  
//fire
  if(counter>17){
    if(counter<24){
      fire.resize(100, 100);
      image(fire, 300, b);
      b-=da;
    }
  }
    }
  }
 
//PHASE 2 COUNTER = 24-32
  if(counter>24){
    if(counter<32){

//star background
    stars.resize(500, 500);
    image(stars, 0, 0);

//text
  fill(#FFFFFF);
  textSize(20); 
  text("Potential game for future project.", 0, 25);
  text("Use the mouse to control the X-Wing.", 0, 50);
 
//xwing
    xwing2.resize(80, 80);
    image(xwing2, mouseX-40, mouseY-45);
    
//Tie Group 1
  tieFighter.resize(70, 70);
  image(tieFighter, b, 400);
  image(tieFighter, b, 300);
  tieBomber.resize(70, 70);
  image(tieBomber, c, 350);
  b-=db;
  c-=db;
  
//Tie Group 2
  image(tieFighter, d, 200);
  image(tieFighter, d, 100);
  image(tieBomber, e, 150);
  d-=db;
  e-=db;
  
//Tie Group 3
  image(tieFighter, f, 50);
  image(tieFighter, f, 450);
  image(tieBomber, f, 250);
  f-=db;
  
//shooting stars
  stroke(#FFFFFF);
  strokeWeight(3);
  for(int g=10; g<600; g = g+90){
      line(g+hhhhh, 50, g+hhhhh+50, 50);
      line(g+h, 100, g+h+50, 100);
      line(g+hh, 150, g+hh+50, 150);
      line(g+10, 200, g+60, 200);
      line(g+hhh, 250, g+hhh+50, 250);
      line(g+30, 300, g+80, 300);
      line(g+20, 350, g+70, 350);
      line(g, 400, g+50, 400);
      //line(g+hhhh, 450, g+hhhh+50, 450);
  }
    }
  }
      
//PHASE 3 COUNTER = 32 - 

if(counter>32){
  
//kamehameha
  if(counter>33){
    if(b>50){
      kamehameha.resize(50, 70);
      image(kamehameha, 250, b);
      strokeWeight(5);
      stroke(#FF0000);
      line(250, b, 250, b+30);
      b=b-db;
    }
  }
  
//star background
  stars.resize(500, 500);
  image(stars, 0, 0);
  
//cockpit
  cockpit.resize(500, 500);
  image(cockpit, 0, 0);
  
   
//Colorful button
  for(int g = 20; g>1; g = g-.3){
    float h = random(0, 360);
    fill(h, 90, 90);
    noStroke();
    ellipse(147, 340, g, g+6);
  }
  
//Death star before
  if(counter>32){
    if(counter<35){
      deathStar.resize(100, 100);
      image(deathStar, 225, 50);
    }
  }
 
//Death star after
  if(counter>35){
    deathStarB. resize(100, 100);
    image(deathStarB, 225, 50);
  }


}
}



