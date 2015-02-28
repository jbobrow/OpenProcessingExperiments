
int x = 560;
int y = 60;
int radius =20;


 
void setup() {  
  size(600,600);
  ellipseMode(RADIUS);
  smooth();
}
 
void draw() {

if(mouseX < 200) {
    background(102,153,153);
  }
  else if ((mouseX>=200) && (mouseX <=400)) {
    background(153,204,204);
  }
  else {
    background(204,255,255);
  }
  
 //----
  float check = dist (x,y,mouseX,mouseY);
  if(check < radius) {
    fill(153,153,204);
    noStroke();
    radius++;
    }else{   fill(0);}
    fill(153,153,204);
    noStroke();
    ellipse(x,y,radius,radius);
    //little cross 
noStroke();
fill(153,153,204);
rect(540, 0, 40, 120);
rect(500,40,100,40);
//----
noFill();
stroke (255,255,153);
strokeWeight (10);
smooth ();
ellipse (560,60,160,160);
//----

//----
//small rect inside circle
noStroke ();
fill(150);
rect (220, 40, 60, 120);
fill(180);
rect (280, 20, 40, 40);
fill(234);
rect (300, 180, 20, 20);
fill(120);
rect (400, 200, 80,140);
fill(186);
rect (460, 180, 40, 100);
fill(179);
rect (540, 320, 60,80);
fill(150);
rect (520, 400, 20, 20);
//----

//---
//circle stroke 
noFill();
stroke (51,51,102);
strokeWeight (40);
smooth ();
ellipse (100, 600, 120,120);

//left figure
noFill();
stroke(51,0,204);
strokeWeight(2);
ellipse (100, 220, 100,100);


//cross & big circle line
noStroke();
fill(80);
rect(0, 320, 440,140);


//rect end

noFill();
stroke (255,204,0);
strokeWeight (20);
smooth ();
ellipse (560,60,390,390);

noStroke();
fill(80);
rect(100, 120, 140, 200);
rect(100, 460, 140, 140);
//---
  


fill(255,255,21);
noStroke();
quad(20, 120, 100, 180, 20, 260, -60, 200);

fill(102,51,153);
rect(20,0,80,120);

//bottom figure
noStroke();
fill(51,102,102);
quad(260,500, 380,420, 420,600, 300,600);

fill(51,204,204);
triangle(380,420, 320,460, 390,460);

fill(0,51,51);
quad(410, 460, 430, 460, 460, 600, 440, 600);

fill(204,255,255);
rect(460, 200, 20, 80); 

//---map color
float mapColorR = map (mouseX, 0, 600, 0, 255 );
float mapColorG = map (mouseY, 0, width, 0, 255);
fill(mapColorR, mapColorG, 0);
rect(100,320,140,140); 

noStroke();
fill(210);
rect(560,160,20,20);
fill(180);
rect(330,0, 60,35);
fill(153);
rect(280,240,110,80 );
fill(200);
rect(330, 210 ,35, 27);


}

void mousePressed () {
  radius = 50;  
}



