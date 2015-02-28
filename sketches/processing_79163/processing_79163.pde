
int x=0;
int y=0;
int speedX=1;
int speedY=2;
int back=-1; 
int above=-1;


void setup() {
size (400,400);
background (255); 
smooth();
x=width/2;
y=height/2;
}



void draw() {
background(255);
stroke(0);
strokeWeight(1);
fill (0,200,100);

x=x+speedX;
y=y+speedY;


rect(x-60,y-10,50,10);//Draws left tenitcal

fill (0,200,100);
rect(x-60,y+10,50,10);//Draws lower left tenitcal

fill (0,200,100);
rect(x+10,y-10,50,10);//Draws right tenitcal

fill (0,200,100);
rect(x+10,y+10,50,10);//Draws lower right tenitcal

fill (250,100,150);
rect(x-5,y+60,15,60);//Draws tail

fill (0,200,100);
rect (x-20,y-40, 40, 100);//Draws body

fill (0,200,100);
ellipse(x, y-90, 120, 120);//Draws head

fill (255,255,0);
ellipse (x,y-95,70,80);// Draws eye

fill (0);
ellipse (x,y-100,40,40);// Draws pupil

fill(255);
ellipse (x+8,y-105,15,15);//Draws pupil shine

if (x>340 || x<60) {
speedX*=back;
} 

if(y>280 || y<150) {
speedY*=above;
} 


}

//mouth appears when mouse is clicked
void mousePressed() {
stroke(0);
fill(200,130,200);
rect(x-5,y-50,12,10);

fill(0);
ellipse(x,y-100,50,50);//makes pupil bigger

fill(255);
ellipse(x+8,y-105,20,20);//adds shine


noStroke();
fill(255);
ellipse(x-10,y-92,18,18);//adds new shine
}

//Hide old pupil when a key is pressed
void keyPressed() {
stroke(255,255,0);
strokeWeight(20);
fill(0);
ellipse(x,y-100,22,22);

//makes the pupil thinner
stroke(0);
strokeWeight(1);
fill(0);
ellipse(x,y-92,10,50);


stroke(0);
strokeWeight(1);
fill(200,0,0);
triangle(x,y-52,x+10,y-40,x-10,y-40);

noStroke();
fill(255);
triangle(x+1,y-42,x-1,y-51,x+2,y-51);


noStroke();
fill(0,200,100);
triangle (x,y-117,x-20,y-145,x+22,y-145); 
}
  
  






