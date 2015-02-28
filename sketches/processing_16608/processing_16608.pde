
PImage man, ghost, run,bus,end,sleep,good,good2,fail;

int card = 0; 
PFont f; 
int x = 60;
int y = 30;
int w = 200;
int h = 100;
int t;   
int tt;  


void setup() {
  size(600, 600);
  f = loadFont("YDICstreL-35.vlw");
  textFont(f);
  smooth();
}

void draw() {
  frameRate(35);
  noStroke();

  background(255);  

  smooth();  




  if (card == 0) {

    background(150);
    f = loadFont("YDICstreL-35.vlw");
    textFont(f);

    tt= 1;  
    t = t+tt;  

    if (10<t);{  

      text(".",270,170);  
  }  

    if (30<t){  

      text("  .",270,170);  

    }  
    
        if (50<t){  

      text("    .",270,170);  

    }  
    
   if (80<t){  
 
      text("      .",270,170);  

    }  

 

    text("Eyeglasses Thought...",width/3.5, height/1.5);

    glasses_(50,50,1,0, 255,255,255);
  }  
  else if (card == 1) {  
    man = loadImage("image1.jpg");  


    image (man, -30, -25,658,658);
    glasses(173,150,0.8,0, 100,200,180);
    fill(250);
    text("that he is most important thing as his owner",10, 10,500,200);

    smooth(); 


    ellipse(250, 190, 40, 30); //left eye  

    ellipse(345, 190, 40, 30); //right eye  

    fill(0);  

    float pupilX = map(mouseX,0,width, 235, 265);  


    float pupilA = map(mouseX, 0, width, 330, 360);  


    float pupilY = map(mouseY,-50, height, 180, 200);  

    ellipse(pupilX, pupilY, 15, 15); //left pupil  

    ellipse(pupilA, pupilY, 15, 15); //right pupil  

    fill(100,200,180);
    text("  cli^ck",width/2.5, height/1.6); 


    if (mousePressed == true) {  

      if (mouseButton == LEFT) {  

        fill(255);  

        strokeWeight(3);  

        stroke(0);  

        ellipse(250, 190, 43, 43); //left eye  

        ellipse(345, 190, 43, 43); //right eye  
       

        float x = 249;  

        float y = 343;  

        float offset = random(-9, 9);  

        fill(0);  

        ellipse(x + offset, 191, 8, 8);  

        ellipse(y + offset, 191, 8, 8);
      }
    }
  } 

  else if (card  == 2) {  
    background(120);
    glasses(10,-30,1,20, 130,200,150);  

    glasses_(250,220,0.8,180, 200,200,230);
    glasses_(30,520,1,315, 100,200,230);

    glasses_(580,620,1.5,225, 200,250,230);  
    glasses_(450,40,1,90, 250,250,200);
    glasses_(270,250,1,135, 180,255,180);  
    glasses(500,310,1,270, 200,200,250); 

    glasses(10,550,1,315, 250,250,150);


    glasses(360,450,0.8,45, 150,250,150);
    glasses(-50,80,6,0, 200,215,230); 
    fill(255);  
    text("red",width/4, height/1.7);  

    fill(255);  

    text("But the Owner didn't care him a lot.",10, 7,500,200);  

    float t = random(-1, 2);
    frameRate(15);
    glasses_(315,365,0.4,45+t, 230,0,0);
  }
  else if (card  == 3) { 
    background(120);

    glasses_(100,-30,1+random(-0.02,0.03),35, 230,0,0);
    glasses_(30,250,1,-12, 130+random(-100, 100),255,255);
    glasses(0,400,1,0, 199,190,190);
    f = loadFont("AmiR-HM-34.vlw");
    textFont(f);
    frameRate(8);
    text("bestow favors on a him..",width/1.9, height/2.3);
    f = loadFont("YDICstreUL-30.vlw");
    textFont(f);
   
    text(" nothing to do",width/1.9, height/1.35);
  f = loadFont("YDIGomL-30.vlw");
   textFont(f);
     text("'bring him to cry mercy!'",width/2.1, height/7.5);
  


    tt= 1;  
    t = t+tt;  

    if (10<t);{  

      text(".",300,500);  
  }  

    if (20<t){  

      text("  .",300,500);  

    }  
    
        if (30<t){  

      text("    .",300,500);  

    }  
 if (40<t){  

      text("      .",300,500);  

    }  
 if (50<t){  

      text("        .",300,500);  

    }  


}
  else if (card  == 4) {  

    background(30);
    ghost = loadImage("image2.png");  
    frameRate(15); 
    image (ghost, 100+random(50), 100+random(100),50,100);
    image (ghost, 150, 150,150,300+random( 10));
    image (ghost, 350+random(50), 230+random(100),30,60);

    glasses(-330,0,5.8,0, 150,25,25);
    fill(60);
    text("Ghost",width/1.25, height/1.15);
  } 

  else if (card  == 5) {  
    background(80);

    

    bus = loadImage("image4.png");  
    image (bus, 430-mouseX/2, 50,350+mouseX/3,350+mouseX/3);
    frameRate(10);
    run = loadImage("image3.png");  
    image (run, 20+random(180), 250,300,270);
glasses_(175,290,-0.25,0, 200+random(-100,55),10,15);
    text("''waaaaaaaaaaaaaaak~!!''",width/6, height/3);
    fill(130);
    text("red",width/1.25, height/1.1);
  } 

  else if (card  == 6) {
    f = loadFont("YDIGomB-38.vlw");
    textFont(f);

    end = loadImage("blood.png");  
    image (end,-100,0,732,625);
    fill(230);
    
    text("shit . ..",width/1.25, height/5);
    text("-END-",width/1.27, height/1.05);
  f = loadFont("YDIBaekM-KSCpc-EUC-H-15.vlw");
    textFont(f);
text("-once more -> find point   -do all over again -> end",10,550,250,100); } 

  else if (card == 7) {  
    background(0);

    fill(100, 255, 255);
    ellipse(x, y, 40, 40);
  }

  else if (card == 8) {  
    background(120);
    good = loadImage("0027.gif"); 
    frameRate(2);
    image (good, 30+random(-10, 60), 125+random(-15, 15),360,300);
    good2 = loadImage("0023.gif");  
    frameRate(2);
    image (good2, 130, 95+random(-10, 15),150,400);
    fill(100);
      f = loadFont("AmiR-HM-34.vlw");
    textFont(f);
    text("black fairy",450,520);
    glasses(-330,0,6,0, 150,225,225);
  }

  else if (card == 9) {  
    background(220);
    sleep = loadImage("sleep.png");  
    image (sleep, 50, 200,300,300);
    fill(120);
      f = loadFont("AmiR-HM-34.vlw");
    textFont(f);
    text("'Deep sleep forever~'",width/1.9, height/4);
    float t = random(-5, 5);
    text("zz",312+t,435+t);
    text("ZZ~",352+t,422+t);
    text("END~",width/1.27, height/1.05);
 f = loadFont("YDIBaekM-KSCpc-EUC-H-15.vlw");
    textFont(f);
text("-once more -> find point   -do all over again -> end",10,550,250,100);
  }  
  else if (card == 10) {  
    background(220);
    fail = loadImage("fail.png");  
    image (fail, 50, 200,300,300);
    fill(70);
      f = loadFont("AmiR-HM-34.vlw");
    textFont(f);
    
    text("''Something is wrong with the glasses..''",100,100);
    fill(50,150,200);
    text("fail~",300,280);
    text("END :P",width/1.27, height/1.05);
     f = loadFont("YDIBaekM-KSCpc-EUC-H-15.vlw");
    textFont(f);
text("-once more -> find point   -do all over again -> end",10,550,250,100);
  }
}

void glasses(int x, int y,float s,float r,float c, int b,int d) {    

  pushMatrix();    

  translate(x,y);    

  scale(s);    

  rotate(radians(r));    

  fill(c,b,d);    
  smooth();    

  beginShape();  


  int a= 40;  

  stroke(c,b,d);   
  smooth();  

  noFill();

  strokeWeight(30);  
  line(a-3, a, 45,a);  
  line(265, a, 273,a);  

  strokeWeight(20);  
  beginShape();  
  vertex(140, a);  
  bezierVertex(140,a, 155, 30, 170, a);  
  endShape();  


  strokeWeight(13);  
  line(30, 45, 35,85);  
  line(280, 45, 275,85);  


  strokeWeight(10);  
  ellipse(95, 50, 90, 80);  
  ellipse(215, 50, 90, 80); 

  noStroke();
  fill(255);
  ellipse(35,35,10,5);
  ellipse(275,35,10,5);


  endShape();  
  popMatrix();
} 
void glasses_(int x, int y,float s,float r, float c, int b,int d) {    


  pushMatrix();    

  translate(x,y);    

  scale(s);    

  rotate(radians(r));    

  fill(c,b,d);    
  smooth();    

  beginShape();  


  int a= 40;  

  stroke(70,20,0);   
  smooth();  


  //glass__
  strokeWeight(25);  
  line(115, 60, 128,53);  
  strokeWeight(22);
  line(221, 17, 223,17);  


  //bridge
  strokeWeight(15);  
  beginShape();  
  vertex(170, a+10);  
  bezierVertex(170,a+10, 180, 45, 200, 33);  
  endShape();  



  //leg
  strokeWeight(16);  
  line(10, 66, 120,63);  
  line(10, 66, -10,80);
  strokeWeight(14);  
  line(110, 19, 228,14);  
  line(110, 19, 95,29); 

  //glass
  strokeWeight(9);  
  ellipse(150, 75, 50, 85);  
  strokeWeight(7);  
  ellipse(210, 48, 30, 75); 

  //dot
  noStroke();
  fill(255);
  ellipse(115,58,7,9);
  ellipse(227,12,5,7);



  endShape();  
  popMatrix();
}








void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y+50) && (mouseY < y+ h+50))
    {
      card = 1;
    } 
    else card = 0;
  }

  else if (card == 1) {  

    if((mouseX > 190) && (mouseX < 410) && (mouseY > 150) && (mouseY < 230)) 

    {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    float d = dist(mouseX, mouseY, 333, 418);
    if (d < 32) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    if((mouseX > x-10) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h+20))
    {
      card = 4;
    }

    else   if((mouseX > x-10) && (mouseX < x + w) && (mouseY > y+185) && (mouseY < y+ 300))
    {
      card = 8;
    }

    else if((mouseX > x-20) && (mouseX < x + w+20) && (mouseY > y+385) && (mouseY < y+460))
    { 
      card = 9;
    }

    else card = 3;
  }  



  else if (card == 4) { 

    float d = dist(mouseX, mouseY, x+160, y+350);
    if (d < 80) {
      card = 5;
    }
    else card = 4;
  }  
  else if (card == 5) { 

    float d = dist(mouseX, mouseY, x+85, y+238);
    if (d < 29) {
      card = 06;
    }
    else card = 5;
  } 
  else if (card == 6) {
    if((mouseX > 463) && (mouseX < x + 525) && (mouseY > 90) && (mouseY < 125))
    { 
      card = 3;
    }

    else if((mouseX > 463) && (mouseX <x+ 525) && (mouseY > 532) && (mouseY < 578))
    { 
      card = 0;
    }


    else card = 6;
  }

  else if (card == 8) {
    if((mouseX > x+100) && (mouseX < x + 180) && (mouseY > y+90) && (mouseY < y+ h+350))
    {
      card = 10;
    }
  
    else card = 8;
  }

  else if (card == 9) {

    if((mouseX > x+27) && (mouseX < x + w+120) && (mouseY > y+330) && (mouseY < y+ h+330))
    {
      card = 3;
    }
   
    else if((mouseX > 463) && (mouseX <x+ 525) && (mouseY > 532) && (mouseY < 578))
    { 
      card = 0;
    }
   
   
    else card = 9;
  }

  else if (card == 10) {

    if((mouseX > x+190) && (mouseX < x + 300) && (mouseY > y+165) && (mouseY < y+ h+160))
    {
      card = 3;
    }

 else if((mouseX > 463) && (mouseX <x+ 525) && (mouseY > 532) && (mouseY < 578))
    { 
      card = 0;
    }

    else card = 10;
  }
}


