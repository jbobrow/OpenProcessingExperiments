
int x;
int y;
void setup() {
size (300,300);
background(255);
}

void draw() {
}

void mouseClicked(){

x=mouseX;
y=mouseY;

for(int y=mouseY; y<-80; y-=25){
line(x,y,x+30,y-20);
line(x,y,x-30,y-20);
ellipse(x-30,y-20,5,5);
ellipse(x+30,y-20,5,5);
}

//antenna
stroke(165,237,210);
strokeWeight(1.5);
line(x,y,x,y-80);

//top branches
line(x,y-80,x+15,y-90);
line(x,y-80,x-15,y-90);

//middle branches
line(x,y-60,x+20,y-75);
line(x,y-60,x-20,y-75);

//bottom branches
line(x,y-40,x+25,y-60);
line(x,y-40,x-25,y-60);


noStroke();
fill(32,194,201);
 
ellipseMode(CENTER);
//head
ellipse(x,y,72,50);

fill(32,194,201);
//left curve
bezier(x-36,y,x-36,y+50,x-21,y+72,x,y+72);
//right curve
bezier(x+36,y,x+36,y+50,x+21,y+72,x,y+72);

fill(232,247,67);
//eye
ellipse(x,y-10,15,15);


fill(165,237,210);
//triangle body
triangle(x,y+72, x-36,y,x+36,y);

fill(232,247,67);
//antenna big circle 
ellipse(x,y-100,15,15);

ellipse(x,y-120,7,7);

fill(232,247,67,90);
ellipseMode(CORNER);
ellipse(x-34,y-5,-50,10);
ellipse(x+34,y-5,50,10);

fill(232,247,67,90);
bezier(x-33,y,x-45,y+2,x-70,y+48,x-48,y+66);
bezier(x+33,y,x+45,y+2,x+70,y+48,x+48,y+66);
 
  
}


