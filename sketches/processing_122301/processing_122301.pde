


void setup(){
setStuffUp();



}

void setStuffUp() {
size(280,580);
background(240);
smooth();
ellipseMode(CENTER);
rectMode(CORNERS);
} 

void draw(){
  //http://processing.org/reference/mousePressed.html
if (mousePressed == true) {

     

     background(208,206,240);
     drawTheGround();   
    //print("mouse is down");
    drawTheBodyChange(); 
    drawTheHatInTheAir();  
    drawTheNoseChange();
    drawTheEyesChange(); 
    drawTheMouthChange(); 
    drawTheArmsChange(); 
    drawTheButtonsChange(); 
  } else {

    background(240,240,240);
    drawTheGround();   
    //print("mouse is up");
    drawTheBody(); 
    drawTheHat(); 
    drawTheNose();   
    drawTheEyes();
    drawTheMouth(); 
    drawTheArms(); 
    drawTheButtons();     
  }
}

void drawTheGround() {
fill(250);
ellipse(140,610,470,380);
}

void drawTheBody() {
//bottom circle
fill(255);
ellipse(140,380,160,160);
//middle circle
ellipse(140,270,120,120);
//top circle
ellipse(140,180,90,90);
}

void drawTheBodyChange() {
//shifted
//bottom circle
fill(255);
ellipse(150,380,160,160);
//middle circle
ellipse(130,270,120,120);
//top circle
ellipse(150,180,90,90);
}

void drawTheHat() {
strokeWeight(7);
line(100,145,180,145);
strokeWeight(2);
fill(0);
rect(115,80,165,145);
}

void drawTheHatInTheAir() {
strokeWeight(7);
line(110,100,190,100);
strokeWeight(2);
fill(0);
rect(125,35,175,100);
}

void drawTheNose() {
//nose
strokeWeight(1);
stroke(255,122,21);
fill(255,122,21);
triangle(140,178,180,190,140,190);
}

void drawTheNoseChange() {
//burnt nose
strokeWeight(1);
stroke(124,57,9);
fill(124,57,9);
triangle(150,178,190,190,150,190);
}

void drawTheEyes() {
//eyes
stroke(0);
fill(50);
ellipse(120,170,10,10);
ellipse(160,170,10,10);

}

void drawTheEyesChange() {
//messsed up eyes
stroke(0);
fill(50);
ellipse(130,180,10,10);
ellipse(170,160,10,10);
}

void drawTheMouth() {  
//mouth
ellipse(125,200,4,4);
ellipse(155,200,4,4);
ellipse(135,205,4,4);
ellipse(145,205,4,4);
}

void drawTheMouthChange() {  
//mouth
ellipse(135,200,4,4);
ellipse(165,200,4,4);
ellipse(145,205,4,4);
ellipse(155,205,4,4);
}

void drawTheArms() {  
//arms
strokeWeight(2);
//right
line(200,255,260,240);
line(240,245,260,225);
line(260,260,220,250);
//left
line(80,255,20,240);
line(20,225,40,245);
line(60,250,20,260);
}

void drawTheArmsChange() {  
//moved arms
strokeWeight(2);
//right
line(190,255,250,240);  
line(230,245,250,225);
line(250,260,210,250);
//left
line(70,255,10,240);
line(10,225,30,245);
line(50,250,10,260);
}

void drawTheButtons() {
//buttons
//upper
ellipse(140,240,7,7);
ellipse(150,270,7,7);
ellipse(140,300,7,7);
//lower
ellipse(140,340,7,7);
ellipse(150,370,7,7);
ellipse(150,400,7,7);
ellipse(140,430,7,7);
}

void drawTheButtonsChange() {
//buttons
//upper
ellipse(130,240,7,7);
ellipse(120,270,7,7);
ellipse(130,300,7,7);
//lower
ellipse(150,340,7,7);
ellipse(160,370,7,7);
ellipse(160,400,7,7);
ellipse(150,430,7,7);
}


