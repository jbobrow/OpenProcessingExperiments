
float pX=100;
float pY=200;
float vX=5;
float vY=5;
float value=255;


void setup(){
size(600,700);
background(240,201,210);
}
void draw(){
  rect(0,0,600,700);
 
 
stroke(242,226,105);
fill(245,227,153);
ellipse(pX+0,pY-100,75,75);
  
fill(178,245,196);
ellipse(pX-150,pY-175,40,50);
  
fill(178,245,196);
ellipse(pX+125,pY-175,40,50);
  
fill(178,245,196);
ellipse(pX-100,pY-150,20,30);
  
fill(178,245,196);
ellipse(pX+75,pY-150,20,30);
  
  
fill(222,123,138);
ellipse(pX-85,pY+0,60,30);
  
  
fill(222,123,138);
ellipse(pX-85,pY-35,120,60);
  
fill(222,123,138);
ellipse(pX+85,pY+0,60,30);
  
fill(222,123,138);
ellipse(pX+70,pY-35,120,60);
  
strokeWeight(5);
fill(245,227,153);
line(pX-30,pY+50,pX-70,pY+180);
  
strokeWeight(5);
fill(245,227,153);
line(pX+30,pY+50,pX+70,pY+180);
  
strokeWeight(1);
stroke(211,62,84);
fill(252,66,94);
triangle(pX-25,pY-130,pX+0,pY-225,pX+25,pY-130);
  
fill(160,34,53);
ellipse(pX+0,pY-225,20,20);
  
fill(5,5,2);
line(pX+10,pY-225,pX+25,pY-215);
  
fill(5,5,2);
line(pX+25,pY-215,pX+40,pY-230);
  
fill(5,5,2);
ellipse(pX-15,pY-115,8,8);
  
fill(5,5,2);
ellipse(pX+15,pY-115,8,8);
  
fill(222,123,138);
ellipse(pX-20,pY-90,15,15);
  
fill(222,123,138);
ellipse(pX+20,pY-90,15,15);
  
fill(160,34,53);
line(pX-10,pY-80,pX-5,pY-75);
  
fill(160,34,53);
line(pX-5,pY-75,pX+0,pY-80);
  
fill(160,34,53);
line(pX+0,pY-80,pX+5,pY-75);
  
fill(160,34,53);
line(pX+5,pY-75,pX+10,pY-80);
  
fill(252,229,234);
stroke(250,189,200);
strokeWeight(1);
ellipse(pX+0,pY+5,180,140);
  
fill(240,201,210);
ellipse(pX+60,pY+5,10,10);
  
fill(240,201,210);
ellipse(pX-15,pY+60,10,10);
  
fill(240,201,210);
ellipse(pX+10,pY-30,10,10);
  
fill(55,165,85);
ellipse(pX-50,pY-20,10,10);
  
fill(55,165,85);
ellipse(pX+70,pY+30,10,10);
  
fill(55,165,85);
ellipse(pX+0,pY+50,10,10);
  
fill(252,66,94);
ellipse(pX-70,pY+20,10,10);
  
fill(252,66,94);
ellipse(pX+50,pY-20,10,10);
  
fill(222,123,138);
ellipse(pX-85,pY+175,50,30);
  
fill(222,123,138);
ellipse(pX+80,pY+175,50,30);
  
textSize(10);
text("Inés Sivatte",pX+120,pY+175);
fill(0, 102, 153);
  
textSize(10);
text("Seminari 01",pX+120,pY+220);
fill(0, 102, 153);
 
 
 pX=pX+vX;
 pY=pY+vY;
 
 
 if((pX+150>=width)||(pX-100<=0)){ 
vX=-vX;
}
if((pY+175>=height)||(pY-200<=0)){ 
vY=-vY;
}
if (pX > height/2){   fill(255);}
ellipse(pX-85,pY+0,60,30);
ellipse(pX-85,pY-35,120,60);
ellipse(pX+85,pY+0,60,30);
ellipse(pX+70,pY-35,120,60);

if (pX > width/2){   fill(252,187,102);}
ellipse(pX+0,pY+5,180,140);
}
void mousePressed() {
  
  pX = mouseX;
  pY = mouseY;
    
if (vX == 10){
    vX = 5;
    } else {
    vX = 11;
}
if (vY == 7){
    vY = 3;
   } else {
   vY = 9;
}
if (value==255){
  value = 0;
} else {
  value = 255;
  

}

}


