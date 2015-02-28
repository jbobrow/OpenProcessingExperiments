
// Pink Ice Cream Inspired Dachshund

//Design Note: Arcs hidden 
//in order to upload to OpenProcessing 

void setup(){
size(600,600);
background(201,214,216);
smooth();
noStroke();
}

void draw(){

//HAT
fill(255);
ellipse(136,170,80,90);

//Tail
//fill(255,196,210);
//arc(560, 290, 210, 120, PI, PI+QUARTER_PI, CHORD);

//LEGS
ellipse(210,360,20,60);
fill(255,121,157);
ellipse(170,350,20,60);
fill(255,196,210);
ellipse(420,360,20,60);
fill(203,249,255);
ellipse(380,350,20,60);

//BODY
fill(255,233,209);
ellipse(210,300,150,120);
fill(255,246,193);
ellipse(400,300,150,120);
fill(255,196,210);
rect(210,240,80,120);
fill(203,249,255);
rect(280,240,10,120);
fill(255,121,157);
rect(290,240,110,120);


//FACE
fill(255,196,210);
ellipse(120,230,120,120);

//EAR
//fill(255,233,209);
//arc(140, 220, 60, 120, 0, PI+QUARTER_PI, CHORD);

//EYE
fill(0);
ellipse(90,210,20,20);

//NOSE
ellipse(65,250,10,10);

//Spots
fill(255);
ellipse(310,270,20,20);
ellipse(375,290,20,20);
ellipse(305,342,20,20);
ellipse(350,320,20,20);
ellipse(375,338,20,20);
ellipse(320,300,20,20);
ellipse(355,260,20,20);

//Hat Front
fill(255);
ellipse(165,190,42,28);
ellipse(100,170,39,25);
ellipse(132,178,50,20);

//CONE
fill(185,151,122);
triangle(110,130,185,20,180,160);
line(110,130,182,60);

}



