
int varX= 100;
int varY= -60;
float textPosY = 0;
PFont anyName;

void setup(){

size(600, 600);
rectMode(CENTER);

anyName = createFont("Futura", 32);


//window
strokeWeight(30);
stroke(255, 40);
fill(14, 32, 72);
rect(varX+30,varY+100, 400, 200);
stroke(.1,70);
  fill(251,245, 245);


//body
rect(varX+210, varY+400, height/5, height/3.5, 40, 40, 300, 300);
//Connector
fill(255,221,170);
rect(varX+210, varY+310, 60, 20, 10, 10,5,5);

rect(varX+210, varY+480, 100, 20, 10, 10,0,0);

//Table
strokeWeight(10);
fill(95,63,13);
rect(varX+280,varY+590,20,200);
//Table top
rect(varX+210,varY+505, 300,30, 3);
//left front
rect(varX+130,varY+590,20,200);
rect(varX+70,varY+590,20,200);

rect(varX+350,varY+590,20,200);




}

void draw (){
background(210,200,200,20);


//text
 textPosY = textPosY + 1;

//  strokeWeight(30);
//stroke(255, 40);
//fill(14, 32, 72);
//rect(varX+30,varY+100, 400, 200);
stroke(.01,20);
strokeWeight(10);
//  fill(251,245, 245);
// creating the hue range 
float hueC = map(mouseY, 
                   0, 1000,
                   51, 1000);

//body

rect(varX+210, varY+400, height/5, height/3.5, 40, 40, 300, 300);
//lamp brass connector
fill(255,221,170);
rect(varX+210, varY+310, 60, 20, 10, 10,5,5);
rect(varX+210, varY+480, 100, 20, 10, 10,0,0);

//Table
strokeWeight(10);
fill(95,63,13);
rect(varX+280,varY+590,20,200);
//Table top
rect(varX+210,varY+505, 300,30, 3);
//left front
rect(varX+130,varY+590,20,200);
rect(varX+70,varY+590,20,200);

rect(varX+350,varY+590,20,200);

//Globe
//light
noStroke();
fill(hueC,90, 90, 30);//ellipse(311, 178, 342, 342);

//Globe
//light glow
fill(hueC,90, 90, 30);
colorMode(HSB);
strokeWeight(100);
stroke(hueC,90, 90, 30);
ellipse (varX+210, varY+240,100, 100);
ellipse (varX+210, varY+240,100, 100);

// ADD TEXT

color(255);
textSize(200);
textFont(anyName);
textAlign(CENTER);
text("GLOW", mouseY, mouseX);

fill(hueC,120, mouseX+90, 30);
//ellipse (varX+210, varY+240,100, 100);

fill(hueC,50, 50, 20);
ellipse(varX+210, varY+240, 140, 140);
fill(mouseX+50,120, mouseX+90, 10);
noStroke();
ellipse(varX+210, varY+240, 500, 500);
ellipse(varX+210, varY+240, 400, 400);
ellipse(varX+210, varY+240, 300, 300);


ellipse(varX+210, varY+240, 600, 600);

noStroke();
colorMode(RGB);



}







