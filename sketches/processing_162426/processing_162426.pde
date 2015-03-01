
//Variables
int h = 200;

void setup(){
  size(600,400);
  frameRate(40);
  background(255);
}

void draw(){
  drawMonster(width/2,height/2);
}

void drawMonster(int x, int y){
  //head
fill(0);
ellipse(width/2,height/4,400,800);
  //eye 1
strokeWeight(0);
stroke(255);
fill(255);
ellipse(200,100,60,60);
strokeWeight(5);
stroke(0);
line(150,60,250,105);
line(150,120,250,100);
  //eye 2
strokeWeight(0);
stroke(255);
ellipse(400,100,60,60);
strokeWeight(5);
stroke(0);
line(450,60,350,105);
line(450,120,350,100);
  //mouth
strokeWeight(0);
stroke(255);
fill(255);
if(h > 10) {
  h += -10;
}
if (h == 10) { 
  h += 190;
}
ellipse(300,250,500,h);
fill(0);
  //teeth
//upper fangs
//fang 1
strokeWeight(5);
stroke(0);
fill(0);
triangle(190,160,230,150,210,240);
//fang 2
strokeWeight(5);
stroke(0);
fill(0);
triangle(410,160,370,150,390,200);
//lower fangs
//fang 3
strokeWeight(5);
stroke(0);
fill(0);
triangle(218,350,250,350,240,250);
//fang 4
strokeWeight(5);
stroke(0);
fill(0);
triangle(382,350,350,350,360,240);
}
