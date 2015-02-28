
//project1 zoog
//interactive zoog moves around with mouse position
//to clear background click mouse(green b/g) or press key (pink b/g)

void setup () {
//myZoog
size(400,400);
smooth();
frameRate(30);
}

void mousePressed() {
    background(0,200,150);
}
void keyPressed() {
background(255,100,165);
  }

void draw () {
 
  
//ears
fill(120);
stroke(120);
ellipse(mouseX-40,mouseY-155,25,25);
ellipse(mouseX+40,mouseY-155,25,25);
//feet
fill(0);
stroke(0);
ellipse(mouseX-40,mouseY+85,30,30);
ellipse(mouseX+40,mouseY+85,30,30);
//hands
ellipse(mouseX-75,mouseY,40,30);
ellipse(mouseX+75,mouseY,40,30);
//body
fill(120);
stroke(120);
ellipse(mouseX,mouseY,155,165);
fill(pmouseX,pmouseY);
stroke(255);
ellipse(mouseX,mouseY,120,150);
//head
fill(255);
stroke(150);
ellipse(mouseX,mouseY-90,150,120);
//eyes
fill(mouseX,mouseY);
stroke(0);
ellipse(mouseX+30,mouseY-95,15,22);
ellipse(mouseX-30,mouseY-95,15,22);
fill(100,212,255);
stroke(255);
ellipse(mouseX+30,mouseY-95,7,8);
ellipse(mouseX-30,mouseY-95,7,8);
//nose
stroke(0);
fill(252,255,100);
ellipse(mouseX,mouseY-85,20,15);
//draw mouth
stroke(246,192,247);
fill(246,192,247);
ellipse(mouseX,mouseY-60,35,5);

println("hello!!!!!");

}



