
PFont font;
    
    float enemyX1=0;  //Mine  
    float enemyY1=200;// starting
    float enemyX2=0;  // positions
    float enemyY2=520;//
    
    int sLx=-10000;//street line markers
    int sLy=360;//street line markers
    
    float easing=0.05;//easing
    float xease;      //for
    float yease;      //aiming reticule
    
    
void setup()
{ size(1280,720);
  smooth();
  stroke(0);
  font=loadFont("ChildsPlay.vlw");
}

void draw() 
{
  
  
   background(100);
   textFont(font,40);
   textAlign(LEFT);
   text("Click to make green mines disappear", 150, 500);
     strokeWeight(5);
      fill(90, 154, 112);
      rect(0,0,3000,100);
      rect(0,720,3000,100);
     
     fill(240,179,45);
  for(int x=sLx; x <=10000; x+=60)
     {
       fill(240,179,45);
       rectMode(CENTER);
       rect(x,sLy,25,10);
     }
   sLx++;
   textFont(font,30);
   textAlign(RIGHT);
   text("Move Mouse to move car and grenade reticule", 1250, 150);
  float carCenterX=mouseX;
  float carCenterY=mouseY;
  
  xease+=(carCenterX-xease)*easing;
  yease+=(carCenterY-yease)*easing;
  
  stroke(200,random(10),75);
  float weight=1+dist(mouseX,mouseY,pmouseX,pmouseY);  
  strokeWeight(weight*2);
 
 ellipse(xease+200,yease,weight,weight); 
 
 stroke(random(150),154,75);
 if(mousePressed==true)
 {
 }
 else
 {
  for(float enmx1=enemyX1;enmx1<1280;enmx1+=50)
  { ellipse(enmx1-random(2),enemyY1,weight/4,weight/5);
  }
  
  for(float enmx2=enemyX2;enmx2<1280;enmx2+=50)
  { ellipse(enmx2-random(2),enemyY2,weight/4,weight/5);
  }
 }
  enemyX1--;
  enemyX2--;
   stroke(0);
   strokeWeight(2);
  //wheels
fill(150);
ellipse((carCenterX-20), (carCenterY+30), 30, 15);
ellipse((carCenterX-20),(carCenterY+30),15,7);
ellipse((carCenterX+60), (carCenterY+30), 30, 15);
ellipse((carCenterX+60),(carCenterY+30),15,7);
//car body
beginShape();
fill(232,105,70);
vertex((carCenterX-55), (carCenterY-30));
vertex(carCenterX-30, carCenterY-50);
vertex(carCenterX+80, carCenterY-50);
vertex(carCenterX+78, carCenterY-10);
vertex(carCenterX+70, carCenterY-10);
vertex(carCenterX+70, carCenterY-5);
vertex(carCenterX+78, carCenterY-5);
vertex(carCenterX+80, carCenterY+30);
vertex(carCenterX-30, carCenterY+30);
vertex(carCenterX-55, carCenterY+10);
vertex(carCenterX-55, carCenterY-30);
endShape();
//right headlight
beginShape();
fill(240,193,93);
vertex(carCenterX-50,carCenterY-25);
vertex(carCenterX-30,carCenterY-45);
vertex(carCenterX-30,carCenterY-25);
vertex(carCenterX-50,carCenterY-25);
endShape();

//left headlight
beginShape();
fill(240,193,93);
vertex(carCenterX-50,carCenterY+5);
vertex(carCenterX-30,carCenterY+5);
vertex(carCenterX-30,carCenterY+25);
vertex(carCenterX-50,carCenterY+5);
endShape();

//rear right headlight
beginShape();
fill(240,193,93);
vertex(carCenterX+75,carCenterY-45);
vertex(carCenterX+73,carCenterY-25);
vertex(carCenterX+60,carCenterY-25);
vertex(carCenterX+60,carCenterY-45);
vertex(carCenterX+75,carCenterY-45);
endShape();

//rear left headlight
beginShape();
fill(240,193,93);
vertex(carCenterX+75,carCenterY+25);
vertex(carCenterX+73,carCenterY+5);
vertex(carCenterX+60,carCenterY+5);
vertex(carCenterX+60,carCenterY+25);
vertex(carCenterX+75,carCenterY+25);
endShape();

//windshield
beginShape();
fill(90,154,175);
vertex(carCenterX-10,carCenterY+20);
vertex(carCenterX+20,carCenterY+15);
vertex(carCenterX+20,carCenterY-35);
vertex(carCenterX-10,carCenterY-40);
vertex(carCenterX-10,carCenterY+20);
endShape();

//body creases
line(carCenterX-15,carCenterY+1,carCenterX-50,carCenterY-4);
line(carCenterX-15,carCenterY-20,carCenterX-50,carCenterY-15);
line(carCenterX-15,carCenterY-6,carCenterX-50,carCenterY-7);
line(carCenterX-15,carCenterY-13,carCenterX-50,carCenterY-12);
line(carCenterX+20,carCenterY-35,carCenterX+60,carCenterY-45);
line(carCenterX+20,carCenterY+15,carCenterX+60,carCenterY+25);



}

 



