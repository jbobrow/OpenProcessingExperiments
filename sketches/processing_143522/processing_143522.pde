
//Sergi Sillaurren
void setup(){
size(300,300);
}

void draw(){
background(0);
stroke(150);
fill(150);
ellipse(mouseX-33,mouseY-50,20,45);
ellipse(mouseX+33,mouseY-50,20,45);
stroke(255);
fill(255);
ellipse(mouseX-30,mouseY-45,20,40);
ellipse(mouseX+30,mouseY-45,20,40);
ellipse(mouseX,mouseY,100,100);
stroke(199);
fill(200);
ellipse(mouseX,mouseY+20,70,50);
stroke(0);
fill(0);
ellipse(mouseX,mouseY+10,20,10);
noFill();
strokeWeight(1);
arc(mouseX,mouseY+25,20,20,0, PI,OPEN);
strokeWeight(2);
arc(mouseX-20,mouseY-20,15,25,PI, TWO_PI,OPEN);
arc(mouseX+20,mouseY-20,15,25,PI, TWO_PI,OPEN);
}


