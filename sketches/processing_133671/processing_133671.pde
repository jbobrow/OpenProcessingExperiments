

PImage img;
PImage img2;


void setup (){
  
///Document Size
size(900,300);

img = loadImage("sunset.jpg");
 background(img); ////loads background Image


///////Domes
  fill(149,92,2);
  rect(450, 0, 10, 50);//stick
  rect(335, 130, 5, 50);//stick
  rect(570, 130, 5, 50);//stick
  rect(335, 130, 5, 50);//stick
  
    
  ellipse(455,75,200,135);//Center Dome
  
 
  ellipse(335,180,90,70);//medium Tower Dome left
  ellipse(570,180,90,70);//medium Tower Dome right
  
  
  ellipse(210,140,125,85);//Left Dome
  ellipse(687,140,125,85);//Right Dome
   
////////Pillars   
  noFill();
  fill(186,150,93);
 
 rect(415, 100, 75, 200);//center 
   noFill();
   
//////////Dome   
   fill(149,92,2);///gold
     ellipse(267,190,40,30);//2ndSmallest Towar Dome left
     ellipse(635,190,40,30);//2ndSmallest Towar Dome right
   noFill();
///////////
   fill(150,117,65);
   rect(285, 225, 25, 25);//Filler 1Left
   rect(595, 225, 25, 25);//Filler 1Right
   rect(225, 240, 100, 50);//Filler 2Left
   rect(555, 240, 100, 50);//Filler 1Right
///////////   
   rect(255, 200, 22, 50);//2ndSmallestTower 1Left
   rect(625, 200, 20, 50);//2ndSmallesTower 1right
   noFill();
////////////   
fill(185,159,117);
   rect(250, 250, 400, 100);//Bottom block Horizontal Long
    noFill();
//////////////
   fill(150,117,65);
    rect(400, 210, 100, 20);//center Door Way behind
   noFill();
 ////////
   fill(190,169,136);
 rect(400, 195, 20, 150);//Smalestl Side pillars Left
 rect(485, 195, 20, 150);//Smallest Side pillars Rightc
   noFill();
   
   fill(149,92,2);///gold
   rect(407, 170, 5, 10);
   rect(493, 170, 5, 10);
    ellipse(409,190,30,20);//Smallest pillar Dome left
  ellipse(495,190,30,20);//Smallest pillar Dome right
  noFill();
  
    fill(192,166,125);
 rect(360, 230, 200, 110);//center Main Block
    noFill();
           
    fill(211,181,133);
 rect(310, 200, 50, 150);//Side pillars Left
 rect(545, 200, 50, 150);//Side pillars Right
    noFill();
  
   fill(186,150,93);
 
 rect(175, 170, 75, 150);//Big Left
 rect(650, 170, 75, 150);//Big Right
   noFill();
   
   fill(165,132,81);
 rect(170, 270, 85, 80);//Big Left Base
 rect(645, 270, 85, 80);//Big Right Base
   noFill();
 
   fill(190,169,136);

 rect(427, 180, 50, 50);//center Door Way 
 noFill();
 fill(171,136,80);
 rect(375, 205, 25, 25);//Fillerleft
 rect(360, 210, 25, 20);//Filler
 rect(505, 205, 25, 25);//Fillerright
  rect(520, 210, 25, 20);//Filler
  noFill();
  
  
  
  fill(0);//Black
rect(445, 200, 15, 30);//Door
rect(407, 205, 5, 15);//Doorleft
rect(493, 205, 5, 15);//Doorright
rect(185, 200, 15, 30);//Door
rect(700, 200, 15, 30);//Door
line(475, 230, 495, 300);///cross1
line(427, 230, 410, 300);///cross2
  line(475, 240, 428, 240);//stair
  line(425, 250, 480, 250);//stair
  line(420, 260, 483, 260);//stair
  line(416, 270, 487, 270);//stair
  line(413, 280, 490, 280);//stair
  line(410, 290, 494, 290);//stair
 

  noFill();
  
 ////////////Red
 fill(137,0,0);
  rect(415, 100, 75, 20);//center RED
  rect(310, 200, 50, 20);//Side pillars Left RED
  rect(545, 200, 50, 20);//Side pillars Right RED
  rect(175, 170, 75, 20);//Big Left RED
  rect(650, 170, 75, 20);//Big Right RED
  rect(427, 180, 50, 10);//center Door RED
  rect(400, 195, 20, 5);//Smalestl Side pillars Left
  rect(485, 195, 20, 5);//Smallest Side pillars Rightc
  rect(255, 200, 22, 7);//2ndSmallest Tower 1Left
  rect(625, 200, 20, 7);//2ndSmallest Tower 1right
  img2 = loadImage("aladin.png");
  
}

void draw() 
{
  if (mouseX < 170) {
    cursor(HAND);
  } else {
    cursor(img2, 0, 0);
    
  }
}


