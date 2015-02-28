
// RECTANGLE

//(x,y) define the higher-left corner
int x = 15;
int y = 116;
// width and height of the rectangle
int w = 370;
int h = 270;

//adjust the curve of the corner(should be less than min(w,h)/2)
int c = 30;


void setup(){
size(400, 400);
background(255);
noStroke();
}

void draw(){
  
 fill(100);
 ellipse(200, 110, 180, 80);

 //rect 
 fill(100);
 noStroke();
 beginShape();
 
 vertex(x, y+c);
 bezierVertex(x, y, x, y, x+c, y);
 
 vertex(x+w-c, y);
 bezierVertex(x+w, y, x+w, y, x+w, y+c);
 
 vertex(x+w, y+h-c);
 bezierVertex(x+w, y+h, x+w, y+h, x+w-c, y+h);
 
 vertex(x+c, y+h);
 bezierVertex(x, y+h, x, y+h, x, y+h-c);
 vertex(x, y+c);
 
 endShape();

// white line up tv box
fill(255);
rect(70, 113, 350, 3);

// inside tv lines
fill(255);
rect(35, 134, 35, 235);

fill(250,226,8);
rect(70, 134, 35, 235);

fill(57,212,216);
rect(105, 134, 35, 235);

fill(41,227,104);
rect(140, 134, 35, 235);

fill(216,20,216);
rect(175, 134, 35, 235);

fill(242,2,30);
rect(210, 134, 35, 235);

fill(38,54,152);
rect(245, 134, 35, 235);

fill(0);
rect(280, 134, 35, 235);


fill(255);
ellipse(350,160,40,40);
ellipse(350,210,40,40);
ellipse(350,260,40,40);

// botones tv linea
fill(255);
rect(325, 315, 50, 13);

fill(255);
rect(325, 335, 50, 13);

fill(255);
rect(325, 355, 50, 13);

// tv anthena
stroke(100);
strokeWeight(3);
line(150,20,180,70);

stroke(100);
strokeWeight(3);
line(250,20,220,70);

fill(100);
ellipse(150,20,10,10);
ellipse(250,20,10,10);

}






