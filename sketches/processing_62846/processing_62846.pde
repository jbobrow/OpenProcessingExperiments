
//The horse template is built here along with things it can do.

//The class name
class Horse {
//Data  
  color c;//color of horse
  float xPos; //location of horse
  float yPos; 
  float xspeed = random (0,10);//The horizontal speed
  float yspeed = random (0, 10);//The vertical speed which gives the horse it's gallop
  
//The Constructor
//Parameters for location, speed, and color
  Horse (float tempXPos, float tempYPos, float tempSpeed, float tempYSpeed, color tempColor) {
    c = tempColor;
    xPos = tempXPos;
    yPos = tempYPos;
    xspeed = tempSpeed;
    yspeed = tempYSpeed;  
  }

//Functionality or Methods
//Draw the horse
  void display () {
    fill (c);
    noStroke ();
    
//Horse, left half
beginShape();
vertex(xPos, yPos);
vertex(xPos+20, yPos-20);
vertex(xPos+40, yPos-40);
vertex(xPos+80,yPos-90);
vertex(xPos+85,yPos-100);
vertex(xPos+80,yPos-120);
vertex(xPos+105,yPos-100);
vertex(xPos+145,yPos-75);
vertex(xPos+200,yPos-45);
vertex(xPos+260,yPos-30);
vertex(xPos+280,yPos-20);
vertex(xPos+280,yPos+138);
vertex(xPos+280,yPos+140);
vertex(xPos+250,yPos+200);
vertex(xPos+240,yPos+215);
vertex(xPos+238,yPos+220);
vertex(xPos+230,yPos +250);
vertex(xPos+238,yPos+265);
vertex(xPos+240,yPos+280);
vertex(xPos+225,yPos+290);
vertex(xPos+220,yPos+300);
vertex(xPos+200,yPos+320);
vertex(xPos+160,yPos+320);
vertex(xPos+170,yPos+298);
vertex(xPos+205,yPos+260);
vertex(xPos+207,yPos+220);
vertex(xPos+210,yPos+180);
vertex(xPos+210,yPos+160);
vertex(xPos+205,yPos+130);
vertex(xPos+185,yPos+105);
vertex(xPos+190,yPos+80);
vertex(xPos+180,yPos+60);
vertex(xPos+160,yPos+10);
vertex(xPos+145,yPos-35);
vertex(xPos+100,yPos);
vertex(xPos+30,yPos+40);
vertex(xPos+20,yPos+37);
vertex(xPos+5, yPos+30);
endShape(CLOSE);

//Horse, right half
beginShape();
vertex(xPos+280,yPos-20);
vertex(xPos+340,yPos-10);
vertex(xPos+380,yPos-15);
vertex(xPos+420,yPos-20);
vertex(xPos+490,yPos-33);
vertex(xPos+530,yPos-20);
vertex(xPos+575,yPos+15);
vertex(xPos+580,yPos+40);
vertex(xPos+570,yPos+60);
vertex(xPos+560,yPos+80);
vertex(xPos+540,yPos+100);
vertex(xPos+520,yPos+120);
vertex(xPos+500,yPos+140);
vertex(xPos+495,yPos+160);
vertex(xPos+500,yPos+175);
vertex(xPos+508,yPos+200);
vertex(xPos+490,yPos+220);
vertex(xPos+485,yPos+240);
vertex(xPos+490,yPos+250);
vertex(xPos+487,yPos+285);
vertex(xPos+470,yPos+295);
vertex(xPos+472,yPos+305);
vertex(xPos+460,yPos+320);

//Bottom of leg up
vertex(xPos+410,yPos+320);
vertex(xPos+440,yPos+280);
vertex(xPos+445,yPos+260);
vertex(xPos+450,yPos+240);
vertex(xPos+450,yPos+220);
vertex(xPos+450,yPos+200);
vertex(xPos+440,yPos+180);
vertex(xPos+438,yPos+160);
vertex(xPos+430,yPos+140);
vertex(xPos+418,yPos+100);

//Top of leg up
vertex(xPos+400,yPos+107);
vertex(xPos+380,yPos+112);
vertex(xPos+360,yPos+118);
vertex(xPos+340,yPos+120);
vertex(xPos+280,yPos+138);
endShape(CLOSE);

//Backleg
beginShape();
vertex (xPos+390, yPos+305);
vertex (xPos+400, yPos+300);
vertex(xPos+420,yPos+280);
vertex(xPos+430,yPos+260);
vertex(xPos+430,yPos+240);
vertex(xPos+438,yPos+220);
vertex(xPos+430,yPos+200);
vertex(xPos+425,yPos+180);
vertex(xPos+423,yPos+160);
vertex(xPos+420,yPos+140);
vertex(xPos+405,yPos+105);
vertex(xPos+418,yPos+100);
vertex(xPos+430,yPos+140);
vertex(xPos+438,yPos+160);
vertex(xPos+440,yPos+180);
vertex(xPos+450,yPos+200);
vertex(xPos+450,yPos+220);
vertex(xPos+450,yPos+240);
vertex(xPos+445,yPos+260);
vertex(xPos+440,yPos+280);
vertex(xPos+410,yPos+320);
endShape(CLOSE);

//Front leg
beginShape();
vertex(xPos+170,yPos+298);
vertex(xPos+150,yPos+220);
vertex(xPos+185,yPos+105);
vertex(xPos+205,yPos+130);
vertex(xPos+200,yPos+160);
vertex(xPos+180,yPos+200);
vertex(xPos+175,yPos+240);
vertex(xPos+190,yPos+275);
endShape(CLOSE);
}

//Move the horse
void move () {
  xPos -= xspeed; //Move the horse horizontally from right to left
  yPos -= random (-yspeed, yspeed);//Make horse gallup, but making it move vertically
  
//When the horse reaches the finish line, drop the red flag and announce there is a winner  
if (xPos < 20) {
    fill (255, 0, 0);
    strokeWeight(5);
    stroke (18, 3,3);
    line (250, 0, 20, 300);
    quad (140, 150, 300, 250, 250, 400, 20, 300);
    text("We have a winner!!", 100, 30);
  }

}

}



