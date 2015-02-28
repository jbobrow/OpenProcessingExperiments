
//x and Y is 100,70
float r = 100; 
float g = 150; 
float b = 200; 
float a = 200;
float diamA = 20; 
float diamB = 40; 
float xA = 100; 
float yA = 100; 
float xB = 125; 
float yB = 125;

void setup() {
frameRate(20);
size(200,200);
smooth();
}

void draw() {
background(0);  
ellipseMode(CENTER); 
rectMode(CENTER); 

//body
stroke(0); 
fill(302,27,99); 
ellipse(100,100,28,40); 

//head
fill(302,27,99); 
ellipse(100,70,60,60); 

//hands
fill(150); 
ellipse(93,110,8,8);
ellipse(108,110,8,8);

//nose
fill(0); 
ellipse(100,90,8,4); 

//eyes
fill(0); 
ellipse(90,80,8,16); 
ellipse(110,80,8,16); 
fill(255); 
noStroke();
ellipse(89,77,4,8); 
ellipse(109,77,4,8); 

//feet
fill(302,27,99); 
ellipse(87,122,25,15); 
ellipse(114,122,25,15);

//ears
fill(mouseX,27,mouseY); 
ellipse(81,35,16,32); 
ellipse(119,35,16,32); 
stroke(0);
fill(150);
ellipse(82,45,8,16); 
ellipse(118,45,8,16); 

//tail 
fill(0);
stroke(0);
line(70,100,88,112);
rect(70,100,6,6); 
rect(74,104,6,6); 
rect(76,106,6,6); 
println("I come in peace!");

r = random(255); 
 g = random(255); 
 b = random(255); 
 a = random(255); 
 diamA = random(20); 
 diamB = random(40); 
 xA = random(width); 
 yA = random(height);
 xB = random(width); 
 yB = random(height);
 
 noStroke(); 
 fill(r,g,b,a); 
 ellipse(xA,yA,diamA,diamA);
 rect(xB,yB,diamB,diamB);

}

void mousePressed() {
stroke(0);
fill(255);
rectMode(CENTER);
rect(mouseX,mouseY,50,50);
}

void keyPressed() {
background(255);
}

