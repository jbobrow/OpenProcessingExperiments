
float inc = 0.06;
int density = 4;
float znoise = 0.0;
int [] x = {40,30,30,40, 50};
int[] y = {440, 470,400,450, 467};
float y1 = 205;
float v1 = 40;

void setup(){
  size (800,800);
  smooth();
  colorMode(HSB,360);
  cursor(HAND);
  frameRate(20);
}

void draw (){
  colorMode(HSB,360);
  background (195,200,360);
  sun (width/2, 0);
  clouds ();
  land();
  //riverbed(20);
  river();
  drainpipe();
  bunny (600,400);
  mate (650,400);
  baby1 (625,425);
  baby2 (675, 415);
  baby3 (570, 410);
  baby4 (695, 395);
  squirrel (140,500);
  float flutter = random (-5,5);
  flutterbug ((600+flutter), (600+flutter));
  float fly = random (-8,8);
  bird ((200+fly),(200+fly));
  float swim = random (-5,5);
  fish ((400+swim),(600+swim));
}

void sun (float xpos, float ypos) {
  colorMode(HSB,360);
  strokeWeight(10);
  stroke (50,200,360,200);
  fill(65,200,360);
       ellipse (xpos, ypos, 200,200);
  if (dist(mouseX, mouseY, xpos, ypos) <=100){
    if (mousePressed == true){
      fill(15,200,360);
       ellipse (xpos, ypos, 200,200);
    }
  } 
}

void clouds (){
 colorMode(HSB,360);
 noStroke();
 float xnoise = 0.0;
 float ynoise = 0.0;
 for (int y=0; y<height; y+=density) {
   for (int x=0; x<width; x+=density){
     float n = noise(xnoise, ynoise, znoise) *360;
     fill(0,0,360,n);
     rect (y,x,density,density);
     xnoise +=inc;
   }
   xnoise = 0;
   ynoise +=inc;
 }
 znoise += inc;
 if (mousePressed == true){
  if (mouseY <=height/2) {
 for (int y=0; y<height; y+=density) {
   for (int x=0; x<width; x+=density){
     float n = noise(xnoise, ynoise, znoise) *360;
     fill(130,250,230,n);
     rect (y,x,density,density);
     xnoise +=inc;
   }
   xnoise = 0;
   ynoise +=inc;
 }
 znoise += inc;
 }
 }
}

void land () {
  colorMode(HSB,360);
  noStroke();
  fill (125,220,360);        //base
  rect(0,400,800,800);
  float xnoise = 0.0;
  float ynoise = 0.0;      //shadow
  for (int y=0; y<height; y+=density) {
   for (int x=400; x<width; x+=density){
     float n = noise(xnoise, ynoise, znoise) *360;
     fill(130,250,230,n);
     rect (y,x,density,density);
     xnoise +=inc;
   }
   xnoise = 0;
   ynoise +=inc;
 }
 znoise += inc;
 if (mousePressed == true){
  if (mouseY >=height/2) {
    fill (50,250,250);        //base
  rect(0,400,800,800);
  for (int y=0; y<height; y+=density) {
   for (int x=400; x<width; x+=density){
     float n = noise(xnoise, ynoise, znoise) *360;
     fill(30,250,200,n);
     rect (y,x,density,density);
     xnoise +=inc;
   }
   xnoise = 0;
   ynoise +=inc;
 }
 znoise += inc;
  }
 }
}

void riverbed (int cnt){
  colorMode(HSB,360);
  for (int i=0; i< cnt; i++){
      fill (300);
      ellipse (x[0],y[0], 40,40);
    }
    for (int i=0; i< cnt; i++){
      fill (250);
      ellipse (x[1],y[1], 30,30);
    }
    for (int i=0; i< cnt; i++){
      fill (200);
      ellipse (x[2],y[2],25,25);
    }
    for (int i=0; i< cnt; i++){
      fill (150);
      ellipse (x[3],y[3],15,15);
    }
    for (int i=0; i< cnt; i++){
      fill (350);
      ellipse (x[4],y[4],10,10);
    }
  if (dist(mouseX, mouseY, x[0], y[0]) <=40){
    if (mousePressed == true){
      for (int i=0; i< cnt; i++){
        fill (10,360,360);
        ellipse (x[0],y[0], 8,8);
      }
    }
  }
  if (dist(mouseX, mouseY, x[1], y[1]) <=30){
    if (mousePressed == true){
      for (int i=0; i< cnt; i++){
        fill (10,360,360);
        ellipse (x[0],y[0], 8,8);
      }
    }
  }  
   if (dist(mouseX, mouseY, x[2], y[2]) <=25){
    if (mousePressed == true){
      for (int i=0; i< cnt; i++){
        fill (10,360,360);
        ellipse (x[0],y[0], 8,8);
      }
    }
   }
   if (dist(mouseX, mouseY, x[3], y[3]) <=15){
    if (mousePressed == true){
      for (int i=0; i< cnt; i++){
        fill (10,360,360);
        ellipse (x[0],y[0], 8,8);
      }
    }
   }
   if (dist(mouseX, mouseY, x[3], y[3]) <=10){
    if (mousePressed == true){
      for (int i=0; i< cnt; i++){
        fill (10,360,360);
        ellipse (x[0],y[0], 8,8);
      }
    }
   }
}  

void river (){
  colorMode(HSB,360);
  stroke(230,300,300,200);
    for (int i=50; i<400; i++){
      float r =random(5,10);
      strokeWeight(r);
      float offset = r*50.0;
      line(i, 400, i+offset, 800);
    } 
      for (int i=50; i<400; i++){
        float r =random(5,10);
        strokeWeight(r);
        float offset = r*50.0;
        if (mousePressed == true){
          if (dist(mouseX, mouseY, 100, 700) <=50){
            stroke(35,300,200,300);
            line(i, 400, i+offset, 800);
      }
    }
  }
}

void drainpipe (){
  stroke(35,5,100);            //drain pipe
    strokeWeight(50);
     line(0,700,100,700);
    stroke(50);
    strokeWeight(10);
    fill (35,5,80);
     ellipse (100,700, 50,50);
    noStroke();
    fill (35,300,200);
      ellipse (100,720,5,5);
      ellipse (100,750,50,10);
}

void bunny (int xpos, int ypos){
  colorMode(HSB,100);
  stroke(0);
  strokeWeight(1);
  fill (100);
    ellipse (xpos, ypos, 50,40);                  //Body
    ellipse ((xpos+20),(ypos+10), 10,13);        //Foot, right
    ellipse ((xpos-20),(ypos+10), 10,13);        //Foot, left
    ellipse (xpos,(ypos-15), 30,30);            //Head
    ellipse ((xpos+8),(ypos-40), 10,30);        //Ear, right
    ellipse ((xpos-8),(ypos-40), 10,30);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+8),(ypos-38), 4,25);        //Ear fill, right
    ellipse ((xpos-8),(ypos-38), 4,25);        //Ear fill, left
    ellipse (xpos,(ypos-8), 4,4);              //Nose
  fill (0);
    ellipse ((xpos+8),(ypos-15), 4,4);        //Eye right
    ellipse ((xpos-8),(ypos-15), 4,4);        //Eye left

if (dist(mouseX, mouseY, xpos, ypos) <=25){
          if (mousePressed == true){
   fill (100);
    ellipse (xpos, ypos, 50,40);                  //Body
    ellipse ((xpos+20),(ypos+10), 10,13);        //Foot, right
    ellipse ((xpos-20),(ypos+10), 10,13);        //Foot, left
    ellipse (xpos,(ypos-15), 30,30);            //Head
    ellipse ((xpos+8),(ypos-40), 10,30);        //Ear, right
    ellipse ((xpos-8),(ypos-40), 10,30);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+8),(ypos-38), 4,25);        //Ear fill, right
    ellipse ((xpos-8),(ypos-38), 4,25);        //Ear fill, left
    ellipse (xpos,(ypos-8), 4,4);              //Nose
  fill (0);
    line (xpos+8, ypos-15, xpos+4, ypos-10);          //Eye right
    line (xpos+4, ypos-15, xpos+8, ypos-10);
    line (xpos-8, ypos-15, xpos-4, ypos-10);        //Eye left
    line (xpos-4, ypos-15, xpos-8, ypos-10);
    }
  }   
}

void mate (float xpos, float ypos){
  colorMode(HSB,100);
  fill (15);
    ellipse (xpos, ypos, 50,40);                  //Body
    ellipse ((xpos+20),(ypos+10), 10,13);        //Foot, right
    ellipse ((xpos-20),(ypos+10), 10,13);        //Foot, left
    ellipse (xpos,(ypos-15), 30,30);            //Head
    ellipse ((xpos+8),(ypos-40), 10,30);        //Ear, right
    ellipse ((xpos-8),(ypos-40), 10,30);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+8),(ypos-38), 4,25);        //Ear fill, right
    ellipse ((xpos-8),(ypos-38), 4,25);        //Ear fill, left
    ellipse (xpos,(ypos-8), 4,4);              //Nose
  fill (0);
    ellipse ((xpos+8),(ypos-15), 4,4);        //Eye right
    ellipse ((xpos-8),(ypos-15), 4,4);        //Eye, left

if (dist(mouseX, mouseY, xpos, ypos) <=25){
          if (mousePressed == true){
  fill (15);
    ellipse (xpos, ypos, 50,40);                  //Body
    ellipse ((xpos+20),(ypos+10), 10,13);        //Foot, right
    ellipse ((xpos-20),(ypos+10), 10,13);        //Foot, left
    ellipse (xpos,(ypos-15), 30,30);            //Head
    ellipse ((xpos+8),(ypos-40), 10,30);        //Ear, right
    ellipse ((xpos-8),(ypos-40), 10,30);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+8),(ypos-38), 4,25);        //Ear fill, right
    ellipse ((xpos-8),(ypos-38), 4,25);        //Ear fill, left
    ellipse (xpos,(ypos-8), 4,4);              //Nose
  fill (0);
    line (xpos+8, ypos-15, xpos+4, ypos-10);          //Eye right
    line (xpos+4, ypos-15, xpos+8, ypos-10);
    line (xpos-8, ypos-15, xpos-4, ypos-10);        //Eye left
    line (xpos-4, ypos-15, xpos-8, ypos-10);
    }
  }   
}

void baby1 (float xpos, float ypos){
  colorMode(HSB,100);
  fill (30);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    ellipse ((xpos+4),(ypos-7), 2,2);        //Eye right
    ellipse ((xpos-4),(ypos-7), 2,2);        //Eye, left

if (dist(mouseX, mouseY, xpos, ypos) <=12){
          if (mousePressed == true){
  fill (30);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    line (xpos+4, ypos-8, xpos+2, ypos-5);          //Eye right
    line (xpos+2, ypos-8, xpos+4, ypos-5);
    line (xpos-4, ypos-8, xpos-2, ypos-5);        //Eye left
    line (xpos-2, ypos-8, xpos-4, ypos-5);
    }
  }   
}

void baby2 (float xpos, float ypos){
  colorMode(HSB,100);
  fill (50);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    ellipse ((xpos+4),(ypos-7), 2,2);        //Eye right
    ellipse ((xpos-4),(ypos-7), 2,2);        //Eye, left

if (dist(mouseX, mouseY, xpos, ypos) <=12){
          if (mousePressed == true){
  fill (50);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    line (xpos+4, ypos-8, xpos+2, ypos-5);          //Eye right
    line (xpos+2, ypos-8, xpos+4, ypos-5);
    line (xpos-4, ypos-8, xpos-2, ypos-5);        //Eye left
    line (xpos-2, ypos-8, xpos-4, ypos-5);
    }
  }   
}

void baby3 (float xpos, float ypos){
  colorMode(HSB,100);
  fill (70);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    ellipse ((xpos+4),(ypos-7), 2,2);        //Eye right
    ellipse ((xpos-4),(ypos-7), 2,2);        //Eye, left

if (dist(mouseX, mouseY, xpos, ypos) <=12){
          if (mousePressed == true){
  fill (70);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    line (xpos+4, ypos-8, xpos+2, ypos-5);          //Eye right
    line (xpos+2, ypos-8, xpos+4, ypos-5);
    line (xpos-4, ypos-8, xpos-2, ypos-5);        //Eye left
    line (xpos-2, ypos-8, xpos-4, ypos-5);
    }
  }   
}

void baby4 (float xpos, float ypos){
  colorMode(HSB,100);
  fill (90);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    ellipse ((xpos+4),(ypos-7), 2,2);        //Eye right
    ellipse ((xpos-4),(ypos-7), 2,2);        //Eye, left

if (dist(mouseX, mouseY, xpos, ypos) <=12){
          if (mousePressed == true){
  fill (90);
    ellipse (xpos, ypos, 25,20);               //Body
    ellipse ((xpos+10),(ypos+5), 5,7);        //Foot, right
    ellipse ((xpos-10),(ypos+5), 5,7);        //Foot, left
    ellipse (xpos,(ypos-8), 15,15);            //Head
    ellipse ((xpos+4),(ypos-20), 5,15);        //Ear, right
    ellipse ((xpos-4),(ypos-20), 5,15);        //Ear, left
  fill (95,55,95);
    ellipse ((xpos+4),(ypos-19), 2,13);        //Ear fill, right
    ellipse ((xpos-4),(ypos-19), 2,13);        //Ear fill, left
    ellipse (xpos,(ypos-4), 2,2);              //Nose
  fill (0);
    line (xpos+4, ypos-8, xpos+2, ypos-5);          //Eye right
    line (xpos+2, ypos-8, xpos+4, ypos-5);
    line (xpos-4, ypos-8, xpos-2, ypos-5);        //Eye left
    line (xpos-2, ypos-8, xpos-4, ypos-5);
    }
  }   
}

void squirrel (float xpos, float ypos){
  colorMode(HSB,360);
  noStroke();
  fill (25,200,100);
    ellipse (xpos,ypos,5,5);              //nut
  fill(25, 200, 200);
    ellipse (xpos-20,ypos+15,30,50);          //body
    ellipse (xpos-10,ypos,15,8);            //arm
    ellipse (xpos-15, ypos+30,10,20);        //leg
    ellipse (xpos-15,ypos+40, 15,5);        //foot
    float headmove = (random (9,11));
    ellipse ((xpos-headmove), (ypos-headmove),20,20);        //head
  fill (0);
    ellipse (xpos-headmove,ypos-headmove,3,3);           //eye
  noFill();
  beginShape();
    stroke (25,200,100);
    strokeWeight(10);
    float tailmove = random (0,10);
    vertex ((xpos-100+tailmove), (ypos-50+tailmove));
    bezierVertex (xpos-105,ypos-65,xpos-5,ypos-55,(xpos-35+tailmove), (ypos-55+tailmove));
    bezierVertex (xpos-90, ypos, xpos-30, ypos+45, xpos-35, ypos+25);
    endShape();

if (dist(mouseX, mouseY, xpos-20, ypos+15) <=25){
          if (mousePressed == true){
  noStroke();
  fill (0,300,350);
    ellipse (xpos,ypos,5,5);              //nut
  fill(115, 300, 360);
    ellipse (xpos-20,ypos+15,30,50);          //body
    ellipse (xpos-10,ypos,15,8);            //arm
    ellipse (xpos-15, ypos+30,10,20);        //leg
    ellipse (xpos-15,ypos+40, 15,5);        //foot
    ellipse ((xpos-headmove), (ypos-headmove),20,20);        //head
  fill (10,300,200);
    ellipse (xpos-headmove,ypos-headmove,3,3);           //eye
  noFill();
  beginShape();
    stroke (115,200,100);
    strokeWeight(10);
    vertex ((xpos-100+tailmove), (ypos-50+tailmove));
    bezierVertex (xpos-105,ypos-65,xpos-5,ypos-55,(xpos-35+tailmove), (ypos-55+tailmove));
    bezierVertex (xpos-90, ypos, xpos-30, ypos+45, xpos-35, ypos+25);
    endShape();
    }
  }    
}

void flutterbug (float xpos, float ypos){
  colorMode(HSB,360);
  noStroke();
    fill(0,0,360,random(15,30));
      ellipse (xpos, ypos, 75,75);
    fill(0,0,360,random (200,250));
      ellipse (xpos, ypos, 50,50);
   fill(0,0,300,200);                               //right wing
      beginShape();
      vertex(xpos,ypos);
      bezierVertex(xpos+90.0,xpos+39.0,xpos+54.0,xpos+17.0,xpos+26.0,xpos+83.0);
      bezierVertex(ypos-26.0,ypos-83.0,ypos-90.0,ypos-107.0,ypos-90.0,ypos-39.0);
      endShape();
   fill(0,0,300,200);                              //left wing
      beginShape();
      vertex(xpos,ypos);
      bezierVertex(xpos-90.0,xpos-39.0,xpos-54.0,xpos-17.0,xpos-26.0,xpos-83.0);
      bezierVertex(ypos+26.0,ypos+83.0,ypos+90.0,ypos+07.0,ypos+90.0,ypos+39.0);
      endShape();
   noStroke();
   fill(0,0,360);
      ellipse (xpos, ypos, 40,40);

if (dist(mouseX, mouseY, xpos, ypos) <=25){
          if (mousePressed == true){
   fill(10,360,360,random(50,60));
      ellipse (xpos, ypos, 75,75);
   fill(0,0,0,random (200,250));
      ellipse (xpos, ypos, 50,50);
   fill(50,0,0,200);                               //right wing
      beginShape();
      vertex(xpos,ypos);
      bezierVertex(xpos+90.0,xpos+39.0,xpos+54.0,xpos+17.0,xpos+26.0,xpos+83.0);
      bezierVertex(ypos-26.0,ypos-83.0,ypos-90.0,ypos-107.0,ypos-90.0,ypos-39.0);
      endShape();
   fill(50,0,0,200);                              //left wing
      beginShape();
      vertex(xpos,ypos);
      bezierVertex(xpos-90.0,xpos-39.0,xpos-54.0,xpos-17.0,xpos-26.0,xpos-83.0);
      bezierVertex(ypos+26.0,ypos+83.0,ypos+90.0,ypos+07.0,ypos+90.0,ypos+39.0);
      endShape();
   noStroke();
   fill(0);
      ellipse (xpos, ypos, 40,40);              //body
   strokeWeight(3);
   stroke (0,0,360);
     line (xpos+5, ypos+9, xpos+5, ypos+5);     //teeth
     line (xpos-5, ypos+9, xpos-5, ypos+5);
   noStroke();
   fill(10,360,360);
     ellipse (xpos+8,ypos-5, 5,5);            //eyes
     ellipse (xpos-8,ypos-5, 5,5);
      }  
    }     
  }

void bird (float xpos, float ypos){
  colorMode(HSB,360);
  noStroke();
    fill(0,0,300,200);                               //right wing
      bezier(xpos-80.0,ypos+60.0,xpos-40.0,ypos,xpos-20.0,ypos+10.0,xpos-10.0,ypos+50.0);
      bezier(xpos+80.0,ypos+60.0,xpos+40.0,ypos,xpos+20.0,ypos+10.0,xpos+10.0,ypos+50.0);
    fill(10,250,360);
      ellipse (xpos, ypos, 50,50);            //body
      ellipse (xpos-30, ypos, 50,20);        //right wing
      ellipse (xpos+30, ypos, 50,20);        //left wing
   fill(10,300,360);
      ellipse (xpos, ypos, 40,40);        //head
   fill (0);
      ellipse (xpos-10, ypos-3, 5,5);        //eyes
      ellipse (xpos+10, ypos-3, 5,5);
   strokeWeight(2);
   stroke (60,300,360);
     line (xpos, ypos+8, xpos-3, ypos+5);      //beak
     line (xpos, ypos+8, xpos+3, ypos+5);

if (dist(mouseX, mouseY, xpos, ypos) <=25){
    if (mousePressed == true){
    noStroke();
    fill(200,360,360);
      ellipse(xpos-10,y1,4,4);          //tears
      ellipse(xpos+10,y1,4,4);
  y1+=v1;  
    if (y1>= 420){
      y1=420;
      fill(230,300,300);
        ellipse(xpos-10,y1,4,4);          //tears
        ellipse(xpos+10,y1,4,4);
      }  
    }
  }      
}

void fish(float xpos, float ypos){
  noStroke();
  fill(55, 360,360);
    ellipse (xpos,ypos-100, 10,10);     //nose
    ellipse (xpos,ypos-80, 40,40);    //head
    ellipse (xpos,ypos, 20,50);      //tail
  fill (0);
    ellipse (xpos+10,ypos-100, 5,5);    //eyes
    ellipse (xpos-10,ypos-100, 5,5);
  fill(55, 360,360,200);            //fin
    bezier(xpos-40.0,ypos+50.0,xpos-20.0,ypos,xpos+20.0,ypos,xpos+40.0,ypos+50.0);

if (dist(mouseX, mouseY, xpos, ypos) <=25){
    if (mousePressed == true){
      strokeWeight(10);
      stroke (230,300,300);
      fill(230,300,300);
        ellipse (xpos,ypos, 20,50);      //tail
        bezier(xpos-40.0,ypos+50.0,xpos-20.0,ypos,xpos+20.0,ypos,xpos+40.0,ypos+50.0);
        line (xpos-40.0,ypos+50.0,xpos+40.0,ypos+50.0);
    }
   }
 if (dist(mouseX, mouseY, xpos, ypos-80) <=25){
    if (mousePressed == true){
      strokeWeight(10);
      stroke (230,300,300);
      fill(230,300,300);
        ellipse (xpos,ypos-100, 10,10);     //nose
        ellipse (xpos,ypos-80, 40,40);      //head
        ellipse (xpos+10,ypos-100, 5,5);    //eyes
        ellipse (xpos-10,ypos-100, 5,5);
      }
   }
 }

