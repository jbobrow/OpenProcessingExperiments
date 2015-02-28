
Fish myFish1;
Fish myFish2; 
Fish myFish3;
Fish myFish4;


void setup (){
  
  size (400,400);
  smooth ();
  
  myFish1 = new Fish(color(255, 217,100),0,100,2);
  myFish2 = new Fish(color(255,175,113),0,150,1);
  myFish3 = new Fish(color(232,125,91),0,250,3);
  myFish4 = new Fish(color(255,127,121),0,200,.5);

}

void draw() {
  
  background(130,226,255);
  myFish1.swim();
  myFish1.display();
  myFish2.swim();
  myFish2.display();
  myFish3.swim();
  myFish3.display();
  myFish4.swim();
  myFish4.display();
  
  fill (255, 170,104);
  stroke (255,170,104);
  beginShape();
  
  vertex (51,400);
  vertex (50, 375);
  vertex (28,380);
  vertex (26,360);
  vertex (50,360);
  vertex (53,335);
  vertex (24,315);
  vertex (42,333);
  vertex (24,349);
  vertex (6,319);
  vertex (13,300);
  vertex (42,314);
  vertex (66,274);
 vertex (60,260);
  vertex (45,273);
  vertex (36,260);
  vertex (51,230);
  vertex (86,264);
  vertex (58,322);
 vertex (78,323);
  vertex (78,320);
  vertex (157,301);
  vertex (156, 315);
  vertex (115,315);
  vertex (73,345);
  vertex (72,360);
  vertex (168,358);
  vertex (170,370);
  vertex (74,375);
  vertex (74,400);
  vertex (51,400);
  
  endShape();
  
  fill(232,99,81);
  stroke(232,99,81);
  beginShape();
  
  vertex (150,400);
  vertex (147,366);
  vertex (26,380);
  vertex (26,380);
  vertex (160,360);
  vertex (100,280);
  vertex (122,270);
  vertex (175,360);
  vertex (150,220);
  vertex (213,216);
  vertex (216,245);
  vertex (174,234);
  vertex (190,275);
  vertex (245,290);
  vertex (190,300);
  vertex (196,355);
  vertex (282,345);
  vertex (280,310);
  vertex (296,302);
  vertex (301,350);
  vertex (210,377);
  vertex (181,400);
  vertex (150,400);
  
  endShape();
  
  fill(100,255,130);
  stroke(100,255,130);
  
  beginShape();
  
  vertex (327,400);
  vertex (314,360);
  vertex (262,328);
  vertex (260,288);
  vertex (277,274);
  vertex (280,320);
  vertex (310,270);
  vertex (370,320);
  vertex (250,234);
  vertex (380,216);
  vertex (396,368);
  vertex (340,330);
  vertex (345,364);
  vertex (370,370);
  vertex (374,390);
  vertex (342,385);
  vertex (345,400);
  vertex (327,400);
  
  endShape();
  
 
  fill (99, 255, 166);
  
  smooth ();
  
  beginShape();
  
  vertex( 15, 250);
  vertex(16, 295);
  vertex(52, 337);
  vertex(50, 400);
  vertex(67, 400);
  vertex(63, 335);
  vertex(85, 337);
  vertex(83, 325); 
  vertex(115, 355);
  vertex(128, 335);
  vertex(84, 307);
  vertex(88, 248);
  vertex(71, 246);
  vertex(73, 294);
  vertex(58, 321);
  vertex(30, 295);
  vertex(33, 250);
  vertex(15, 250);
 endShape();
 
 beginShape();
   
   vertex(101, 380);
   vertex(106, 338);
   vertex(126, 390);
   vertex(123, 400);
   vertex(170, 400);
   vertex(168, 390);
   vertex(193, 387);
   vertex(183, 378);
   vertex(171, 374);
   vertex(160, 390);
   vertex (101, 380);
   
 endShape();

 fill (114,232,90);
 stroke (114,232,90);
 beginShape();
 
   vertex(172, 319);
   vertex(195, 384);
   vertex(227, 354);
   vertex(231, 400);
   vertex(250, 400);
   vertex(250, 380);
   vertex(254, 380);
   vertex(311, 390);
   vertex(332, 332);
   vertex(274, 274);
   vertex(260, 310);
   vertex(296, 332);
   vertex(302, 364);
   vertex(257, 366);
   vertex(267, 337);
   vertex(203, 332);
   vertex(177, 310);
   vertex(172, 323);
   vertex(202, 354);
   vertex(172, 319);
   
 endShape();
 
 fill(255,192,144);
 stroke(255,192,144);
 beginShape();
   
   vertex(330, 385);
   vertex(365, 386);
   vertex(375, 400);
   vertex(380, 400);
   vertex(390, 380);
   vertex(375, 350);
   vertex(367, 305);
   vertex(361, 326);
   vertex(376, 345);
   vertex(370, 370);
   vertex(330, 385);
   
 endShape();
 
}

class Fish { 
  color d;
  float xpos;
  float ypos;
  float xspeed;

  Fish(color tempD, float tempXpos, float tempYpos, float tempXspeed) { 
    d = tempD;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(d/2);
    fill(d);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,55,25);
    ellipse (xpos-30,ypos,20,15);
    fill(0);
    ellipse(xpos+10,ypos-5,5,5);
    stroke(d*2);
    strokeWeight(0);
    line (xpos-3, ypos-3, xpos-3, ypos+7);
    
    line (xpos+1,ypos+1,xpos+1,ypos+5);
    line (xpos-7,ypos-7,xpos-7,ypos+10);
    line (xpos-10,ypos,xpos-10,ypos+5);
    
    
    
    
  }

  void swim() {
    xpos = xpos + xspeed;
    if (xpos > height) {
      xpos = 1;
      

  
 /* background (130,226,255);*/
  
  

    }
  }
}
  


