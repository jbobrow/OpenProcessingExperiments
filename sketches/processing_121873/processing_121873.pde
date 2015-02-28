
int monsterX; //declareren
int monsterY; //declareren


void setup() {
  size(200,200);
  monsterX=60;
  monsterY=55;
}


void draw() {
background(255,255,255);

//monsterx=60
//monstery=55


fill(113,50,0);               //ear1
ellipseMode(CENTER);        //ear1
ellipse(mouseX,monsterY,50,50);      //ear1


fill(113,50,0);              //ear2
ellipseMode(CENTER);        //ear2
ellipse(mouseX+53,monsterY-5,50,50);      //ear2


fill(255,255,255);          //inear1
ellipseMode(CENTER);        //inear1
ellipse(mouseX-2,monsterY+2,20,20);       //inear1


fill(255,255,255);          //inear2
ellipseMode(CENTER);        //inear2
ellipse(mouseX+53,monsterY-5,20,20);      //inear2


fill(113,50,0);            //head
ellipseMode(CENTER);       //head
ellipse(mouseX+30,monsterY+30,85,85);      //head


fill(0,0,20);              //eye1
ellipseMode(CENTER);      //eye1
ellipse(mouseX+40,monsterY+15,5,5);      //eye1


fill(0,0,20);             //eye2
ellipseMode(CENTER);      //eye2
ellipse(mouseX+20,monsterY+15,5,5);       //eye2


fill(0,0,20);             //nose
ellipseMode(CENTER);      //nose
ellipse(mouseX+30,monsterY+40,5,5);       //nose

line(mouseX+30,monsterY+40,mouseX-15,monsterY+25);        //nosehairleft1
line(mouseX+30,monsterY+40,mouseX-15,monsterY+35);        //nosehairleft2
line(mouseX+30,monsterY+40,mouseX-15,monsterY+45);       //nosehairleft3

line(mouseX+30,monsterY+40,mouseX+80,monsterY+25);      //nosehairright1
line(mouseX+30,monsterY+40,mouseX+80,monsterY+35);      //nosehairright2
line(mouseX+30,monsterY+40,mouseX+80,monsterY+45);     //nosehairright3


//fill(255,255,255);        //mouth
//rect(monsterX+20,monsterY+50,monsterX-56,monsterY-45);        //mouth  
//rect(monsterX+24,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+28,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+32,monsterY+50,monsterX-56,monsterY-45);        //mouth
//rect(monsterX+36,monsterY+50,monsterX-56,monsterY-45);        //mouth
line(mouseX+20,monsterY+60,mouseX+40,monsterY+60);     //mouth


monsterY --;


}



