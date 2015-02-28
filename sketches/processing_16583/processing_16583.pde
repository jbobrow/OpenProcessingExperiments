
int card = 0; 
int textX = 140;
int textY = 330;
PFont f; 
PImage b1; PImage b2; PImage o1; PImage o2; PImage o3;

void setup(){
  size(640,480);
 f = loadFont("SanKsM-48.vlw");
  textFont(f);
}
void draw(){
  background(255);

 if (card == 0) {
   b1 = loadImage("good.jpg"); 
 image(b1,0,0,640,480);
  fill(0);
 text("Secret Apple",textX, textY);

 }
 if (card == 1) { 
  
b1 = loadImage("good.jpg"); 
 image(b1,-100,0,740,480);
 translate (0,100); 
 ant(250,190,60,80,30);
  fill(59,126,255); 
 text("lol~lollollol....?",60,80);

          
                 } 

  else if (card == 2) {   
  b1 = loadImage("good.jpg"); 
  image(b1,0,0,740,480);
   o1 = loadImage("apple1.png");
   image(o1,400,-200,600,600);
   translate (200,100); 
   ant2(250,190,120,100,30);
 fill(0); 
 text("Aaaaaaaaaaaa!!!!",60,80);

}

else if (card  == 3) {   
 b1 = loadImage("good.jpg"); 
 image(b1,-200,0,900,600);
 o1 = loadImage("apple1.png");
   image(o1,300,-100,600,600);
   translate(100,350);
   rotate(-PI/2);
   ant(250,190,60,80,20);
   text("",60,80);
   text("What is it? ",50,80);
  }
  
  else if (card  == 4){
   b1 = loadImage("good.jpg"); 
 image(b1,-200,-150,1000,900);
 o1 = loadImage("apple1.png");
   image(o1,50,100,700,700);
    fill(0); ellipse(400,250,100,50); ellipse(300,300,150,90);
   ellipse(330,200,80,20); ellipse(540,180,50,10);
   rotate(-PI/15);
   ant(250,190,60,80,50); 
  
  }  
  
    else if (card  == 5) {   
    o2 = loadImage("apple2.png");
   image(o2,-180,-40,1200,1000);                   
      translate(400,-80);
      rotate(PI/3);
   ant(250,190,70,50,30); 
   fill(255,0,0); 
 text("This whole is biggest",90,40);
  } 
  
  
  else if (card  == 6) {  
    o2 = loadImage("apple2.png");
   image(o2,-400,-400,1500,1500);  
    translate(90,370);
      rotate(-PI/3);
       ant(200,110,50,60,40);
        fill(0); 
 text("Oh, god!",40,40);
  }
  
  else if (card  == 7) {   
  b2 = loadImage("bad.jpg");
image(b2,0,0,640,480);  
o3 = loadImage("apple3.png");
image(o3,300,150,300,350);
  }
}
 void mousePressed() {   
  
  if (card == 0) {   
    card = 1; 
  }  
  else if (card == 1) {   
    card = 2; 
  } 
  else if (card == 2) { 
    card = 3; 
  } 
  else if (card == 3) { 
    card = 4; 
  }   
  else if (card == 4) { 
    card = 5; 
  }   
  else if (card == 5) { 
    card = 6; 
  }  
  else if (card == 6) { 
    card = 7; 
  } 
  else if (card == 7) { 
    card = 0; 
  } 
}  
  
  

void ant(int headX, int headY, int headW, int headH, int eyeSize){
  noStroke(); smooth();
  //head
  fill(0);
  ellipse(headX,headY,headW,headH);
  
  //eye
  fill(255);
  ellipse(260,180,eyeSize,eyeSize);
  fill(0);
  ellipse(265,180,eyeSize-20,eyeSize-20);
  
  //else body
  fill(0);
  ellipse(200,210,50,30);
  ellipse(120,210,120,80);
  
  //antenna
  stroke(85,21,170); 
  line(245,150,250,130); line(250,130,290,120);
  line(240,150,245,113); line(245,113,270,95);
  fill(255,21,119); noStroke();
  ellipse(290,120,10,10); ellipse(270,95,20,20);
  
  //legs
  stroke(170,60,214); strokeWeight(5); 
  line(205,218,210,205); line(210,205,250,260);
  line(185,218,170,210); line(170,210,150,260);
  line(190,218,150,180); line(150,180,100,270);
  fill(168,46,229);noStroke(); 
  ellipse(250,260,14,8); ellipse(150,260,12,7); ellipse(100,270,17,10);
}

void ant2(int headX2, int headY2, int headW2, int headH2, int eyeSize2){
 stroke(242,255,108); strokeWeight(10); smooth();
  //head
  fill(191,8,50);
  ellipse(headX2,headY2,headW2,headH2);
  
  //eye
  stroke(242,255,108); strokeWeight(6);
  line(260,180,298,185);
  line(298,185,264,200);
  
  //else body
  fill(0);
  ellipse(200,210,50,30);
  ellipse(120,210,120,80);
  
  //antenna
  stroke(85,21,170); 
  line(245,150,250,130); line(250,130,290,120);
  line(240,150,245,113); line(245,113,270,95);
  fill(255,21,119); noStroke();
  ellipse(290,120,10,10); ellipse(270,95,20,20);
  
  //legs
  stroke(170,60,214); strokeWeight(5); 
  line(205,218,210,205); line(210,205,250,260);
  line(185,218,170,210); line(170,210,150,260);
  line(190,218,150,180); line(150,180,100,270);
  fill(168,46,229);noStroke(); 
  ellipse(250,260,14,8); ellipse(150,260,12,7); ellipse(100,270,17,10);
}



