
//Pooja Trivedi
//mycreature
//8/5/2013

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  if(mousePressed) {
    mySadCreature();
  }
  
  else {
    myHappyCreature();
  }
}
    

//=================================

void mySadCreature(){
 

 background(145,69,222);
  
ellipse(mouseX+250,mouseY+100,80,80);

fill(11,26,230);

rect(mouseX+210,mouseY+140,80,100);

line (mouseX+210,mouseY+170,mouseX+110,mouseY+110);

line(mouseX+300,mouseY+170,mouseX+210,mouseY+110);
}


//=========================================

void myHappyCreature(){
   background(145,69,222);
  
ellipse(mouseX+250,mouseY+100,80,80);

fill(87,247,25);

rect(mouseX+210,mouseY+140,80,100);

line (mouseX+210,mouseY+170,mouseX+110,mouseY+110);

line(mouseX+300,mouseY+170,mouseX+210,mouseY+110);
}

//==================================================
