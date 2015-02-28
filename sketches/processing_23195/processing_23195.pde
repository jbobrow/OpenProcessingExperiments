
void setup(){
    background (100,150,40);
  size(200,200);
}

void mousePressed(){
  stroke(0);
  fill(23,49,222);
  ellipseMode(CENTER);
  ellipse(mouseX+1,mouseY+10,16,16);//face

}

void draw(){
fill(123,86,92);
ellipse(pmouseX,pmouseY,mouseX,mouseY);
fill(mouseX,0,mouseY);
ellipse(mouseX,mouseY-30,25,32);//EYES
ellipse(mouseX+19,mouseY-30,25,32);//EYES


ellipse(pmouseX,pmouseY,mouseX,mouseY);
fill(23,49,222);

ellipse(mouseX,mouseY-10,5,5);//bubble
ellipse(mouseX,mouseY-50,5,5);//bubble
ellipse(mouseX-30,mouseY-5,10,10);//bubble
ellipse(mouseX-40,mouseY-20,10,10);//bubble
ellipse(mouseX+30,mouseY-5,10,10);//bubble
ellipse(mouseX+40,mouseY-20,10,10);//bubble




fill(0);
ellipse(mouseX+19,mouseY-30,15,22);//inside right
ellipse(mouseX,mouseY-30,15,22);//insideleft
fill(255);
ellipse(mouseX+19,mouseY-30,5,12);//insidesinsideright
ellipse(mouseX,mouseY-30,5,12);//insideinsideleft
fill(0);
ellipse(mouseX+1,mouseY+10,15,22);//innermouth
fill(255);
ellipse(mouseX+1,mouseY+10,5,12);//innermouth
}

void keyPressed(){
  background (12,10,80);
}

