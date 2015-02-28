



/* espiral en movimiento, con retroceso */
 
ball bola;
 
void setup() {
 smooth();
 size(450, 450);

  background(204);


background(0);
 bola = new ball();

}
 
void draw() {


//frameRate(12);

 noStroke();
// rect(width/2,height/2,width,height);
bola.move();
bola.display();
 //ball settings
}



 class ball{

 color a;
 color b;

 // a polar coordinate
float r; // radius value
float theta;
float speed;
float x1;
float y1;
float xp;
float yp;
float ran;
 
ball() {

 b= color (218,222,25);
 a= color (5,240,226);
 r = 10; // radius value
 theta = 1;
 speed = 2;
 x1 = 10;
 y1 = 10;
 xp = r*cos(theta)/20; //add random values to jitter
 yp = r* sin (theta)/20;

}
 
void display(){
 strokeWeight(2);

noFill ();


if (mousePressed==true) {

 float ran = random(1,100); 
fill(6,map(mouseX,0,1200,90,220),29,50); 
triangle(mouseX +20,mouseY+20 , mouseX +20,mouseY - 20, mouseX-20,mouseY+40);
triangle(mouseX -20,mouseY , mouseX -20,mouseY + 40, mouseX+20,mouseY-20);
 

fill(map(mouseX,0,1200,200,5),map(mouseX,0,1200,5,200),100,50);
 

triangle(mouseX,mouseY+10 , mouseX +40,mouseY+10 , mouseX+20,mouseY-20);
triangle(mouseX,mouseY+10 , mouseX +40,mouseY+10 , mouseX+20,mouseY+50);
ellipse(mouseX +xp*-1,mouseY + yp*-1, 15+r, 15+r);

noStroke();

fill(a,20);
//ellipse(mouseX +xp*-1,mouseY + yp*-1, ran+r, ran+r);
fill(b,20); 
ellipse(mouseX +r,mouseY + r, 15+r, 15+r);
}
}
 
void move(){
theta=theta+.1;
r= r+2;
 xp = r*cos(theta);
 yp= r* sin (theta);
if (xp > 400 ) {
xp = 0;
yp=0;
 


}
 
while (r == 20) {
theta =theta *-.1;
r = r*-1;
 
}


 
}

 } 
 


