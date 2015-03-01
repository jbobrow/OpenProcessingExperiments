
void setup(){
  size(600,600);
  background(255);
  smooth();
}

void draw(){
  background(204,229,255);
  
//cap//
fill(255,204,229);
stroke(0);
arc(mouseX+70,mouseY-100, 80, 80, PI+QUARTER_PI, TWO_PI);
ellipse(mouseX,mouseY,300,300);
arc(mouseX-70,mouseY-100,80, 80, PI, TWO_PI);

//peus//
ellipse(mouseX-70,mouseY+110,45,100);
ellipse(mouseX+80,mouseY+110,45,100);

noStroke();

//boca//
fill(255,153,153);
ellipse(mouseX+30,mouseY+60,30,30);

//ulls//
fill(255);
ellipse(mouseX-20,mouseY,90,90);
ellipse(mouseX+80,mouseY,90,90);
 
fill(0,204,204);
ellipse(mouseX-20,mouseY,80,80);
ellipse(mouseX+80,mouseY,80,80);

fill(0,153,153);
ellipse(mouseX-20,mouseY,65,65);
ellipse(mouseX+80,mouseY,65,65);
 
fill(255);
ellipse(mouseX-15,mouseY-25,20,20);
ellipse(mouseX+85,mouseY-25,20,20);

//notes amb canvi de color//
fill(mouseX,mouseY,0);
ellipse(mouseX-270,mouseY+110,40,20);
ellipse(mouseX-200,mouseY+110,40,20);
rect(mouseX-253,mouseY+50,3,60);
rect(mouseX-183,mouseY+50,3,60);
rect(mouseX-183,mouseY+50,-70,3);

fill(0,mouseX,mouseY);
ellipse(mouseX+200,mouseY+110,40,20);
rect(mouseX+217,mouseY+50,3,60);

fill(mouseX,0,mouseY);
ellipse(mouseX-270,mouseY-50,40,20);
ellipse(mouseX-200,mouseY-50,40,20);
rect(mouseX-253,mouseY-110,3,60);
rect(mouseX-183,mouseY-110,3,60);
rect(mouseX-183,mouseY-110,-70,3);

}
 
