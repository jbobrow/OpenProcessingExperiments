
void setup(){
size (200,200);
}

void draw(){
background(255,255,255);
stroke(0);
fill(105,0,0);
ellipse(mouseX,mouseY,100,60);
//muts
stroke(0);
fill(105,0,150);
rect(mouseX-50,mouseY,100,130);
//lichaam
stroke(0);
fill(255);
rect(mouseX-50,mouseY+30,20,10);
stroke(0);
//tanden
fill(255);
rect(mouseX-30,mouseY+30,20,10);
stroke(0);
fill(255);
rect(mouseX-10,mouseY+30,20,10);
stroke(0);
fill(255);
rect(mouseX+10,mouseY+30,20,10);
stroke(0);
fill(255);
rect(mouseX+30,mouseY+30,20,10);
stroke(0);
fill(255);
rect(mouseX-50,mouseY+35,20,10);
stroke(0);
fill(255);
rect(mouseX-30,mouseY+35,20,10);
stroke(0);
fill(255);
rect(mouseX-10,mouseY+35,20,10);
stroke(0);
fill(255,255,0);
rect(mouseX+10,mouseY+35,20,10);
stroke(0);
fill(255);
rect(mouseX+30,mouseY+35,20,10);
//tanden
stroke(0);
fill(255);
ellipse(mouseX,mouseY+15,50,25);
//oog
stroke(0);
fill(255,0,0);
ellipse(mouseX,mouseY+15,30,15);
stroke(0);
fill(0,0,0);
ellipse(mouseX,mouseY+15,15,10);
//oog
stroke(0);
fill(255,255,0);
rect(mouseX-50,mouseY+50,100,5);
//bling
stroke(0);
fill(255,255,0);
rect(mouseX-20,mouseY+55,40,20);
//bling
}

