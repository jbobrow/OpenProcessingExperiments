
void setup() {
size(1000,1000);
}
void draw() {  
background(255);
fill(200,150,100,200);
ellipse(500,500,500,500); //FACE
fill(255);
ellipse(400,450,100,300); //LEFT EYE
ellipse(600,450,100,300); //RIGHT EYE
fill(200,150,100,200);
noFill();
arc(600,600,100,200,0,HALF_PI); //MOUTH
ellipse(480,600,25,25); //LEFT NOSTRIL
ellipse(520,600,25,25); //RIGHT NOSTRIL
fill(0);
ellipse(600,480,50,50); //LEFT RETNA
fill(0);
ellipse(400,480,50,50); //RIGHT RETNA
}


