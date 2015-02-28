
void setup(){

size(200,200);

}

void draw(){
int x=100;
int y=125;
int m=mouseY;
background(100,20,255);
noStroke();
fill(255,255,255);
ellipse(100,125,50,50);

fill(100,20,255);
rect(0,0,200,mouseX);

fill(255,255,255);
ellipse(x,y,mouseX,mouseX-x);

fill(100,20,255);
rect(0,0,200,mouseX);

fill(255,255,255);
ellipse(x,y-30,35,35);

fill(100,20,255);
rect(0,0,200,mouseX);

fill(255,255,255); 
ellipse(x,y-50,20,20);

fill(100,20,255);
rect(0,0,200,mouseX);

//sun
fill(205,255,10); 
ellipse(mouseX,mouseY,30,30);

//ground
fill(100,mouseX,50);
rect(0,125,200,200);
}

//flowers
void mousePressed(){
fill(11,85,50);
rect(50,100,3,25);


}

