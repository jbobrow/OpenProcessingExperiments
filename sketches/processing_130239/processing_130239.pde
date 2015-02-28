
void setup(){
size(400,800);
background(255);
noStroke();
}

int speed=5;

void draw()
{

rainCloud();



}

//rain
stroke(198,226,255);
strokeWeight(4);
line(width/2,height/2.5,width/2,height);
line(width/2.1,height/2.5,width/2.1,height);
line(width/2.2,height/2.5,width/2.2,height);
line(width/2.3,height/2.5,width/2.3,height);
line(width/2.4,height/2.5,width/2.4,height);
line(width/1.9,height/2.5,width/1.9,height);
line(width/1.95,height/2.5,width/1.95,height);
line(width/1.7,height/2.5,width/1.7,height);
line(width/1.85,height/2.5,width/1.85,height);
line(width/1.65,height/2.5,width/1.65,height);
line(width/3.2,height/2.5,width/3.2,height);
line(width/2.9,height/2.5,width/2.9,height);
line(width/2.77,height/2.5,width/2.77,height);
line(width/1.5,height/2.5,width/1.5,height);

//lightning
noStroke();
fill(255,215,0);

triangle(width/2, height/2.7, width/2, height/2, width/2.4, height/2);
triangle(width/2.01, height/1.7, width/2.01, height/2.15, width/1.74, height/2.15);


stroke(198,226,255);
strokeWeight(4);
line(width/1.85,height/2.5,width/1.85,height);
line(width/1.65,height/2.5,width/1.65,height);
line(width/3.2,height/2.5,width/3.2,height);
line(width/2.9,height/2.5,width/2.9,height);
line(width/2.77,height/2.5,width/2.77,height);
line(width/1.5,height/2.5,width/1.5,height);
line(width/2.3,height/2.5,width/2.3,height);
line(width/2.4,height/2.5,width/2.4,height);

void rainCloud()
{
//cloud
noStroke();
fill(192,192,192);
ellipse(width/2,height/2.5,width/2,width/8);
ellipse(width/2.9,height/2.43,width/4, width/8);
ellipse(width/2,height/2.43,width/4, width/8);
ellipse(width/1.5,height/2.43,width/4, width/8);
ellipse(width/2.6,height/2.6,width/4,width/8);
ellipse(width/3.3,height/2.5,width/4,width/8);
ellipse(width/1.8,height/2.62,width/4,width/8);

}

