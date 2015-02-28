
// original author : lomeiwen
// modified to use function structure
// qgirlvicki@hotmail.com

void setup() {
//setup and background 
size (400,290);
background(245,229,196); 
smooth();
}

void drawManydiffdrdntlines(){
strokeWeight(2);  
line(30,30,30,200);  
strokeWeight(1);  
line(10,40,120,80);  
line(10,90,60,90);  
line(15,100,65,100);  
strokeWeight(1.5);  
line(0,150,30,120);  
line(30,120,230,290); 
}
void draw(){
drawManydiffdrdntlines();
// the first triangle on the left
noStroke();  
fill(171,202,205,100);  
triangle(-125,290,30,120,230,290);
// start draw the arch
noFill();  
stroke(0);  
strokeWeight(7);  
arc(0, 110, 100, 100, 0, PI/2);  

noFill();  

stroke(0);  

strokeWeight(3);  

arc(0, 320, 90, 90, TWO_PI-PI/2, TWO_PI);  

strokeWeight(1);  

line(30,290,200,240);  

   

noFill();  

strokeWeight(2);  

arc(320,160,360,360, PI, TWO_PI-PI/2);  

noFill();  

strokeWeight(1.5);  

arc(260,180,230,240, PI, TWO_PI-PI/2);  

   

fill(149,158,163);  

stroke(148,153,113);  

strokeWeight(2);  

ellipse(280,10,30,30);  

   

fill(211,36,31);  

stroke(100,57,22);  

strokeWeight(2);  

ellipse(240,100,20,20);  

   

   

fill(244,227,175);  

noStroke();  

ellipse(240,200,100,100);  

fill(239,232,216,80);  

stroke(203,190,158);  

strokeWeight(1);  

ellipse(240,200,80,80);  

fill(246,220,226,60);  

stroke(59,57,34);  

strokeWeight(6);  

ellipse(240,200,50,50);  

   

fill(0);  

noStroke();  

quad(220,290,290,230,300,240,230,300);  

   

fill(255);  

stroke(0);  

strokeWeight(1);  

quad(300,250,400,210,405,215,302.5,255);  

fill(129,109,85);  

noStroke();  

quad(280,290,400,235,405,240,290,295);  

fill(65,79,44);  

noStroke();  

quad(330,290,390,180,400,190,330,290);  

stroke(0);  

strokeWeight(2);  

line(330,290,390,180);  

line(390,180,400,190);  

noFill();  

stroke(201,160,130);  

strokeWeight(4);  

arc(400, 300, 60, 45, PI, TWO_PI-PI/2);  

   

fill(237,233,208);  

stroke(140,139,109);  

strokeWeight(1.5);  

ellipse(395,150,30,30);  

   

fill(245,230,220,80);  

stroke(0);  

strokeWeight(3);  

triangle(300,290, 398,15, 490, 290);  

stroke(0);  

strokeWeight(2);  

line(270,70,400,110);  

line(250,30,400,90);  

   

noFill();  

stroke(0);  

strokeWeight(2);  

arc(210, 330, 300, 200, PI, TWO_PI-PI/2); 
}

