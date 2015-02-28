
void setup(){
size(600,600);

}

void draw(){
background(65,120,214);
strokeWeight(0);
stroke(0,0,0);


strokeWeight(0);
stroke(255,160,5);
fill(255,160,5);
ellipse(mouseX-60,mouseY+155,width*0.08,height*0.2);

strokeWeight(0);
stroke(255,160,5);
fill(255,160,5);
ellipse(mouseX+60,mouseY+155,width*0.08,height*0.2);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
ellipse(mouseX,mouseY-150,width*0.3,height*0.4);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
rectMode(CENTER);
rect(mouseX,mouseY,width*0.3,height*0.5);

strokeWeight(0);
stroke(255,255,255);
fill(255,255,255);
rectMode(CENTER);
rect(mouseX,mouseY+60,width*0.2,height*0.3);

strokeWeight(0);
stroke(255,255,255);
fill(255,255,255);
ellipse(mouseX,mouseY-20,width*0.2,height*0.4);

strokeWeight(0);
stroke(255,255,255);
fill(255,255,255);
ellipse(mouseX-40,mouseY-200,width*0.1,height*0.1);

strokeWeight(0);
stroke(255,255,255);
fill(255,255,255);
ellipse(mouseX+40,mouseY-200,width*0.12,height*0.12);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
ellipse(mouseX+30,mouseY-190,width*0.05,height*0.05);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
ellipse(mouseX-30,mouseY-190,width*0.03,height*0.03);

strokeWeight(0);
stroke(255,160,5);
fill(255,160,5);
triangle(mouseX-30,mouseY-160,mouseX+30,mouseY-160,mouseX-20,mouseY-110);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
triangle(mouseX-90,mouseY-130,mouseX-90,mouseY-80,mouseX-160,mouseY-40);

strokeWeight(0);
stroke(0,0,0);
fill(0,0,0);
triangle(mouseX+90,mouseY-130,mouseX+90,mouseY-80,mouseX+160,mouseY-40);
noCursor();
}

