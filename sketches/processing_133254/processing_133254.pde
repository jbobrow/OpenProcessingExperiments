
// Pink Ice Cream Inspired Dachshund 

/* Credits 
Processing Forum "Rollover to change shape" 
Screen name:amnon.owed 
Modified code provided in order to demonstarte changes:
Spots switch between new and old size
some body parts switch between new and old color.*/

// Global Variables 
 int p= 255;
 int n= 196;
 int k= 210;
 //Main Color Pink = p,n,k 

 int a= 10; //SPOTS 
 int w= 255; //SPOTS COLOR

 
 
void setup() {
size(600,600);
background(201,214,216);
smooth();
noStroke();
}

void draw() {
  
//HAT
fill(255);
ellipse(136,170,80,90);

//Tail
//fill(p,n,k);
//arc(560, 290, 210, 120, PI, PI+QUARTER_PI, CHORD);

//LEGS
fill(255);
ellipse(210,360,20,60);
fill(255,121,157);
ellipse(170,350,20,60);
fill(p,n,k);
ellipse(420,360,20,60);
fill(203,249,255);
ellipse(380,350,20,60);

//BODY
if (mouseX > 210 && mouseX < 290 && mouseY > 240 && mouseY < 360) {
  n= 237;
  k= 241;
} else {
  n= 196;
  k= 210;
} //Change body color
fill(255,233,209);
ellipse(210,300,150,120);
fill(255,246,193);
ellipse(400,300,150,120);
fill(p,n,k);
rect(210,240,80,120);
fill(203,249,255);
rect(280,240,10,120);
fill(255,121,157);
rect(290,240,110,120);


//FACE
fill(p,n,k);
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
fill(w,255,w);
if (mouseX > 300 && mouseX < 400 && mouseY > 250 && mouseY < 350) {
  a= 20;
} else {
  a= 10;
} //Change spot size

ellipse(310,270,a,a);
ellipse(375,290,a,a);
ellipse(305,342,a,a);
ellipse(350,320,a,a);
ellipse(375,338,a,a);
ellipse(320,300,a,a);
ellipse(355,260,a,a);

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

//Make Spots Green
void mouseClicked() {
  if (w == 0) {
    w= 255;
  } else {
    w= 216;
  }
}
//Make Spots White with Key
void keyPressed() {
  if (w == 0) {
    w = 216;
  } else {
    w = 255;
  }
}



