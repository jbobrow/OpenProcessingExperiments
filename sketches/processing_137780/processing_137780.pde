
//This is a creative sketch that consist of various components learned in class.  When you move across the screen the colors of the circles and strokes change.  When you click the mouse additional circle pop up to create the head and tail of the spiral figures. When you press and key on the keyboard bubles will appear.  When you specifically press the letter'b' a drumroll will play.  To stop the drum roll press any key.  

float v;
float x = 25;
float y = 25;
float counter = 0;

//Working with Images in Processing

//Declare a PImage variable type
PImage illusion;

//Load an image file from HDD
void setup() {
   size(850,600);
   illusion = loadImage("illusion.jpg");
}
   
//Draw the image to the screen at (0,0)
void draw() {
  image(illusion, 0, 0, 1000, 600);


//Interaction when pressed mouse pressed
//left circle swirl
 if(mousePressed == true){
    ellipse(180, 220, 320, 320);
    ellipse(185, 225, 315, 315);
    ellipse(190, 230, 310, 310);
    ellipse(195, 235, 305, 305);
    ellipse(200, 240, 300, 300);
 }
  stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(200, 240, 300, 300);
  strokeWeight(2);
  fill(#00C4BF);
  
  stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(220, 270, 280, 280);
  strokeWeight(2);
  fill(#00C4BF);
  
  stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(240, 290, 260, 260);
  strokeWeight(2);
  fill(#00C4BF);
  
   stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(260, 310, 240, 240);
  strokeWeight(2);
  fill(#00C4BF);
  
     stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(280, 330, 220, 220);
  strokeWeight(2);
  fill(#00C4BF);
 
      stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(300, 350, 200, 200);
  strokeWeight(2);
  fill(#00C4BF);
  
       stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(320, 370, 180, 180);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(330, 380, 160, 160);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(340, 390, 150, 150);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(350, 400, 140, 140);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(360, 410, 130, 130);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(370, 420, 120, 120);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(380, 430, 110, 110);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(390, 440, 100, 100);
  strokeWeight(2);
  fill(#00C4BF);
  
  
  
  //cirlce swirl on the right
  
   if(mousePressed == true){
    ellipse(660, 220, 320, 320);
    ellipse(655, 225, 315, 315);
    ellipse(650, 230, 310, 310);
    ellipse(645, 235, 305, 305);
    ellipse(640, 240, 300, 300);
 }
 
    stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(640, 240, 300, 300);
  strokeWeight(2);
  fill(#00C4BF);
  
  stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(630, 270, 280, 280);
  strokeWeight(2);
  fill(#00C4BF);
  
  stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(620, 290, 260, 260);
  strokeWeight(2);
  fill(#00C4BF);
  
   stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(610, 310, 240, 240);
  strokeWeight(2);
  fill(#00C4BF);
  
     stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(600, 330, 220, 220);
  strokeWeight(2);
  fill(#00C4BF);
 
      stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(590, 350, 200, 200);
  strokeWeight(2);
  fill(#00C4BF);
  
       stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(580, 370, 180, 180);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(570, 380, 160, 160);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(560, 390, 150, 150);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(550, 400, 140, 140);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(540, 410, 130, 130);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(530, 420, 120, 120);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(520, 430, 110, 110);
  strokeWeight(2);
  fill(#00C4BF);
  
         stroke(mouseX,mouseY,175);
  fill(mouseY,mouseX,175);
  ellipse(510, 440, 100, 100);
  strokeWeight(2);
  fill(#00C4BF);
  
  
  
  
  //Transform the grid
  pushMatrix();
  stroke(100, mouseX,mouseY);
  translate(400,300);
  scale(1.0);
  stroke(175, mouseY, mouseX);
  ellipse(200, 150, 100, 100);
  popMatrix();
  fill(mouseX,mouseY,175);
  
  if(mousePressed == true){
    ellipse(400, 450, 90, 90);
     ellipse(410, 460, 80, 80);
      ellipse(415, 465, 70, 70);
       ellipse(420, 470, 60, 60);
        ellipse(425, 475, 50, 50);
         ellipse(430, 480, 40, 40);
          ellipse(435, 485, 30, 30);
           ellipse(440, 490, 20, 20);
            ellipse(450, 495, 10, 10);
             ellipse(455, 500, 8, 8);
             ellipse(457, 502, 6, 6);
             ellipse(459, 504, 4, 4);
             ellipse(461, 507, 2, 2);
         
    ellipse(500, 450, 90, 90);
     ellipse(495, 460, 80, 80);
      ellipse(490, 465, 70, 70);
       ellipse(485, 470, 60, 60);
        ellipse(480, 475, 50, 50);
         ellipse(475, 480, 40, 40);
          ellipse(470, 485, 30, 30);
           ellipse(465, 490, 20, 20);
            ellipse(460, 495, 10, 10);
             ellipse(455, 500, 8, 8);
             ellipse(453, 502, 6, 6);
             ellipse(451, 504, 4, 4);
             ellipse(449, 507, 2, 2);
  }
  //see thru bubbles
  for (int y = 200; y < height+20; y += 400)
  fill(255, 75);
  ellipse(700, random(0), 40, 40);
  
  for (int x = 100 ; x < width+450; x += 400) 
  fill(200, 75);
  ellipse(410, y, 200, 200);
  
  for (int x = 100 ; x < width+450; x += 400) 
  fill(200, 75);
  ellipse(50, 500, 200, 200);
  
    
  for (int x = 100 ; x < width+450; x += 400) 
  fill(200, 75);
  ellipse(800, 500, 200, 200);
  
  //Press any key and bubbles appear
   if(keyPressed == true)
  for (int y = 450; y <= height; y += 75) 
  for (int x = 800 ; x <= width; x += 500      ) 
    ellipse(random(x), random(y), 75.0, 75.0);


// rolling of the drums when the 'b' key is pressed and click any key to stop drums    
//Import 'Minim' library files
import ddf.minim.*;

//Decalre global variables
Minim minim;
AudioSample drum2;

//Load audio fille from HDD
  minim = new Minim(this);
  drum2 = minim.loadSample("drum2.wav");
  
//Create a key trigger
  if (key== 'b') drum2.trigger();
  
}
    
   

