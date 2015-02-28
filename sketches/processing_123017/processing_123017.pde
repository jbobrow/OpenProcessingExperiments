
int monsterX;      
int monsterY;      

void setup() {
size (300,300);
monsterX = 100;    
monsterY = 100;    

}

void draw () {
  
if(monsterY == -300)
monsterY= 450;

background (255,255,255);
  
noStroke ();
fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX-50,monsterY+75,50,50);  


fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX+50,monsterY+75,50,50);  


fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX,monsterY,180,150);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX-25,monsterY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX-25,monsterY-25,20,20);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX+25,monsterY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX+25,monsterY-25,20,20);

monsterY = monsterY -2;   
}













