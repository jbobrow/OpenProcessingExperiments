
color start=color(0,0,0);
color finish;
float amt = 0.0;


void setup(){
size(250,250);
smooth();
frameRate(60);
background(start); 
finish = color(random(255),random(255),random(255));
}

void draw(){
  
  amt+=.01;
 if (amt >= 1) {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }
 background(lerpColor(start,finish,amt));
 
ellipseMode(CENTER);
//head
fill(mouseX,0,mouseY);
ellipse(mouseX,mouseY-20,50,50);
//eyes
fill(mouseX,200,mouseY);
ellipse(mouseX-9,mouseY-20,7,7);
ellipse(mouseX+9,mouseY-20,7,7);
//chest
noStroke();
fill(mouseX,90,mouseY);
ellipse(mouseX,mouseY+40,50,80);
ellipse(mouseX-10,mouseY+10,20,20);
ellipse(mouseX+10,mouseY+10,20,20);
//wings
stroke(#030000);
strokeWeight(3);
line(mouseX+15,mouseY,pmouseX+50,pmouseY-40);
line(mouseX+50,mouseY-40,pmouseX+50,pmouseY-10);
line(mouseX+30,mouseY-15,pmouseX+30,pmouseY+10);
line(mouseX-15,mouseY,pmouseX-50,pmouseY-35);
line(mouseX-50,mouseY-35,pmouseX-50,pmouseY-10);
line(mouseX-30,mouseY-15,pmouseX-30,pmouseY+10);
strokeWeight(5);
//legs
line(mouseX+15,mouseY+70,pmouseX+15,pmouseY+90);
line(mouseX-15,mouseY+70,pmouseX-15,pmouseY+90);
//feet
noStroke();
fill(mouseX,255,mouseY);
ellipse(pmouseX+15,pmouseY+90,10,10);
ellipse(pmouseX-15,pmouseY+90,10,10);
}





