
void setup() { 
  size(500, 500);
}

void draw() {
size(400,400);
background(255,255,255);
stroke(0);
fill(75,0,130);
rect(mouseX,mouseY,40,100);              //lichaam//
fill(0,255,100);
ellipse(mouseX+20,mouseY-20,50,50);      //hoofd//
fill(0,255,100);
rect(mouseX,mouseY+100,15,40);                     //beenLinks//
rect(mouseX+25,mouseY+100,15,40);                     //beenRechts//
fill(75,0,130);
ellipse(mouseX+10,mouseY-20,15,15);                 //oogLinks//
ellipse(mouseX+30,mouseY-20,15,15);                  //oogRechts//
ellipse(mouseX+20,mouseY-5,30,10);                  //mond//
line(mouseX+20,mouseY-45,mouseX+20,mouseY-65);                   //opznKop//
ellipse(mouseX+20,mouseY-70,15,20);                  //bolletjeOpKop//
line(mouseX,mouseY+20,mouseX-50,mouseY-30);                   //armLinks//
line(mouseX+40,mouseY+20,mouseX+90,mouseY-30);                   //armRechts//
fill(0,255,100);
ellipse(mouseX-50,mouseY-30,10,25);                  //handLinks//
ellipse(mouseX+90,mouseY-30,10,25);                  //handRechts//
}















