
int myX;
int myY;

float xx;
float yy;

void setup()
{
  size(350,350);
}

void draw() {
  background(204);
  
 
int s = second (); //Values from 00-59
int m = minute();  // Values from 00 - 59
int h = hour();    // Values from 00 - 23


  

size(350, 350);
fill(180, 200, 180);
myX=mouseX;
myY=mouseY;


pushMatrix();

xx=xx+(0.5-noise(frameCount/300));
yy=yy+(0.5-noise(frameCount/300));
translate(xx,yy);

rect(0, 0, 100, 110, 24);//body(xytopleft,width,height,edges)
triangle(s+65, -100, 95, -60, 55, -60);//R-Ear
triangle(35-s, -100, 40, -60, 5, -60);//L-Ear
triangle(10, 5, -15, 20, 15, 65);//LWing
triangle(95, 5, 115, 25, 83, 65);//RWing
ellipse(50, -30, 120, 90);//this is the head
fill(230, 230, 230, 100);//belly color
ellipse(50, 62, 65, 75);//belly
fill(240, 250, 240);//eyes
ellipse(77, -35, 55, 55);//R eye
ellipse(27, -35, 55, 55);//L eye
strokeWeight(2);
line(0, -40, 103, -40);//line-eyes
strokeWeight(1);
fill(20, 20, 20);//pupil color
ellipse(myX/14+65, myY/18-35, 8, 8);//R pupil
ellipse(myX/14+15, myY/18-35, 8, 8);//L pupil
fill(250, 200, 200);//mouth color
triangle(50, 12, 60, -13, 40, -13);//mouth
fill(235, 200, 0);//feet color
triangle(125-95, 225-120, 144-95, 250-120, 106-95, 250-120);//Lfoot
triangle(165-95, 225-120, 184-95, 250-120, 146-95, 250-120);//Rfoot


textSize(20);
fill(110, 30, 150);
text(h+":", 115-95, 190-120); 
text(m, 150-95, 190-120);


// bowtie
pushMatrix();
translate(50,20);  
rotate(radians(frameCount*3%360));
fill(90, random(255), 200, 85);//bowtie
quad(-30, 15, -30, -10, 30, 15, 30, -10);

popMatrix();



popMatrix(); 


}









