
PFont font;
//syringe
float x;
float y;
float easing = 0.15;
float speed_1=1.5;
//swirl!
float angle=0.0;
float offset=300;
float scalar = 2;
float speed = 4.0; 
//mice
int radius=40;
float z=110;
int direction = 1; //change to random(0,1)?



void setup() {
  size(600,500);
  smooth();
  font = loadFont("FranklinGothic-DemiItalic-48.vlw");
  textFont(font);
  ellipseMode(RADIUS);
}



void draw(){
  background(#006600);
  //mice
  noStroke();
  fill(random(50,200),255,random(100,255));
  rect(z-35,65,70,20);
  ellipse(z+40,77,7,7);
  ellipse(z-35,60,20,20);
  ellipse(z-15,65,10,10);
  ellipse(z-55,60,20,20);
  rect(z-55,55,10,10);
  rect(z-50,55,20,10);
  rect(z-45,55,20,20);
  beginShape();
  bezier(z-80,70,z-110,50,z-130,55,z-140,10);
  bezier(z-140,10,z-130,40,z-110,45,z-80,70);
  bezier(z-80,70,z-70,25,z-50,20,z,60);
  ellipse(z+10,55,20,20);
  bezier(z,60,z+30,50,z+40,65,z+50,80);
  ellipse(z+50,80,10,10);
  bezier(z+50,80,z+30,95,z+10,90,z,85);
  bezier(z,85,z-40,95,z-50,95,z-80,70); 
  endShape(CLOSE);

  if (keyPressed){
   if (key=='a'){
    background(#006600);
    noFill();
    float a = offset + cos(angle) *scalar;
    float b = offset +sin(angle) *scalar;
    strokeWeight(20);
    stroke(random(220),random(50),random(200));
    ellipse(a,b,2,2);
    angle += speed_1;
    scalar += speed_1;
   }    
     }
  
   if (mousePressed ==true){
    background(random(180,260),random(50),0);
    textSize(70);
    fill(#FFFFFF);
    text("OUCH!",200,270);
    
    noFill();
    float a = offset + cos(angle) *scalar;
    float b = offset +sin(angle) *scalar;
    strokeWeight(20);
    stroke(#000000);
    ellipse(a,b,2,2);
    angle += speed_1;
    scalar += speed_1;
     
    noFill();
    stroke(#00FF00);
    ellipse(a+100,b+100,2,2);
    angle += speed_1;
    scalar += speed_1;
    
    noFill();
    stroke(#FFFF33);
    ellipse(a-50,b-200,2,2);
    angle += speed_1;
    scalar += speed_1;
  
  //mice!!
  z += speed * direction;
if ((z >width-radius) || (z < radius)) {
  direction = -direction; //Flip direction
}
if (direction ==1) {
  //ellipse(z,z,radius,radius);
  noStroke();
  fill(random(50,200),255,255);
  rect(z-35,65,70,20);
  ellipse(z+40,77,7,7);
  ellipse(z-35,60,20,20);
  ellipse(z-15,65,10,10);
  ellipse(z-55,60,20,20);
  rect(z-55,55,10,10);
  rect(z-50,55,20,10);
  rect(z-45,55,20,20);
  beginShape();
  bezier(z-80,70,z-110,50,z-130,55,z-140,10);
  bezier(z-140,10,z-130,40,z-110,45,z-80,70);
  bezier(z-80,70,z-70,25,z-50,20,z,60);
  ellipse(z+10,55,20,20);
  bezier(z,60,z+30,50,z+40,65,z+50,80);
  ellipse(z+50,80,10,10);
  bezier(z+50,80,z+30,95,z+10,90,z,85);
  bezier(z,85,z-40,95,z-50,95,z-80,70); //mouse Face Right
  endShape(CLOSE);
  } else {
    noStroke();
    ellipse(z,60,random(1/2*radius,radius),random(1/2*radius,radius));
  } 
   }

  //syringe!
fill(#FFFFFF);
float targetX=mouseX;
float targetY=mouseY;
x += random((targetX-x)*easing);
y += random((targetY-y)*easing);
beginShape();
stroke(#000000);
strokeWeight(2);
vertex(x-100,y-98);
vertex(x-90,y-83);
vertex(x-115,y-60);
vertex(x-105,y-52);
vertex(x-92,y-65);
vertex(x-50,y-20);
vertex(x-30,y-30);
vertex(random(x,x+5),random(y,y+13));  //original x=150, y=170
vertex(x-25,y-35);
vertex(x-12,y-50);
vertex(x-60,y-85);
vertex(x-40,y-92);
vertex(x-42,y-100);
vertex(x-75,y-95);
vertex(x-80,y-102);
vertex(x-65,y-105);
vertex(x-70,y-112);
vertex(x-78,y-120);
vertex(x-120,y-100);
vertex(x-115,y-90);
vertex(x-100,y-98);
endShape();

//not one but many!
scale(1);
translate(300,100);
mouse(0,0);
scale(1);
translate(-200,200);
mouse(0,0);
translate(100,100);
mouse(0,0);
scale(1);
translate(150,-150);
mouse(0,0);
scale(1);
translate(-400,-150);
mouse(0,0);


}

void mouse (int x, int y){
 noStroke();
  fill(random(50,200),255,random(100,255));
  rect(z-35,65,70,20);
  ellipse(z+40,77,7,7);
  ellipse(z-35,60,20,20);
  ellipse(z-15,65,10,10);
  ellipse(z-55,60,20,20);
  rect(z-55,55,10,10);
  rect(z-50,55,20,10);
  rect(z-45,55,20,20);
  beginShape();
  bezier(z-80,70,z-110,50,z-130,55,z-140,10);
  bezier(z-140,10,z-130,40,z-110,45,z-80,70);
  bezier(z-80,70,z-70,25,z-50,20,z,60);
  ellipse(z+10,55,20,20);
  bezier(z,60,z+30,50,z+40,65,z+50,80);
  ellipse(z+50,80,10,10);
  bezier(z+50,80,z+30,95,z+10,90,z,85);
  bezier(z,85,z-40,95,z-50,95,z-80,70); 
  endShape(CLOSE);
   }

