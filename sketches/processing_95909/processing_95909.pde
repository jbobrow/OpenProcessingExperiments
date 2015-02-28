
void setup(){
  size(400,400);
  background(0);
}

 void draw(){
   background(210,81,250); 
   stroke(255);
   strokeWeight(5); 
   
   //color canviant. 
   fill(10+mouseX,0+mouseY,150);
   noStroke();

//es desabilita el noCursor per a que es vegi que el cursor està en el centre.
//noCursor();

rect(mouseX-30,mouseY-50,60,100);
ellipse(mouseX,mouseY-50,60,70);
stroke(255);
strokeWeight(15);
line(mouseX-23,mouseY+47,mouseX+22,mouseY+47);
noStroke();
fill(108,69,7);
rect(mouseX-10,mouseY+50,20,50);
ellipse(mouseX,mouseY+100,20,20);

//cara

noFill();
strokeWeight(3);
stroke(255);
ellipse(mouseX,mouseY-35,10,20);   

fill(10+mouseX,0+mouseY,150);
noStroke();
rect(mouseX-10,mouseY-50,20,15);

fill(0);
strokeWeight(2);
stroke(255);
ellipse(mouseX+10,mouseY-50,8,20);
ellipse(mouseX-10,mouseY-50,8,20);
   
 }







