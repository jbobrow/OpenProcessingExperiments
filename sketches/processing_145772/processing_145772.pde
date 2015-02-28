
boolean kleur;
int counter;
int MonsterY;
 
void setup () {
  MonsterY=500;
    smooth();
  counter=0;
  kleur= true;
  
   
size (500,500);
 
}
void draw () {
  background(0);
  if ( counter ==10){background(255);}
  stroke(255);
  MonsterY= MonsterY-8;
  
 line(width/2,0,width/2,height);
 line(width/2,0,width/2,width);
 if (MonsterY < -200) { MonsterY=750; }
 if (MonsterY == 200 || MonsterY == 750) { counter=counter+1;
 }
 if (counter == 10) { kleur = !kleur;
 counter = 0;}
 
stroke (255);
fill(0);
ellipseMode(CENTER);
ellipse (mouseX,MonsterY,200,200);
ellipse (mouseX+125,MonsterY-100,125,125);
ellipse (mouseX-125,MonsterY-100,125,125);
 
fill (255);
ellipseMode (CENTER);
ellipse (mouseX-40,MonsterY,60,40);
ellipse (mouseX+40,MonsterY+0,60,40);
 
fill (200, 40);
ellipse (mouseX,MonsterY,180,50);
 
stroke (255);
fill (255,255,0,50);
ellipse (mouseX,MonsterY-190,150,40);
 
stroke (255);
fill (255);
ellipse (mouseX,MonsterY+60,100,30);
 
stroke(0);
fill(0);
rect ( mouseX-50,MonsterY+40,100,15);
 
stroke(0);
fill(0);
 
fill(255);
text(counter,9,23);
textSize(19);
 
}
