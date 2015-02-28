
void setup (){
size (800,800); 


  
}

void draw (){
  background (#97BDE5);
  
  float centreX = -280;
  float centrey = -205;
  
  scale(1);
fill (#BC1114);
ellipse (mouseX+centreX+65,mouseY+centrey+202,20,95);
ellipse (mouseX+centreX+65,mouseY+centrey+202,60,40);
 
 
strokeWeight (5);
stroke (1);
line (mouseX+centreX+100,mouseY+centrey+230,mouseX+centreX+150,mouseY+centrey+300);
line (mouseX+centreX+200,mouseY+centrey+230,mouseX+centreX+150,mouseY+centrey+300);
fill (#676565);
ellipse (mouseX+centreX+150,mouseY+centrey+300,60,60);
ellipse (mouseX+centreX+150,mouseY+centrey+300,50,50);
 
noStroke ();
fill (#157495);
ellipse (mouseX+centreX+120,mouseY+centrey+155,100,50);
fill (#97BDE5);
ellipse (mouseX+centreX+155,mouseY+centrey+155,100,100);
 
 
 
 
fill (mouseX,mouseY,0);
triangle (mouseX+centreX+263,mouseY+centrey+155,mouseX+centreX+263,mouseY+centrey+250,mouseX+centreX+560,mouseY+centrey+250);
triangle (mouseX+centreX+263,mouseY+centrey+155,mouseX+centreX+263,mouseY+centrey+243,mouseX+centreX+560,mouseY+centrey+210);
rect (mouseX+centreX+560,mouseY+centrey+210,-100,39);
rect (mouseX+centreX+263,mouseY+centrey+155,-200,95);
ellipse (mouseX+centreX+520,mouseY+centrey+210,100,180);
ellipse (mouseX+centreX+450,mouseY+centrey+210,200,60);
 
 
 
 
fill (#97BDE5);
triangle (mouseX+centreX+263,mouseY+centrey+400,mouseX+centreX+263,mouseY+centrey+250,mouseX+centreX+800,mouseY+centrey+210);
 
strokeWeight (5);
stroke (1);
line (mouseX+centreX+560,mouseY+centrey+250,mouseX+centreX+530,mouseY+centrey+230);
noStroke ();
 
fill (#97BDE5);
rect (mouseX+centreX+570,mouseY+centrey+250,-200,200);
 
 
strokeWeight (5);
stroke (1);
fill (#676565);
ellipse (mouseX+centreX+560,mouseY+centrey+250,30,30);
noCursor ();
 
 
 
noStroke ();
fill (#F7F9FA);
ellipse (mouseX+centreX+280,mouseY+centrey+205,70,70);
fill (#0256D8);
ellipse (mouseX+centreX+280,mouseY+centrey+205,50,50);
fill (#D80209);
ellipse (mouseX+centreX+280,mouseY+centrey+205,30,30);
 
noStroke ();
fill (#145F09);
ellipse (mouseX+centreX+150,mouseY+centrey+200,150,40);
 
 
strokeWeight (5);
stroke (1);
stroke (#B96613);
line (mouseX+centreX+120,mouseY+centrey+230,mouseX+centreX+70,mouseY+centrey+100);
line (mouseX+centreX+250,mouseY+centrey+230,mouseX+centreX+200,mouseY+centrey+100);
line (mouseX+centreX+70,mouseY+centrey+156,mouseX+centreX+70,mouseY+centrey+100);
line (mouseX+centreX+200,mouseY+centrey+156,mouseX+centreX+200,mouseY+centrey+100);
 
noStroke ();
fill (#A05810);
ellipse (mouseX+centreX+190,mouseY+centrey+230,160,15);
ellipse (mouseX+centreX+150,mouseY+centrey+100,180,20);
fill (#97BDE5);
ellipse (mouseX+centreX+150,mouseY+centrey+155,90,20);
fill (0);
ellipse (mouseX+centreX+525,mouseY+centrey+180,70,70);
fill (#016C25);
ellipse (mouseX+centreX+530,mouseY+centrey+180,52,72);
 
textSize(20);
fill(255);
text("20", mouseX+centreX+518, mouseY+centrey+185);
 
fill (#BC1114);
ellipse (mouseX+centreX+40,mouseY+centrey+160,10,120);
ellipse (mouseX+centreX+40,mouseY+centrey+240,10,120);

}


