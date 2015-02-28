
void setup(){
  setupAudio();
  size(500,500);
}
 
void draw(){
  background(8,250,244); 
 
 smooth ();
 
//background
noFill ();
stroke (175,247,75);
strokeWeight (5);
ellipse (width/2, height/2, 500,500);
ellipse (width/2, height/2, 515,515);
ellipse (width/2, height/2, 530,530);
ellipse (width/2, height/2, 545,545);
ellipse (width/2, height/2, 560,560);
ellipse (width/2, height/2, 575,575);
ellipse (width/2, height/2, 590,590);
stroke (245,250,8);
ellipse (width/2, height/2, 605,605);
ellipse (width/2, height/2, 620,620);
ellipse (width/2, height/2, 635,635);
ellipse (width/2, height/2, 650,650);
ellipse (width/2, height/2, 665,665);
ellipse (width/2, height/2, 680,680);
ellipse (width/2, height/2, 695,695);
 
//clock face
fill (255,200,255);
stroke (0);
strokeWeight (12);
ellipse (250,250, 480,480);
noStroke ();
fill (178,0,255, 150);
ellipse (width/2, height/2, 450,450);
fill (212,0,255,150);
ellipse (width/2, height/2, 430,430);
fill (250,0,255,150);
ellipse (width/2, height/2, 410,410);
fill (255,0,179,150);
ellipse (width/2, height/2, 390,390);
fill (255,200,255,150);
ellipse (width/2, height/2, 370,370);

//nose
stroke (0);
strokeWeight (3);
noFill ();
arc (250,280, 100,40, 0,PI);
arc (200,290, 60,80, PI,TWO_PI-PI/1.5);
arc (300,290, 60,80, TWO_PI-PI/3,TWO_PI);

//numbers
noFill ();
strokeWeight (6);
stroke (18,1,106);
  //12
  line (230,30, 230,90);
  line (250,90, 290,90);
  //line (250,90, 250,60);
  //line (250,60, 290,60);
  //line (290,60, 290,30);
  //line (250,30, 290,30);
  beginShape ();
  curveVertex (250,30);
  curveVertex (250,30);
  curveVertex (280,30);
  curveVertex (280,50);
  curveVertex (250,90);
  curveVertex (250,90);
  endShape ();
  //3
  //line (470,220, 470,280);
  //line (430,220, 470,220);
  //line (430,250, 470,250);
  //line (430,280, 470,280);
  beginShape ();
  curveVertex (430,220);
  curveVertex (430,220);
  curveVertex (450,219);
  curveVertex (470,220);
  curveVertex (470,237);
  curveVertex (450,250);
  curveVertex (470,263);
  curveVertex (470,280);
  curveVertex (430,280);
  curveVertex (430,280);
  endShape ();
  //6
  //line (240,410, 240,470);
  //line (240,470, 280,470);
  //line (280,470, 280,440);
  //line (240,440, 280,440);
  beginShape ();
  curveVertex (240,410);
  curveVertex (245,410);
  curveVertex (240,465);
  curveVertex (280,470);
  curveVertex (280,440);
  curveVertex (240,445);
  curveVertex (240,440);
  endShape ();
  //9
  //line (70,220, 70,280);
  //line (30,220, 70,220);
  //line (30,220, 30,250);
  //line (30,250, 70,250);
  beginShape ();
  curveVertex (70,280);
  curveVertex (70,280);
  curveVertex (70,220);
  curveVertex (35,220);
  curveVertex (35,245);
  curveVertex (70,250);
  curveVertex (70,250);
  endShape ();
  //4
  line (440,310, 440,370);
  line (400,310, 400,340);
  line (400,340, 440,340);
  //5
  line (370,380, 330,380);
  line (330,380, 330,410);
  //line (330,410, 370,410);
  //line (370,410, 370,440);
  //line (370,440, 330,440);
  beginShape ();
  curveVertex (330,410);
  curveVertex (330,410);
  curveVertex (370,410);
  curveVertex (370,437);
  curveVertex (330,440);
  curveVertex (330,440);
  endShape ();
  //7
  line (180,460, 180,400);
  line (180,400, 150,400);
  //8
  //line (120,380, 120,320);
  //line (120,320, 80,320);
  //line (80,320, 80,380);
  //line (80,350, 120,350);
  //line (80,380, 120,380);
  ellipse (95,325, 40,30);
  ellipse (95,360, 50,40);
  

//arrows
stroke (0,0,0,200);
strokeWeight (12);
line (width/2, height/2, 400, 396);
line (width/2, height/2, 150, 200);
stroke (0);

  // Draw the mouth.
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0,100, 2,110);  // now we can use it for something!
  if(Y > 150){
    Y = 150;
  }
  
  fill(224,9,63,150);
  strokeWeight (2);
  ellipse(250,380, 150,Y); 
 
  // The rest of the code just draws the Eye:
  float ex = 150;
  float ey = 150;
  fill(255);
  ellipse(ex,ey, 100,70);
  fill(0);
  float dx = constrain((mouseX-ex)/20, -14,14);
  float dy = constrain((mouseY-ey)/20, -14,14);
  ellipse(ex+dx,ey+dy, 30,30);
  
  float fx = 350;
  float fy = 150;
  fill(255);
  ellipse(fx,fy, 100,70);
  fill(0);
  float gx = constrain((mouseX-fx)/20, -14,14);
  float gy = constrain((mouseY-fy)/20, -14,14);
  ellipse(fx+gx,fy+gy, 30,30);
  
  
  //eyelids
  strokeWeight (4);
  fill (#10AF89);
  arc (150,150, 105,75, PI,TWO_PI);
  arc (350,150, 105,75, PI,TWO_PI);
  line (100,150, 200,150);
  line (300,150, 400,150);
  
  noFill ();
  strokeWeight (6);
  stroke (18,1,106);

  //10
  line (70,120, 70,180);
  ellipse (110,150, 40,60);
  //11
  line (140,110, 140,50);
  line (170,110, 170,50);
  
  //1
  line (350,60, 350,120);
  //2
  //line (400,130, 440,130);
  //line (440,130, 440,160);
  //line (400,160, 440,160);
  //line (400,160, 400,190);
  line (400,190, 440,190);
  beginShape ();
  curveVertex (400,130);
  curveVertex (400,130);
  curveVertex (430,130);
  curveVertex (430,150);
  curveVertex (400,190);
  curveVertex (400,190);
  endShape ();

}


