
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

rect(95, 120, 100, 110, 24);//body(xytopleft,width,height,edges)
triangle(s+160, 20, 190, 60, 150, 60);//R-Ear
triangle(130-s, 20, 135, 60, 100, 60);//L-Ear
triangle(105, 125, 80, 140, 110, 185);//LWing
triangle(190, 125, 210, 145, 178, 185);//RWing
ellipse(145, 90, 120, 90);//this is the head
fill(230, 230, 230, 100);//belly color
ellipse(145, 182, 65, 75);//belly
fill(240, 250, 240);//eyes
ellipse(172, 85, 55, 55);//R eye
ellipse(122, 85, 55, 55);//L eye
strokeWeight(2);
line(95, 80, 198, 80);//line-eyes
strokeWeight(1);
fill(20, 20, 20);//pupils
ellipse(myX/14+160, myY/18+85, 8, 8);//R pupil
ellipse(myX/14+110, myY/18+85, 8, 8);//L pupil
fill(250, 200, 200);//mouth color
triangle(145, 132, 155, 107, 135, 107);//mouth
fill(235, 200, 0);//feet color
triangle(125, 225, 144, 250, 106, 250);//Lfoot
triangle(165, 225, 184, 250, 146, 250);//Rfoot


textSize(20);
fill(110, 30, 150);
text(h+":", 115, 190); 
text(m, 150, 190);


// bowtie
float x=random(255);
fill(90, random(255), 200);//bowtie
translate(145,142);
quad(-35, 15, -35, -10, 35, 15, 35, -10);





popMatrix(); 


}









