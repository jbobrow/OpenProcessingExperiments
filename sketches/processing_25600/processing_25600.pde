
void setup() {
  size(300,300);
  background(0);
}


//head
void draw(){
  fill(255,7);
  ellipse(150,150,90,120+mouseY);

//brows
fill(0);
ellipse (130,130,30,5);
ellipse (170,130,30,5);

//eyes
fill(0,0,255);
ellipse(130,140,8,8);
ellipse(170,140,8,8);

//nose
fill(0);
ellipse(145,160,2,2);
ellipse(155,160,2,2);

//mouse
fill(237,30,75);
rect(130,170,40,20);

//thooth
fill(255);
rect(150,170,7,8);
rect(143,170,7,8);

//hair
fill(160,160,0);
triangle(70,150,180,80,90,160);
triangle(60,140,170,70,80,150);
}





