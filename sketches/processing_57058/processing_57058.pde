
//robot v 1.5
//Week 2
//Chere De Koh

float x=100; 
   float y=100;
   float easing= 0.03; 
   int radius = 12; //eye radius
 
  void setup(){ 
  size(666, 666);
  smooth();
   }
   
   
    void draw(){ 
    int targetX=mouseX; 
   x+= (targetX-x)*easing; 
 int targetY=mouseY; 
   y+= (targetY-y)*easing; 
    if (mousePressed){ 
      radius=100;
      y=120; 
   } else{ 
     radius=12;
     y=60; 
} 


//Neck
noStroke();
fill(#000000);
rect(x+250,y+120,15,110);


//Head
fill(#000000);
smooth();
ellipse(x+250,y+80,40,40);
quad(x+210,y+80,x+290,y+80,x+294,y+135,x+208,y+165);

//base
fill(#000000);
ellipse(x+260,y+310,80,20); 
//HELPwanna tilt this 5.81

//torso
fill(#000000);
triangle(x+220,y+210,x+260,y+310,x+288,y+180);

//facial features!!

//eyes
fill(#FFFFFF);
ellipse(x+210,y+82,radius,radius);

fill(#FFFFFF);
ellipse(x+260,y+76,12,12);

//nose
fill(#FFFFFF);
triangle(x+235,y+98,x+235,y+118,x+200,y+118);

//mouth smile
fill(#FFFFFF);
triangle(x+215, y+130, x+215, y+155, x+254, y+122);

//bowtie
fill(#FFD700);
quad(x+240,y+180,x+240,y+210,x+270,y+185,x+270,y+210);

//buttons
fill(#FFFFFF);
ellipse(x+240, y+220, 5, 5);

//eyebrow
fill(#FFFFFF);
strokeWeight(5);
strokeJoin(ROUND);
arc(x+260, y+62, 14,14, 3.4, 5.8);
    }


