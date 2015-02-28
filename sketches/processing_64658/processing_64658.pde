
  PImage r;
  PImage r2;
  PImage man;
  PImage flame;
  PImage earthy;
  PImage sun;
  PImage mercury;
  PImage venusy;
  PImage mars;
  PImage jupiter;
  PImage saturn;
  PImage venus;
  PImage uranus;
  PImage pluto;
  PImage neptune;
  PImage flame2;
  PImage asteroid;
  PImage alien;
  PImage saturn2;
  PImage moon;
  
  PFont myFont;
  
int counter = 0;
int earth = 400;
int earthsize1 = 2000;
int earthsize2 = 500;
float R = 100;
float G = 194;
int sunsize = 0;
int sunmove = -75;
int sunmove1 = 600;
int memove = 50;
int memove1 = 510;
int pmove = 270;
int pmove1 = 275;
int nmove = 395;
int nmove1 = 300;
int amove = 750;
int youmove = 100;
int mmove = 250;
int mmove1 = 140;
int vmove = 385;
int vmove1 = 25;
int moomove = 650;
int mar = 400;
int ven = 400;

int mesize = 0;
int vsize = 0;
int esize = 0;
int msize = 0;
int jsize = 0;
int ssize = 0;
int usize = 0;
int nsize = 0;
int psize = 0;

void setup(){
  size(700,400);
  background(R,G,255);
   r = loadImage("rocket.png");
   r2 = loadImage("rocket2.png");
   man = loadImage("spaceman copy.png");
   flame = loadImage("flame.png");
   earthy = loadImage("Earth.png");
   sun= loadImage("sun.png");
   mercury = loadImage("Mercury.png");
   venus = loadImage("Venus.png");
   mars = loadImage("Mars.png");
   jupiter = loadImage("Jupiter.png");
   saturn = loadImage("Saturn.png");
   uranus= loadImage("Uranus.png");
   neptune = loadImage("Neptune.png");
   pluto = loadImage("Pluto.png");
   flame2 = loadImage("flame2.png");
   asteroid = loadImage("asteroid.png");
   alien = loadImage("alienspaceship.png");
   saturn2 = loadImage("saturn2.png");
   moon = loadImage("moon.png");
   
   myFont = createFont("FFScala",25);
   textFont(myFont);
   
}

void draw(){
 background(R,G,255);
 fill(58,157,19);
 noStroke();
 ellipse(350,earth,2000,500); 
image(sun,sunmove1,sunmove,sunsize,sunsize);
image(mercury,memove1,memove,mesize,mesize);
image(venus,vmove, vmove1,vsize,vsize);
image(earthy,250,25,esize,esize);
image(mars,mmove,mmove1,msize,msize);
image(jupiter,350,150,jsize,jsize);
image(saturn,490,100,ssize,ssize);
image(uranus,550,280,usize,usize);
image(neptune,nmove,nmove1,nsize,nsize);
image(pluto,pmove,pmove1,psize,psize);

//Boarding the spaceship
 if (counter == 0){
   image(r,100,50,100,250);
   image(man,mouseX,mouseY,85,125);
   fill(255);
   text("Click your spaceship to take off!", 25, 350);
 }
 
 //In the spaceship
 if (counter > 0 && counter < 3){
   image(r2,100,50,100,250);   
 }
 
 //Click to take off
 if (counter == 1){
   fill(255);
   text("Click on your spaceship to take off!", 25, 25);
 }

 //Take off
 if (counter == 2){
   image(flame,125,270,50,75);
   if(R > 8 && G > 50){
     R = R - 0.3;
     G = G - 0.3;
   }
   if(earth < 1000 ){
     earth = earth + 2;
   }
   
   
   if(earth > 500 && sunsize < 200){
      sunsize = sunsize + 1;
   }
   
   if(sunsize > 100 && mesize < 50){
     mesize = mesize + 1;
   }
   
   if(mesize > 20 && vsize < 75){
     vsize = vsize + 1;
   }
   
   if(vsize > 20 && esize < 75){
     esize = esize + 1;
   }
   
   if(esize > 20 && msize < 50){
     msize = msize + 1;
   }
   
   if(msize > 20 && jsize < 125){
     jsize = jsize + 1;
   }
   
   if(jsize > 20 && ssize < 200){
     ssize = ssize + 3; 
   }
   
   if(ssize > 20 && usize < 85){
     usize = usize + 1;
   }
   
   if(usize > 20 && nsize < 80){
     nsize = nsize + 1;
     
   if(nsize > 20 && psize < 30){
     psize = psize + 1;
   }
   
   if(sunsize > 1){
     fill(255);
     text("Which planet do you want to explore?", 10, 375);
   }
 }
 
  
 }
 if(counter == 3){
   mesize = 0;
   vsize = 0;
   esize = 0;
   msize = 0;  
   jsize = 0;
   ssize = 0;
   usize = 0;
   nsize = 0;
   psize = 0;
   image(r2,100,50,100,250); 
   image(flame,125,270,50,75);
   image(flame2,80,25,125,300);
   fill(255);
   text("Oops, the sun is too hot you caught on fire!", 200, 25);
   }
   
  if(counter == 4){
   sunsize = 0;
   vsize = 0;
   esize = 0;
   msize = 0;  
   jsize = 0;
   ssize = 0;
   usize = 0;
   nsize = 0;
   psize = 0;
   image(r2,100,50,100,250);
   image(flame2,80,25,125,300);
   fill(255);
   text("Oops, Mercury is too hot you caught on fire!", 100, 25);
  }
  
  if(counter == 5){
   sunsize = 0;
   msize = 0;
   esize = 0; 
   nsize = 0; 
   jsize = 0;
   ssize = 0;
   usize = 0;
   mesize = 0;
   psize = 0;
   vsize = 0;
   fill(137,27,0);
      ellipse(350,ven,2000,500);
   image(r2,youmove,50,100,250);
   fill(255);
   text("You've landed safely on Venus.", 5, 20);
   text("Click on your spaceship to get out and explore.", 5, 40);
  }
  
  if(counter == 6){
   R = 100;
   G = 194;
   background(R,G,255);
   fill(58,157,19);
   ellipse(350,earth,2000,500);
   fill(255);
   text("You're not very adventurous! Back to Earth already.", 50, 25);
   image(r,100,50,100,250);
   image(man,mouseX,mouseY,85,125);
    
  }
  
  if(counter == 7){
   sunsize = 0;
   vsize = 0;
   esize = 0; 
   nsize = 0; 
   jsize = 0;
   ssize = 0;
   usize = 0;
   mesize = 0;
   psize = 0;
   fill(137,27,0);
   ellipse(350,mar,2000,500);
   image(r2,youmove,50,100,250);
   fill(255);
   text("You've landed safely on Mars.", 5, 20);
   text("Click on your spaceship to get out and explore.", 5, 40);
  }
  
  if(counter == 8){
   sunsize = 0;
   msize = 0;
   vsize = 0;
   esize = 0; 
   nsize = 0; 
   jsize = 0;
   ssize = 0;
   usize = 0;
   mesize = 0;
   psize = 0;
   image(r2,youmove,50,100,250);
   image(moon,moomove, 000, 400,400);
   moomove = moomove - 6;   
   fill(255);
   text("You've been taken out by one of Jupiters moons!", 25, 25);
   if(moomove < 150 && youmove > -200){
     youmove = youmove - 10; 
   }
  }
  
  if(counter == 9){
   sunsize = 0;
   vsize = 0;
   esize = 0;
   msize = 0;  
   jsize = 0;
   ssize = 0;
   usize = 0;
   nsize = 0;
   mesize = 0;
   psize = 0;
   image(saturn2, -700, 50, 1500, 1000);
   image(r2,100,50,100,250);
   fill(255);
   text("You've successfully reached Saturn. Isn't it beautiful!",25,25);
   
  }
  
  if(counter == 10){
   sunsize = 0;
   vsize = 0;
   esize = 0;
   msize = 0;  
   jsize = 0;
   ssize = 0;
   mesize = 0;
   psize = 0;
   image(r2,youmove,50,100,250);
   image(asteroid,amove, 100, 200,200);
   amove = amove - 6;   
   fill(255);
   text("You got taken out by an asteroid on the way to Uranus!", 25, 25);
   if(amove < 200 && youmove > -200){
     youmove = youmove - 10; 
   }
  }
  
  if(counter == 11){
    background(0);
    image(r2,100,50,100,250);
    fill(255);
    text("You got sucked into a black hole before you reached Neptune!", 5, 360);
    
  }
  
  if(counter == 12){
   sunsize = 0;
   vsize = 0;
   esize = 0;
   msize = 0;  
   jsize = 0;
   ssize = 0;
   usize = 0;
   nsize = 0;
   mesize = 0;
   image(r2,100,50,100,250);
   fill(255);
   text("Oops, you ran out of gas before you reached Pluto!", 50, 360);
  }
  
  if(counter == 13){
   sunsize = 0;
   vsize = 0;
   esize = 0; 
   nsize = 0; 
   jsize = 0;
   ssize = 0;
   usize = 0;
   mesize = 0;
   psize = 0;
   msize = 0;
   fill(137,27,0);
   ellipse(350,mar,2000,500);
   image(alien,100,50,100,250);
   image(flame,125,270,50,75);
   image(man,mouseX,mouseY,85,125);
   fill(255);
   text("An alien has taken off in your spaceship. Uh oh!", 25, 370);
   if(mar < 900){
   mar = mar + 2;
  }}
  
  if(counter == 14){
   sunsize = 0;
   msize = 0;
   esize = 0; 
   nsize = 0; 
   jsize = 0;
   ssize = 0;
   usize = 0;
   mesize = 0;
   psize = 0;
   vsize = 0;
   fill(137,27,0);
   ellipse(350,ven,2000,500);
   image(alien,100,50,100,250);
   image(flame,125,270,50,75);
   image(man,mouseX,mouseY,85,125);
   fill(255);
   text("An alien has taken off in your spaceship. Uh oh!", 25, 370);
   if(ven < 800){
   ven = ven + 2;
  }}
  
}



void mousePressed(){

  if(counter == 0){
  if(mouseX > 100 && mouseX < 200 && mouseY > 50 && mouseX < 400){
    counter = 1;  
  } }
  
  if(counter == 1){
  if(mouseX > 100 && mouseX < 200 && mouseY > 50 && mouseX < 400){
    counter = 2;
  }}
  
  if(counter == 2){
  //sun
  if(mouseX > 600 && mouseY < 125){
    counter = 3;
    sunsize = 800;
    sunmove = 100;
    sunmove1 = -50;
  }
  
  //mercury
  if(mouseX > 510 && mouseX < 540 && mouseY >50 && mouseY < 100){
    counter = 4;
    mesize = 400;
    memove = 200;
    memove1 = 0;
  }
  
  //venus
  if(mouseX > 385 && mouseX < 460 && mouseY > 25 && mouseY < 100){
    counter = 5;
    vsize = 1000;
    vmove = -200;
    vmove1 = 100;
  }
  
  //earth
  if(mouseX >250 && mouseX < 325 && mouseY > 25 && mouseY < 100){
    counter = 6;
    earth = 400;
  }

  //mars
  if(mouseX > 250 && mouseX < 300 && mouseY > 140 && mouseY < 190){
    counter = 7;
    msize = 0;
    mmove = 0;
    mmove1 = 0;
  }
  
  //jupiter
  if(mouseX > 340 && mouseX < 470 && mouseY > 140 && mouseY < 265){
    counter = 8;
  }

  //saturn
  if(mouseX > 510 && mouseX < 610 && mouseY > 120 && mouseY < 220){
    counter = 9;
  }
  
  //uranus
  if(mouseX > 550 && mouseX < 635 && mouseY > 280 && mouseY < 370){
    counter = 10;
    usize = 0;
    nsize = 0;
  }
  
  //neptune
  if(mouseX > 395 && mouseX < 475 && mouseY > 300 && mouseY < 380){
    counter = 11;
    nsize = 0;
    nmove = 500;
    nmove1 = 100;
    
  }
  
  //pluto
  if(mouseX > 270 && mouseX < 300 && mouseY > 275 && mouseY < 305){
    counter = 12;
    psize = 0;
    pmove = 500;
    pmove1 = 100;
  }  }
  
  if(counter == 7 && mouseX > 100 && mouseX < 200 && mouseY > 50 && mouseX < 400){
   counter = 13; 
   msize = 1000;
   mmove = -200;
   mmove1 = 100;
  }
  
   if(counter == 5 && mouseX > 100 && mouseX < 200 && mouseY > 50 && mouseX < 400){
   counter = 14; 
   vsize = 1000;
   vmove = -200;
   vmove1 = 100;
  }
  
  
}


