
//my awesome robot self portrait - ICM HW WK1 6.8.11

float rEyeX;
float rEyeY;
float lEyeX;
float lEyeY;
float initCookieX;
float initCookieY;
float cookieX;
float cookieY;
float cookieMinX;
float cookieMaxX;
float cookieMinY;
float cookieMaxY;
float cookieWidth;
float cookieHeight;
boolean cookieGrabbed;
boolean cookieOverMouth;
boolean cookieAte;
boolean crys;

//int chipOffset;

int timer;

void setup()
{
size (600, 500);

rEyeX = 313;
rEyeY = 147;
lEyeX = 185;
lEyeY = 147;

cookieX = initCookieX = 520;
cookieY = initCookieY = 60;

cookieWidth = 125;
cookieHeight = 75;

cookieMinX = cookieX - cookieWidth/2;
cookieMaxX = cookieX + cookieWidth/2;
cookieMinY = cookieY - cookieHeight/2;
cookieMaxY = cookieY + cookieHeight/2;

timer = 0;

}

void draw()
{
  
background(255, 244, 235); //off white background
//HEAD
fill(106, 179, 255); //fill with blue
rectMode(CENTER);
strokeWeight(4);  // thicker
rect(250, 200, 295, 300); //drawing rectangle

//BODY
rect (250, 400, 100, 100); //neck

//FACE
rectMode(CORNER); 
fill(255);
rect (148, 110, 75, 75); //right socket
rect (275, 110, 75, 75); //left socket
fill (0);

rEyeX = map(cookieX, 0, 600, 291, 335);
rEyeY = lEyeY= map(cookieY, 0, 500, 125, 169);
lEyeX = map(cookieX, 0, 600, 163, 207);

ellipse (rEyeX, rEyeY, 30, 30); //right eyeball
ellipse (lEyeX, lEyeY, 30, 30); //left eyeball


//NOSE
noFill();
strokeWeight (5);
beginShape();
curveVertex (250, 225);
curveVertex (250, 225);
curveVertex (200, 215) ;
curveVertex (200, 240);
curveVertex (245, 255);
curveVertex (245, 255);
endShape();

if (cookieGrabbed == true)
{
  cookieX = mouseX;
  cookieY = mouseY;
}
else
{
  cookieX = initCookieX;
  cookieY = initCookieY;  
}

//MOUTH
if (cookieX > 150 && cookieX < 320 && cookieY > 260 && cookieY < 325)
{
  cookieOverMouth = true;
  fill(0);
  ellipse(245, 300, 170, 60);
} else
{
//smile
beginShape();
fill(106, 179, 255);
curveVertex (150, 260);
curveVertex (150, 260);
curveVertex (175, 295);
curveVertex (313, 295);
curveVertex (320, 265);
curveVertex (320, 265);
endShape();
cookieOverMouth = false;
}


//HAIR
if(crys == false)
{
  noFill();
strokeWeight(10);
  rect(262,98,105,105); //right glasses frame
rect(134, 98, 105, 105); //left glasses frame
line (240, 155, 260, 155); //bridge
line (367, 155, 398, 130); //right temple
line (133, 155, 103, 130); //left temple
  
  fill(255,61,8);
  strokeWeight (3);
  beginShape();
  vertex (259, 25); 
  vertex (253, 22);
  vertex (253, 15);
  vertex (250, 23);
  vertex (200, 23);
  vertex (80, 40);
  vertex (78, 75);
  vertex (85, 145);
  vertex (100, 170);
  vertex (100, 100);
  vertex (110, 70);
  vertex (125, 80);
  vertex (130, 60);
  vertex (170, 110);
  vertex (155, 55);
  vertex (265, 60);
  vertex (275, 75);
  vertex (273, 100);
  vertex (280, 105);
  vertex (330, 100);
  vertex (340, 80);
  vertex (350, 90);
  vertex (360, 110);
  vertex (375, 70);
  vertex (400, 130);
  vertex (415, 70);
  vertex (415, 50);
  vertex (400, 35);
  vertex (300, 30);
  vertex (295, 5);
  vertex (285, 33);
  vertex (259, 25);
  endShape();
}
else
{
  //Michael's glasses
  noFill();
strokeWeight(10);
   rect(262, 120, 105, 50); //right glasses frame
  rect(134, 120, 105, 50); //left glasses frame
  line (240, 155, 260, 155); //bridge
  line (367, 155, 398, 130); //right temple
  line (133, 155, 103, 130); //left temple
  
  //Brown Hair for Michael
    fill(90, 48, 6);
    strokeWeight (3);
    beginShape();
    vertex (259, 25); 
    vertex (253, 22);
    vertex (253, 15);
    vertex (250, 23);
    vertex (200, 23);
    vertex (80, 40);
    vertex (78, 75);
    vertex (85, 145);
    vertex (100, 170);
    vertex (100, 100);
    vertex (110, 70);
    vertex (125, 80);
    vertex (130, 60);
    vertex (170, 110);
    vertex (155, 55);
    vertex (265, 60);
    vertex (275, 75);
    vertex (273, 100);
    vertex (280, 105);
    vertex (330, 100);
    vertex (340, 80);
    vertex (350, 90);
    vertex (360, 110);
    vertex (375, 70);
    vertex (400, 130);
    vertex (415, 70);
    vertex (415, 50);
    vertex (400, 35);
    vertex (300, 30);
    vertex (295, 5);
    vertex (285, 33);
    vertex (259, 25);
    endShape();
    
     
}

//CHIN LINE
noStroke();
fill (255, 244, 235);
triangle (398, 280, 320, 350, 450, 450);
stroke (0);
line (398,280,320,350);
noStroke();
triangle (102,280,180,351,50,400);
stroke (0);
line (102,280, 180,351);

//SHIRT
fill(21,209,176);
beginShape();
vertex (200,440);
vertex (75,450);
vertex (25,500);
vertex (475,500);
vertex (425,450);
vertex (300,440);
vertex (275, 450);
vertex (225, 450);
vertex (200, 440);
endShape();
line (75,450, 75,500);
line (425,450,425,500);

 //COOKIE
 if (cookieAte == false)
 {
  fill (139, 103, 48);
  strokeWeight (3);
  ellipse(cookieX, cookieY, cookieWidth, cookieHeight); //dough
  strokeWeight (2);
  fill (82, 57, 42); // divide the cookie into 4 parts to plot cookie coordinates
  ellipse(cookieX+10, cookieY+10, 15, 10); //choc chip lower right quad of cookie
  ellipse(cookieX-40, cookieY-25, 12, 8); //choc chip upper left quad of cookie
  ellipse(cookieX-30, cookieY, 17, 15); //choc chip middle left
  ellipse(cookieX+25, cookieY-10, 14, 10); //choc chip top right quad
  ellipse(cookieX-30, cookieY+22, 13, 10); //choc chip bottom left quad
  ellipse(cookieX+40, cookieY+10, 15, 13);//choc chip bottom right
  ellipse(cookieX-5, cookieY-20, 20, 17); //choc chip middle top
  ellipse(cookieX-23, cookieY-10, 10, 7);
  ellipse(cookieX+10,cookieY+30,15,10);
 }
 else
 {
   // println("eating the cookie");   
    doTimer();    
 }

}//end draw

void mouseClicked()
{
  if (cookieGrabbed == false && mouseX > cookieMinX && mouseX < cookieMaxX && mouseY > cookieMinY && mouseY < cookieMaxY)
  {
      cookieGrabbed = true;
  }
  if (cookieOverMouth == true)
  {
    //println("cookie over mouth");
    cookieX = initCookieX;
    cookieY = initCookieY;
    cookieAte = true;
  }
  else
  {
    //println("cookie not over mouth"); 
  } 
}

void doTimer()
{
   cookieGrabbed = false;
    cookieX = width/2;
    cookieY = height/2;
    timer++;
    if(timer == 100)
    {
       reset(); 
    }
    
}

void reset()
{
   cookieAte = false;
   crys = !crys;
   timer = 0;
}

