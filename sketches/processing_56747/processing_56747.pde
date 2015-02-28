
// snowman with responses

int x = 250;
int y = 250;
int colour = 0;
int radius = 10;
float r = 100;
float speed = 0.4;
PFont font;



void setup () {
  size (400, 400);
  smooth();
  font = loadFont("CenturyGothic-36.vlw");
  textFont(font);
}


void draw () {
  background (10, 140,180, 125);
  noStroke ();
  
  
  //head and face
  fill(255);
ellipse(x-50, y-70, 20, 20);

fill(0);
ellipse(x-54, y-73, 2, 2);
ellipse(x-46, y-73, 2, 2);
ellipse(x-54, y-66, 1, 1);
ellipse(x-52, y-65, 1, 1);
ellipse(x-50, y-64, 1, 1);
ellipse(x-48, y-65, 1, 1);
ellipse(x-46, y-66, 1, 1);

  
fill(200, 100, 0);
beginShape();
vertex(x-51, y-71);
vertex(x-48, y-68);
vertex(x-59, y-63);
endShape(CLOSE);

//body
fill(255);
ellipse(x-50, y-36, 40, 50);
fill(100, 0, 255);
ellipse(x-50, y-48, 3, 3);
ellipse(x-50, y-35, 3, 3);
ellipse(x-50, y-22, 3, 3);

//arms
stroke(60, 60, 60);
strokeWeight(3);
line(x-32, y-44, x-20, y-51); 
line(x-20, y-51, x-17, y-56);
line(x-20, y-51, x-15, y-48);
line(x-68, y-44, x-80, y-51);
line(x-80, y-51, x-83, y-56);
line(x-80, y-51, x-85, y-48);
noStroke ();

//hat
fill(0);
rect(mouseX, mouseY-20, 14, 14);
rect(mouseX-4, mouseY-5, 22, 4); 
fill(255, 0, 0);
rect(mouseX, mouseY-7, 14, 2);

//text
fill(255);
textSize(20);
text( "Frosty the snowman", 50, 300);

//snow
if (mousePressed) {
    
  fill(255);
r += speed;
ellipse(10, r, radius, radius);
ellipse(50, r-50, radius,radius);
ellipse(100, r, radius,radius);
ellipse(150, r-30, radius,radius);
ellipse(185, r-10, radius,radius);
ellipse(250, r-40, radius,radius);
ellipse(300, r, radius,radius);
ellipse(350, r-50, radius,radius);
ellipse(400, r-20, radius,radius);
ellipse(15, r-200, radius, radius);
ellipse(30, r-140, radius,radius);
ellipse(120, r-110, radius,radius);
ellipse(165, r-120, radius,radius);
ellipse(205, r-160, radius,radius);
ellipse(240, r-70, radius,radius);
ellipse(285, r-90, radius,radius);
ellipse(335, r-170, radius,radius);
ellipse(395, r-190, radius,radius);


if (r> height + radius) {
  r= -radius;
}
}
  
}

