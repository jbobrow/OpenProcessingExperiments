

int y=220; //y coordinate
int x=50; //x coordinate

void setup(){
  background(140, 128, 200);
  size(300,300);
  fill(100,200,255);
  stroke(130,130,130);
  noStroke();
for (int y = 0; y <= height; y += 25) {
for (int x = 0; x <= width; x += 25) {
fill(255, 140);
ellipse(x, y, 24, 24);
}
}
  for(int i=0; i<300; i+=15) {
     fill(70,10,131);
    rect (1,1,300, 20);
    fill(70,10,131);
    rect (1,265,300,35);

}
}

void draw(){
  smooth();
  
// Body
fill(100);

triangle(40,10,50,20,60,30);
fill(250,164,96);
ellipse(x+80,x+110,y-120,y-80);
rect(x+50,x,y-135,y-160);
fill(55);
rect(115,120,20,50);
rect(115,160,30,20);
fill(255);
rect(x+100,x+30,y-185,y-200);




//Cloud


fill(119,136,153);
ellipse (45,y,x-15,x-15); //first on the left
ellipse (70,y,x-5,x-5);
ellipse (100,y,x,x);
ellipse (130,y+5,x+10,x+10);
ellipse (155,y+2,x+10,x+10);
ellipse (180,y,x,x);
ellipse (210,y,x-10,x-10); //first on the right



//ear 1
beginShape();
fill(255,69,0);
vertex (126, 63);
vertex (126, 27);
vertex (117, 27);
vertex (126, 39);
endShape();

//ear 2
beginShape();
fill(255,69,0);
vertex (135, 54);
vertex (135, 27);
vertex (126, 27);
vertex (135, 36);
endShape();

//nose
beginShape();
fill(255,0,0);
vertex (189, 63);
vertex (171, 54);
vertex (174, 45);
vertex (188, 45);
endShape();

//eyes
beginShape();
fill(238,245,222);
vertex (135, 72);
vertex (135, 63);
vertex (153, 63);
vertex (144, 72);
vertex (135, 72);
endShape();
fill(255,0,0);
ellipse(148,66,5,5);
}




