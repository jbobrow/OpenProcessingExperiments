
void setup(){

size(500,500);

}


void draw(){
  
background(255,165,0);  
stroke(0);

//body
fill(100,230,80);
ellipseMode(CENTER);
ellipse(250+mouseX,250+mouseY,150,250);

fill(255);
ellipse(250+mouseX,240+mouseY,100,230);

//legs
fill(100,230,80);
ellipseMode(CORNER);
ellipse(170+mouseX,300+mouseY,25,80);
ellipse(300+mouseX,300+mouseY,25,80);


//head
fill(100,230,80);
ellipseMode(CORNER);
ellipse(100+mouseX,100+mouseY,300,150);

fill(0);
ellipse(220+mouseX,180+mouseY,4,10);
ellipse(280+mouseX,180+mouseY,4,10);

//eye
fill(100,230,80);
ellipseMode(CORNER);
ellipse(100+mouseX,100+mouseY,40,35);
ellipse(365+mouseX,100+mouseY,40,35);

fill(0);
ellipse(105+mouseX,105+mouseY,28,22);
ellipse(367+mouseX,105+mouseY,28,22);

}

