
void setup() {
  size(200,200);
}


void draw() {
background(255,255,255);

//mousex=60
//mousey=55


fill(113,50,0);               //ear1
ellipseMode(CENTER);        //ear1
ellipse(mouseX,mouseY,50,50);      //ear1


fill(113,50,0);              //ear2
ellipseMode(CENTER);        //ear2
ellipse(mouseX+53,mouseY-5,50,50);      //ear2


fill(255,255,255);          //inear1
ellipseMode(CENTER);        //inear1
ellipse(mouseX-2,mouseY+2,20,20);       //inear1


fill(255,255,255);          //inear2
ellipseMode(CENTER);        //inear2
ellipse(mouseX+53,mouseY-5,20,20);      //inear2


fill(113,50,0);            //head
ellipseMode(CENTER);       //head
ellipse(mouseX+30,mouseY+30,85,85);      //head


fill(0,0,20);              //eye1
ellipseMode(CENTER);      //eye1
ellipse(mouseX+40,mouseY+15,5,5);      //eye1


fill(0,0,20);             //eye2
ellipseMode(CENTER);      //eye2
ellipse(mouseX+20,mouseY+15,5,5);       //eye2


fill(0,0,20);             //nose
ellipseMode(CENTER);      //nose
ellipse(mouseX+30,mouseY+40,5,5);       //nose

line(mouseX+30,mouseY+40,mouseX-15,mouseY+25);        //nosehairleft1
line(mouseX+30,mouseY+40,mouseX-15,mouseY+35);        //nosehairleft2
line(mouseX+30,mouseY+40,mouseX-15,mouseY+45);       //nosehairleft3

line(mouseX+30,mouseY+40,mouseX+80,mouseY+25);      //nosehairright1
line(mouseX+30,mouseY+40,mouseX+80,mouseY+35);      //nosehairright2
line(mouseX+30,mouseY+40,mouseX+80,mouseY+45);     //nosehairright3


//fill(255,255,255);        //mouth
//rect(mouseX+20,mouseY+50,mouseX-56,mouseY-45);        //mouth  
//rect(mouseX+24,mouseY+50,mouseX-56,mouseY-45);        //mouth
//rect(mouseX+28,mouseY+50,mouseX-56,mouseY-45);        //mouth
//rect(mouseX+32,mouseY+50,mouseX-56,mouseY-45);        //mouth
//rect(mouseX+36,mouseY+50,mouseX-56,mouseY-45);        //mouth
line(mouseX+20,mouseY+60,mouseX+40,mouseY+60);     //mouth
}



