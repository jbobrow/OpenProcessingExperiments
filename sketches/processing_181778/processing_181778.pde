
void setup(){

size(600,600);


}

int midaE = 30;


void draw(){
fill(mouseY-250,0,0);
background(232);
ellipse(mouseX,mouseY,100,mouseY);
fill(random(245),random(245),random(245));
ellipse(mouseX,mouseY,midaE,mouseY/2);


int midaA = 20;

fill(mouseX,mouseY,20);
strokeWeight(3);
line(mouseX-30,mouseY,mouseX-120,210);
ellipse(mouseX-110,210,mouseX/6,mouseY/6);
line(mouseX-50,mouseY,mouseX-120,300);
ellipse(mouseX-110,300,mouseX/6,mouseY/6);
line(mouseX-20,mouseY,mouseX-100,390);
ellipse(mouseX-110,390,mouseX/6,mouseY/6);

line(mouseX+30,mouseY,mouseX+120,210);
ellipse(mouseX+110,210,mouseX/6,mouseY/6);
line(mouseX+50,mouseY,mouseX+120,300);
ellipse(mouseX+110,300,mouseX/6,mouseY/6);
line(mouseX+20,mouseY,mouseX+100,390);
ellipse(mouseX+110,390,mouseX/6,mouseY/6);
}
