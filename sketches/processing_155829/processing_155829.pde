
int radius;


void setup (){
background(mouseY,frameCount,frameCount);
size(750,750);
}

void draw(){
  background(mouseX,255/frameCount,frameCount);

fill(random(250),random(250),random(250));

ellipse(500,300,400,425);

fill(3,3,3);
ellipse(500,500,450,350);
ellipse(500,100,300,50);
quad(350,100,650,100,700,250,300,250);

fill(mouseX,100,100);
quad(300,250,700,250,675,300,325,300);
fill(mouseY,44,44);
rect(350,325,120,80);
rect(530,325,120,80);
fill(mouseX,mouseY,252);
rect(360,335,100,60);
rect(540,335,100,60);
fill(frameCount,frameCount,frameCount);
triangle(460,mouseX,490,450,475,510);
triangle(540,mouseX,510,450,525,510);
ellipse(500,mouseX,250,50);
fill(3,3,3);
ellipse(500,mouseY,300,60);
fill(255,200,15);
triangle(350,225,450,225,400,165);
triangle(550,225,650,225,600,165);
}






