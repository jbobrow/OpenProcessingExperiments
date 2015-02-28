
void setup(){
  size(400,400);
}
void draw(){
strokeWeight(5);
ellipseMode(CENTER);
rectMode(CENTER);
if (mousePressed){  
  background(255, 0, 0);
 }
else{
background(0,0,255);
}


//ears
fill(89, 67, 49);
ellipse(100, 200, 50, 75);
ellipse(300, 200, 50, 75);
//face
fill(89, 67, 49);
ellipse(200, 200, 200, 200);
//hat
noStroke();
fill(75,0,100);
quad(100,75,125,135,175,135,150,50);
quad(300,75,275,135,225,135,250,50);
quad(145,50,170,125,235,125,250,50);
stroke(0, 0, 0);
fill(0, 0, 0);
bezier(275, 135, 253, 150, 200, 175, 125, 135);
line(100, 75, 125, 135);
line(300, 75, 275, 135);
line(100, 75, 150, 50);
line(300, 75, 250, 50);
line(250, 50, 150, 50);
line(185,70,220,70);
bezier(275, 135, 253, 125, 200, 100, 125, 135);
fill(255, 255, 0);
bezier(222, 72, 230, 125, 178, 121, 185, 72);
//eyes
fill(255, 255, 255);
ellipse(150, 180, 40, 40);
ellipse(250, 180, 40, 40);
fill(0, 0, 0);
ellipse(150, 180, 25, 25);
ellipse(250, 180, 25, 25);
//nose
fill(89, 67, 49);
ellipse(200, 224, 75, 51);
//mouth
noFill();
bezier(210, 272, 224, 288, 247, 270, 255, 248);
}
