
float Xend = 0;
float Yend = 575;
float seg2Yend;
float x = 0;
float point2 = 0;


int a = 0;
int b = 255;
int c = 0;
int d = 50;


import ddf.minim.*;
Minim minim;
AudioPlayer song;


void setup() {
  size(1000,1150);
  smooth();
  frameRate(1000);
  
   
}

void draw() {
  background(0);
  stroke(255);
  
if (Xend==99 || Xend==199 || Xend==349 || Xend==402) {
    // setup player
  minim = new Minim(this);
  song = minim.loadFile("quiet.mp3", 1024);
  song.play();
  }

if (Xend == 550 || Xend==575 || Xend==575 || Xend==580 || Xend==600 || Xend==610 || Xend==635 || Xend==645 || Xend==670 || Xend==680) {
  minim = new Minim(this);
  song = minim.loadFile("loud.mp3", 1024);
  song.play();
}

//sound for home
if (mouseX <= 500 ) {
  if (mousePressed==true){
  minim = new Minim(this);
  song = minim.loadFile("traffic4.mp3", 1024);
  song.play();
  }
}
  
else if (mouseX > 500) {
  if(mousePressed==true){
    minim = new Minim(this);
  song = minim.loadFile("war.mp3", 1024);
  song.play(); 
  }
}



   strokeWeight(2.5);
   
  Xend = Xend + 1;
 
  if (Xend < 100){
     
     stroke (a,b,c,d);
     line(0,575,Xend,Yend);
  }
  
  // drawing seg 2 down (100,575,200,674)
  else if (Xend > 100 && Xend < 200) {
   stroke(a,b,c,d);
    line(0,575,100,575);
   Yend++;
   line(100,575,Xend,Yend);  
   
   
  } 
  
  // drawing seg 3 up (200,674,x,y)
  else if(Xend > 200 && Xend < 350) {
   // println(Yend);
    Yend--;
    stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,Xend,Yend);
  }
  
  // drawubg seg 4 down 
  else if (Xend > 350 && Xend < 402) {
    //println(Yend);
    Yend++;
    stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // draw seg 4
    line (350,526,Xend,Yend);
  }
  
  else if (Xend > 402 && Xend < 500) {
   stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    //draw seg 5 straight
    line (402,575,Xend,Yend);
  }
  
  else if (Xend > 500 && Xend < 550) {
     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    stroke(a,b,c);
    // draw seg 1
   line(500,575,Xend,Yend);
 
}
  
  else if (Xend > 550 && Xend < 575) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend-=6;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // draw seg 2
   line(550,575,Xend,Yend);
   //println(Yend);
  }
 
  else if (Xend > 575 && Xend < 580) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend+=7;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // draw seg 3
   line(575,432,Xend,Yend);
  // println(Yend);
  }
  
  else if (Xend > 580 && Xend < 600) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend-=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // draw seg 4
   line(580,460,Xend,Yend);
  //println(Yend);
  }
  
   else if (Xend > 600 && Xend < 610) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend+=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   //draw seg 5
   line(600,308,Xend,Yend);
   //println(Yend);
  }
  
   else if (Xend > 610 && Xend < 635) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend-=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   // seg 5
   line(600,308,610,380);
  //draw seg 6
   line(610,380,Xend,Yend);
   //println(Yend);
  }
  
  else if (Xend > 635 && Xend < 645) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend+=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   // seg 5
   line(600,308,610,380);
   // seg 6
   line(610,380,635,188);
   // draw seg 7
   line(635,188,Xend,Yend);
   //println(Yend);
  }
  
    else if (Xend > 645 && Xend < 670) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend-=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   // seg 5
   line(600,308,610,380);
   // seg 6
   line(610,380,635,188);
   // seg 7
   line(635,188,645,260);
   // draw seg 8
   line(645,260,Xend,Yend);
   //println(Yend);
  }
  
  else if (Xend > 670 && Xend < 680) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend+=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   // seg 5
   line(600,308,610,380);
   // seg 6
   line(610,380,635,188);
   // seg 7
   line(635,188,645,260);
   // seg 8
   line(645,260,670,68);
   // draw seg 9
   line(670,68,Xend,Yend);
   //println(Yend);
  }
  
  else if (Xend > 680 && Xend < 700) {
    

     stroke(a,b,c,d);
    // seg 1
    line(0,575,100,575);
    // seg 2
    line(100,575,200,674);
    // seg 3
    line(200,674,350,526); 
    // seg 4
    line (350,526,402,575);
    // seg 5 
    line (402,575,500,575);
    
    //saturated line set
    Yend-=8;
    stroke(a,b,c);
    // seg 1
   line(500,575,550,575);
   // seg 2
   line(550,575,575,432);
   // seg 3
   line(575,432,580,460);
   // seg 4
   line(580,460,600,308);
   // seg 5
   line(600,308,610,380);
   // seg 6
   line(610,380,635,188);
   // seg 7
   line(635,188,645,260);
   // seg 8
   line(645,260,670,68);
   // seg 9
   line(670,68,680,140);
   // draw seg 10
   line(680,140,Xend,Yend);
   println(Yend);
  }
  
  else if (Yend < 0) {
   Xend = 0;
   Yend = 575;
   }
    
   if(Xend < 500){
    strokeWeight(5);
    stroke(255,255,255,100);
    color(255);
    point(Xend,Yend);
   }
   if(Xend > 500){
     strokeWeight(5);
     stroke(255);
     color(255);
     point(Xend,Yend);
   }
    
}


