
void setup(){
  size(800,800);
}

void draw(){

background(255);
noStroke();

//CLOSCA
fill(20,100,4,200);
ellipse(mouseX,mouseY,width/2,height*2/3);

//PANXA
fill(100,200,4,120);
ellipse(mouseX,mouseY,width*3/7,height*4/7);


//PIT
fill(235,255,113);
rect(mouseX-width/8,mouseY-height/10,width/4,height/5);
ellipse(mouseX,mouseY+height/10,width/4,height/4);

//CAP
fill(100,200,4);
ellipse(mouseX,mouseY-height/3,width/4,height/4);
ellipse(mouseX,mouseY-height/4,width/3,height/5);

//MANS
fill(100,200,4);
ellipse(mouseX-width*3/11,mouseY+height/10,width/10,height/10);
ellipse(mouseX+width*3/11,mouseY+height/10,width/10,height/10);

//PEUS
fill(100,200,4);
rect(mouseX-width/10,mouseY+height/4,width/11,height/4);
rect(mouseX+width/8*1/11,mouseY+height/4,width/11,height/4);

//CINTA-PEUS
fill(120,20,140);
rect(mouseX-width/10,mouseY+height/2.5,width/11,height/30);
rect(mouseX+width/8*1/11,mouseY+height/2.5,width/11,height/30);

//CINTA-CAP
fill(120,20,140,200);
rect(mouseX-width*7/48,mouseY-height/3,width*7/24,height/15);

//PAL

fill(200,100,3);
rect(mouseX-width*6/14,mouseY+height/12,width*6/7,height/22);
fill(150,150,150);
rect(mouseX-width*2/14,mouseY+height/12,width*4/14,height/22);
  
}
