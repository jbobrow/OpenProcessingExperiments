
int monsterX;     
int monsterY; 
 
 
void setup() {
size (500,500);

 }
 
void draw () {
   
  background (255);
   for (int i = 0; i < 10; i = i + 1){
    monster (-61+(i*210),225);
}


}

void monster(int monsterX, int monsterY){ 
//poot links   
noStroke ();
fill (100,0,100);
ellipseMode (CENTER);
ellipse (monsterX+50,monsterY+75,50,50); 
 
//poot rechts
fill (100,0,100);
ellipseMode (CENTER);
ellipse (monsterX+150,monsterY+75,50,50); 

//lichaam 
fill (100,0,100);
ellipseMode (CENTER);
ellipse (monsterX+100,monsterY,180,150);

//arm links
fill (100,0,100);
ellipseMode(CENTER);
ellipse (monsterX+2,monsterY,45,30);

//arm rechts
fill (100,0,100);
ellipseMode(CENTER);
ellipse (monsterX+200,monsterY,45,30);

//hoofd ding
fill (100,0,100);
ellipseMode(CENTER);
ellipse (monsterX+100,monsterY-86,30,30);

fill (100,0,100);
ellipseMode(CENTER);
ellipse (monsterX+90,monsterY-109,35,30);

fill (100,0,100);
ellipseMode(CENTER);
ellipse (monsterX+80,monsterY-132,20,30);

//oog links
stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (monsterX+75,monsterY-25,50,50);

//pupil links
fill (0,0,0); 
ellipseMode (CENTER);
ellipse (monsterX+75,monsterY-25,20,20);
                   
//oog rechts
stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (monsterX+125,monsterY-25,50,50);

//pupil rechts
fill (0,0,0); 
ellipseMode (CENTER);
ellipse (monsterX+125,monsterY-25,20,20);


  
 
}
 


