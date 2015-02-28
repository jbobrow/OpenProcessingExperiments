
void setup() {
 
  size(600,600); 
  noStroke();
  background(219,189,252); 
 
  smooth();
}
 
void draw() {

  noStroke();
 
  float mapColorR = map(mouseX, 0, 600, 0, 240);
  float mapColorB = map(mouseY, 0, width, 0, 255);
  fill(mapColorR,0, mapColorB);
  rect(0, 0, width, height);
 
  for (int y=0; y <= height; y +=40) { 
 
    for (int x= 0; x <= width; x +=40) { 
 
      fill (186,262,135,144); 
 
      ellipse(x,y,10,10);
    }
  } 
  
  smooth();
  fill(255,116,118);
  rect(105, 55, 100, 100);
  ellipse(60, 60,200, 200); 
  fill(255,90,162);
  beginShape();
  vertex(145,255);
  vertex(500,0);
  vertex(600,0);
  vertex(600,100);
  vertex(201,312);
  vertex(145,255);
  endShape();

  quad(80,320,120,280,140,300,100,340);
  quad(120,360,180,300,300,440,240,500);
   
  fill(147,22,76);
 
  quad(60,360,340,600,300,600,40,380);

  fill(77,6,37);
  stroke(175);
  quad(540,60,580,80,480,248,440,220);
 
 
  fill(49,5,31);
  stroke(75);
  rect(420,100,25,90);
 
  fill(242,54,120);
  strokeWeight(2);
  vertex(320,520);
  vertex(260,600);
  vertex(160,600);
  vertex(0,480);
  endShape();

  stroke(20);
  fill(227,94,203);
  line(100,100,300,300);

 
  fill(126,13,106);
  strokeWeight(0);
  quad(60,0,100,0,440,340,420,360);

  beginShape();
  fill(250,154,199);
  strokeWeight(4);
  stroke(200);
  vertex(400,300);
  vertex(400,300);
  vertex(400,400);
  vertex(500,400);
  vertex(400,500);
  vertex(400,600);
  vertex(300,600);
  vertex(300,500);
  vertex(200,500);
  vertex(200,400);
  vertex(300,400);
  vertex(300,300);
 
  endShape();

    
  ellipse(300,200,40,40);
  if(mousePressed == true) { 
 
    fill(800,46,240); 
    for (int x = 300; x <= width-10; x += 50) { 
 
      for (int y = 200; y <= height-10; y += 50) { 
 
 
 
        ellipse(x,y,20,20);
      }
    }
  } 
 
 
 
  int x = 20;
  int y = 40;
  int w =80;
  int h = 40;
 
 
  if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
    fill(154,96,250);
  }
  else {
    fill(255,116,118);
  }
  rect(x, y, w, h);
 
 
 int radius = 20;
 
 
  ellipseMode(RADIUS);
 
  float d = dist(width/2, height/2,mouseX, mouseY);
  fill(204,103,255);
 
  if ( d < radius) {
    fill(247,179,75);
    radius++;
  } 
  else if (mousePressed && (d > radius) && (radius > 20)) {
    fill(66,195,252);
    radius--;
    println(radius);
  }
  ellipse(width/2, height/2, radius, radius);
 
int a = 20;
int b = 100;
int c = 80;
int t = 40;
 
 
 
  if((mouseX > a) && (mouseX < a + c) && (mouseY > b) && (mouseY < b+ t)) {
    fill(154,96,250);
  }
  else {
    fill(255,116,118);
  }
  rect(a, b, c, t);
}


