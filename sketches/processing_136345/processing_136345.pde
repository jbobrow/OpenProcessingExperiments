
void setup() {
  size(700, 600);
  background(10, 80, 100);
}

void draw() {
   

fill(1,0,2);
ellipse(300,200,300,300);
//head
fill(237,7,10);
ellipse(300,200,50,80);
//ears
fill(2,0,0);
ellipse(153,150,30,160);
ellipse(444,150,30,160);
//ears2
fill(237,14,14);
ellipse(153,150,10,90);
ellipse(445,145,10,90);
//nose
fill(248,241,241);
ellipse(250, 100, 50, 50);
ellipse(300, 100, 50, 50);
ellipse(350, 100, 50, 50);
//eyes
stroke(2,0,0);
fill(244,4,4);
ellipse(300-mouseX/20, 300-mouseY/20, 100, 50);
//mouth
fill(6,0,0);
ellipse(300-mouseX/20, 300-mouseY/20, 120, 20);
//mouth
stroke(0,0,0);
fill(235,12,12);
ellipse(250+mouseX/50,100-mouseY/50,25,25);
ellipse(350+mouseX/50,100-mouseY/50,25,25);
//inner eyes
ellipse(300+mouseX/50,100-mouseY/50,25,25);
ellipse(350+mouseX/50,100-mouseY/50,25,25);
}





