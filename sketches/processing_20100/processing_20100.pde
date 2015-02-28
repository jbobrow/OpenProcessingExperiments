
//background
void setup() {
noStroke();
size(800,700);
smooth();
colorMode(RGB,400);
for (int i=0; i < 800; i++) {
  for (int j=0; j < 800; j++) {
    stroke(j, j, 20);
    point(i, j);
  }
}


//grass
strokeWeight(1.5);
for(int i=0; i<800; i++) {
  float o = random(80);
  stroke(#333366);
  strokeWeight(2);
  line(i*2, 700,i*2, 480+o);
}
for(int i=0; i<800; i++) {
  float o = random(100);
  stroke(#9933FF);
  strokeWeight(1);
  line(i, 800,i, 600+o);
}

//translation experiment
stroke(0);
strokeWeight(0);
noFill(); //CHANGE THIS!!!!!
translate(10, 10);
rect(0, 0, 55, 55);
translate(20,20);
rect(0, 0, 55, 55);
translate(30,30);
rect(0, 0, 55, 55);
translate(50,50);
rect(0, 0, 55, 55);


}

//background 800 x 700
void draw(){
  smooth();
  scale(1);
  translate(260,100);
  squirrel(650,100,217);
  scale(0.7);
  translate(-350,200);
  squirrel(650,100,300);
  scale(0.6);
  rotate(TWO_PI/6);
  translate(-200,-900);
  squirrel(650,100,105);
  scale(.7);
  translate(1800,-850);
  rotate(TWO_PI/3);
  squirrel(650,100,200);
   
}


void squirrel(int x, int y, int z) {
//tail
smooth();
beginShape();
noFill();
strokeWeight(2);
stroke(#FFCC33);
bezier(100,450,random(-150,200),random(100,270),random(0,150),random(190,210),260,0);
stroke(#FFFFFF);
bezier(100,450,random(-50,150), random(100,270), random(30,120),random(190,210),270,0);
noFill();
stroke(#666633);
strokeWeight(1);
bezier(100,450,random(0,250),random(100,270),random(180,230),random(190,210),270,0);
stroke(#006633,200); 
strokeWeight(2);
bezier(100,450,random(-80,310),random(100,260),random(30,250),random(180,210),
270,10);
stroke(#FFCC99);
bezier(100,450,random(-150,300),random(100,270),random(0,280),random(190,210),270,10);
endShape(CLOSE);



//hind leg
fill(#669933);
stroke(#669933);
bezier(250,530,100,490,120,400,300,360);
bezier(250,530,300,500,430,400,300,360);
bezier(200,510,400,490,430,540,200,510);

//hind ear
fill(#336633);
stroke(#336633);
ellipse(330,150,40,80);


//hind arm
fill(#336633,800);
stroke(#335533,100);
bezier(400,400,150,100,200,250,400,400);
bezier(400,400,450,300,470,330,400,400);

//acorn
fill(#669999);
stroke(#669999);
ellipse(360,390,70,80);

//hind fingers
fill(#336633,800);
stroke(#335533,100);
ellipse(420,340,40,10);
ellipse(420,350,40,20);
ellipse(420,360,40,10);
ellipse(435,335,20,20);

//body
stroke(#996633);
strokeWeight(3);
smooth();
fill(#996633,800);
bezier(270,140, 420,120,410,300, 380,350);
bezier(270,140,250,140,220,160,210,220);
bezier(210,220,110,270,20,400,120,500);
bezier(120,500,200,480,300,500,330,350);
bezier(330,350,350,360,360,370,380,350);
triangle (380,350,330,350,270,140);
triangle(270,140,330,350,210,220);
triangle(210,220,330,350,120,500);

//acorn2
fill(#336666,800);
stroke(#336666,500);
ellipse(360,370,100,40);

//front ear
fill(#996633,800);
stroke(#996633);
ellipse(250,150,40,80);
fill(#663300);
bezier(240,170,245,120,250,130,260,150);


//front leg
beginShape();
fill(#CC9933);
stroke(#CC9933);
bezier(120,530,100,490,120,400,200,350);
bezier(120,530,300,500,430,400,200,350);
bezier(120,530,350,490,380,550,120,530);
endShape();

//nose
fill(#663300);
stroke(#663300);
strokeWeight(3);
stroke(#663300,100);
arc(360,350,50,50,PI,TWO_PI);
arc(360,350, 50, 50, 0, PI/2);

//face(shade)
fill(#663300,200);
bezier(360,370,350,350,320,370,240,300);

//front arm
fill(#CC6600);
stroke(#CC6600);
bezier(260,400,140,120,200,400,260,400);
bezier(250,400,350,300,420,330,260,400);
//fingers (front)
ellipse(340,350,40,10);
ellipse(340,360,40,20);
ellipse(340,370,40,10);
ellipse(320,340,20,20);


//eye
fill(#FFFFCC);
strokeWeight(0);
ellipse(300,250,50,50);
fill(#000000,700);
ellipse(295,247,38,38);
fill(#FFFFFF);
ellipse(290,242,10,10);

//wing
stroke(#000000);
strokeWeight(5);
fill(#000000);
line(290,150,315,30);
bezier(315,30,400,100,420,-10,315,30);
bezier(315,30,280,50,250,-100,315,30);
bezier(315,30,230,160,200,10, 315,30);
bezier(315,30,320, 170,400, 70,315,30);

}







