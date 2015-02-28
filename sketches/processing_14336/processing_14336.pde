

float x;
float y;
float px;
float py;
float easing = 0.04;
 

void setup() {
  size(600,600);
  smooth();
}

void draw() { 
   
 
  float mapColorG =  map(mouseX, 0, 600, 0,230);  
   float mapColorB =  map(mouseX, 0, 600, 0, 200);  
   fill(0, mapColorG, mapColorB);  
  rect(0, 0, width, height); // Black line
  
 fill(249,229,115);
 stroke(249,229,115);
  ellipse(mouseX, mouseY, 100,100);
   
  
float targetX = mouseX;
 x += (targetX - x) * easing;
 float targetY = mouseY;
  y += (targetY - y)* easing;
  float weight = dist(x, y, px, py);
   stroke(249,0,115);
  strokeWeight(30);
  line(x,y,px,py);
  py = y;
  px = x;

  

strokeWeight(2);  

fill(150);  
stroke(0);  
beginShape();  
vertex(180,260);  
vertex(220,220);  
vertex(300,320);  
vertex(450,370);  
vertex(400,400);  
vertex(300,400);  
vertex(240,500);  
vertex(200,400);  
vertex(160,340);  
vertex(180,340);  
vertex(180,260);  
endShape();  
fill(200);  
stroke(0);  
quad(180,120,250,190,180,260,100,200);  
quad(280,160,360,260,300,320,220,220);  
fill(0);  
quad(300,400,500,480,300,520,240,500);  
fill(200);  
beginShape();  
vertex(300,400);  
vertex(400,400);  
vertex(500,340);  
vertex(540,400);  
vertex(500,480);  
vertex(300,400);  
endShape();  
fill(200);  
triangle(500,100,580,260,340,260);  
fill(150);  
triangle(500,160,580,340,400,260);  
fill(0);  
triangle(380,280,480,380,300,320);  
fill(200);  
triangle(420,280,500,220,460,400);  
fill(0);  
triangle(440,260,560,300,500,400);  
triangle(540,360,580,360,540,400);  
triangle(540,400,580,400,580,460);  
fill(0);  
triangle(180,120,280,160,250,190);  
fill(255);  

beginShape();
vertex(100,200);  
vertex(180,260);  
vertex(140,260);  
vertex(100,300);  
vertex(80,260);  
vertex(100,200);  
endShape();

beginShape();  
vertex(140,320);  
vertex(160,320);  
vertex(180,260);  
vertex(180,340);  
vertex(160,340);  
vertex(140,320);  
endShape();  
rect(340,480,20,100);  
fill(150);  
ellipse(340,500,80,80);  
ellipse(420,500,40,40);  
ellipse(360,260,80,80);  
fill(0);  
ellipse(380,220,40,40);  

fill(255);  
rect(420,520,20,60);  

fill(0);  
ellipse(100,340,40,40);  
if (mousePressed){
  if(mouseButton == LEFT){
    fill(250,0,0);
  }
  else{
    fill(0);
  }
  ellipse(100,340,40,40);
}
fill(255);  
ellipse(120,420,40,40);  

if (mousePressed){
  if(mouseButton == LEFT){
    fill(0,240,50);
  }
  else{
    fill(255);
  }
  ellipse(120,420,40,40);
}

fill(0);  
ellipse(50,430,20,20);
if (mousePressed){
  if(mouseButton == LEFT){
    fill(198,30,198);
  }
  else{
    fill(0);
  }
  ellipse(50,430,20,20);
}


fill(150);  
ellipse(80,520,40,40);  
if (mousePressed){
  if(mouseButton == LEFT){
    fill(249,144,98);
  }
  else{
    fill(150);
  }
  ellipse(80,520,40,40);
}

fill(0);  
quad(220,200,260,240,220,280,180,240);  
fill(255);  
ellipse(200,200,40,40);  
fill(0);  
triangle(160,340,240,280,200,400);  
fill(200);  
ellipse(220,280,40,40);  
fill(0);  
triangle(120,220,120,240,100,240);  
triangle(200,180,200,200,180,200);  
fill(255);  
triangle(300,580,340,560,360,580);
triangle(360,560,380,580,360,580);  
triangle(320,580,340,580,320,600);  
triangle(400,560,440,560,400,600);  
triangle(420,580,440,600,420,600);  
triangle(440,560,460,580,440,580);  
fill(200);  
triangle(240,360,340,360,280,460);  
fill(150);  
triangle(280,40,280,100,220,100);  
fill(0);  
triangle(240,80,240,120,200,120);  
triangle(320,20,320,80,260,80);  
line(200,220,220,200);  
line(200,260,220,280);  
line(220,280,240,260);  
line(160,340,240,280);  
line(240,500,300,400);  
line(300,400,500,480);  
line(300,400,400,400);  
stroke(255);  
line(220,100,240,100);  
line(280,80,280,60);  
line(190,250,230,210);  
line(220,220,246,252);  
stroke(0);  
line(360,260,280,160);  
line(300,320,360,260);  
line(400,200,340,260);  
line(340,260,400,200);  
line(340,260,400,260);  
stroke(255);  
line(395,208,365,235);  
stroke(0);  
line(400,260,445,260);  
line(490,260,580,260);  
line(400,260,580,340);  
line(340,560,340,480);  
line(340,480,360,480);  
line(360,480,360,560);   
line(340,560,340,580);  
line(420,560,420,580); 
}

