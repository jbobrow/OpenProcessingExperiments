

void setup(){
  size(900,900);
}

void draw(){
background(255,255,255);

//body
noStroke();
fill(242,115,17);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,400,300);

//face
noStroke();
fill(255,237,183);
ellipseMode(CENTER);
ellipse(mouseX,mouseY-200,350,290);

//mouth
noStroke();
fill(0);
rectMode(CENTER);
rect(mouseX,mouseY-100,50,5);

//hatleft
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX-170,mouseY-200,85,140);

//hatright
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX+170,mouseY-200,85,140);

//hat
noStroke();
fill(65,193,60);
rectMode(CENTER);
rect(mouseX,mouseY-330,350,130);

//hatinside
noStroke();
fill(43,117,48);
rectMode(CENTER);
rect(mouseX,mouseY-300,300,70);

//lefteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(mouseX-45,mouseY-210,90,110);

//righteye
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(mouseX+45,mouseY-210,90,110);

//lefteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(mouseX-20,mouseY-210,8,8);

//righteyepupil
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+20,mouseY-210,8,8);

//pants
noStroke();
fill(21,114,92);
rectMode(CENTER);
rect(mouseX,mouseY+125,300,110);

//righthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(mouseX+150,mouseY+50,100,100);

//lefthand
noStroke();
fill(65,193,60);
ellipseMode(CENTER);
ellipse(mouseX-150,mouseY+50,100,100);

//shoes
noStroke();
fill(40,40,40);
rectMode(CENTER);
rect(mouseX,mouseY+180,350,20);


}  

