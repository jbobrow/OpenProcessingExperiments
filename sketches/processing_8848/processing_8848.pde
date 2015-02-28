
void setup () {
  size(800,800);
  smooth();
  frameRate (10);
}

void draw () {

  background(211,182,36);
  //I don't want outline on the head. 
  noStroke();
  //Monster head
  fill(240,111,146);
  rectMode (CENTER);
  //rect (400,200,300,200);
  rect (mouseX,mouseY,300,200);
  //Monster head 3D
  fill(242,141,175);
  //quad (250,100,350,50,650,50,550,100);
  quad (mouseX-150,mouseY-100,mouseX-50,mouseY-150,mouseX+250,mouseY-150,mouseX+150,mouseY-100);
  fill(201,41,91);
  //quad (550,100,550,300,650,225,650,50);
  quad (mouseX+150,mouseY-100,mouseX+150,mouseY+100,mouseX+250,mouseY+25,mouseX+250,mouseY-150);
  //Monster eye
  fill(mouseY,mouseX,0); //eye color varies by position of mouse
  ellipseMode (CENTER);
  ellipse (480,150,80,mouseY-pmouseY);//hight of eyes varies by movement of mouse
  ellipse (320,150,80,mouseY-pmouseY);//hight of eyes varies by movement of mouse
  //Monster mouth
  fill(mouseX,50,mouseY); //mouth color varies by position of mouse
  rect (400,250,mouseY-pmouseY,20); //width of mouth varies by movement of mouse
  //rect (400,250,200,20);
  //Monster spine
  strokeWeight(10);
  stroke (40,116,48);
  line (400,300,400,600);
  //Monster arm
  line (400,350,250,450);
  line (400,350,550,450);
  //Monster legs
  line (400,600,250,750);
  line (400,600,550,750);

}

void mousePressed() { 
    background(211,182,36);
  //I don't want outline on the head. 
  noStroke();
  //Monster head
  fill(240,111,146);
  rectMode (CENTER);
  //rect (400,200,300,200);
  rect (mouseX,mouseY,300,200);
  //Monster head 3D
  fill(242,141,175);
  //quad (250,100,350,50,650,50,550,100);
  quad (mouseX-150,mouseY-100,mouseX-50,mouseY-150,mouseX+250,mouseY-150,mouseX+150,mouseY-100);
  fill(201,41,91);
  //quad (550,100,550,300,650,225,650,50);
  quad (mouseX+150,mouseY-100,mouseX+150,mouseY+100,mouseX+250,mouseY+25,mouseX+250,mouseY-150);
  //Monster eye
  fill(mouseY,mouseX,0); //eye color varies by position of mouse
  ellipseMode (CENTER);
  ellipse (480,150,80,mouseY-pmouseY);//hight of eyes varies by movement of mouse
  ellipse (320,150,80,mouseY-pmouseY);//hight of eyes varies by movement of mouse
  //Monster mouth
  fill(mouseX,50,mouseY); //mouth color varies by position of mouse
  rect (400,250,mouseY-pmouseY,20); //width of mouth varies by movement of mouse
  //rect (400,250,200,20);
  //Monster spine
  strokeWeight(10);
  stroke (40,116,48);
  line (400,300,400,600);
  //Monster arm
  line (400,350,250,150);
  line (400,350,550,150);
  //Monster legs
  line (400,600,250,600);
  line (400,600,550,600);
  println("hello");
  
}


