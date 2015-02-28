

PImage  img;

void setup () {
  
  size(500, 500);
  img = loadImage("cave.jpg");
  int x =50;
int y =50;
noStroke();
smooth();
  
}

void draw() {
  image(img, 0, 0);
  float easing = 1.00;
float x = 50;
float y = 50;
  if (mousePressed == false) {

//upper mouth
fill(100, 0, 255);
rect(mouseX-30, mouseY+130, x+300, y+100);
//lower mouth
fill(100, 0, 255);
rect(mouseX-30, mouseY+260, x+270, y+50);
//nostril
fill(0, 0, 0);
ellipse(mouseX+10,mouseY+200,x+10,y+50);
//head
fill(100, 0, 255);
rect(mouseX+200,mouseY+50,x+150,y+260);
//eye
fill(255, 255, 255);
ellipse(mouseX+200,mouseY+50,x+100,y+100);
fill(0, 0, 0);
ellipse(mouseX+180,mouseY+50,x+50,y+50);
fill(255, 255, 255);
ellipse(mouseX+180,mouseY+50,x+10,y+10);

//teeth
fill(255, 255, 255);
rect(mouseX+300,mouseY-30,x-20,y+30);
fill(255, 255, 255);
rect(mouseX+350,mouseY-30,x-20,y+30);
fill(255, 255, 255);
rect(mouseX+400,mouseY+100,x-10,y-20);
fill(255, 255, 255);
rect(mouseX+400,mouseY+150,x-10,y-20);
fill(255, 255, 255);
rect(mouseX+400,mouseY+200,x-10,y-20);


//mouth
fill(0, 0, 0);
rect(mouseX-30,mouseY+270,x+200,y-1);
}



if (mousePressed == true) {


//upper mouth
fill(100, 0, 255);
rect(mouseX-30, mouseY+130, x+300, y+100);
//lower mouth
fill(100, 0, 255);
rect(mouseX-30, mouseY+350, x+300, y+10);
//nostril
fill(0, 0, 0);
ellipse(mouseX+10,mouseY+200,x+10,y+50);
//head
fill(100, 0, 255);
rect(mouseX+200,mouseY+50,x+150,y+260);
//eye
fill(255, 255, 255);
ellipse(mouseX+200,mouseY+50,x+100,y+100);
fill(0, 0, 0);
ellipse(mouseX+180,mouseY+50,x+50,y+50);
fill(255, 255, 255);
ellipse(mouseX+180,mouseY+50,x+10,y+10);

//teeth
fill(255, 255, 255);
rect(mouseX+300,mouseY-30,x-20,y+30);
fill(255, 255, 255);
rect(mouseX+350,mouseY-30,x-20,y+30);
fill(255, 255, 255);
rect(mouseX+400,mouseY+100,x-10,y-20);
fill(255, 255, 255);
rect(mouseX+400,mouseY+150,x-10,y-20);
fill(255, 255, 255);
rect(mouseX+400,mouseY+200,x-10,y-20);




fill(255, 100, 255);
rect(mouseX+50,mouseY+310,x+100,y-40);
}
}



