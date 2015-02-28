
int mouseClick = 0;

void setup() {
  size(600,600);
  background(255);
  smooth();
}




void draw () {
 
  
  if (mouseClick==0) {
    drawSomething01 ();
  } else if (mouseClick==1) {
    drawSomething02 ();
  } else if (mouseClick==2) {
    drawSomething03 ();
  }
  
 for (int i=0; i<3; i++) {
    if (mouseClick==i) {
    //noStroke(); 
    
    fill(255,0,0);
    } else {
    fill(255,255,255);
    }
    stroke(5);
    ellipse(160+i*50,120, 30,30);
    
  }
}

void keyPressed() {
  if (key=='1') {
    mouseClick = 0;
  } else if (key=='2') {
    mouseClick = 1;
  } else if (key=='3') {
    mouseClick = 2;
  }
}


void mousePressed() {
  
  for (int i=0; i<3; i++) {
    if ((mouseX>145+i*50) && (mouseX<175+i*50) && (mouseY>105) && (mouseY<135)) {
      mouseClick = i;
    }
  }
  
}

void drawSomething01 () {
  smooth();
fill(0);
triangle(420,80,450,120,390,120);
triangle(580,80,580,320,460,200);
ellipse(360,240,160,160);
ellipse(160,120,60,60);
triangle(60,20,120,140,20,40);
triangle(100,60,120,60,120,100);
quad(305,314,325,322,286,414,261,400);
quad(340,380,380,380,390,560,330,560);
 
smooth();
//stroke(0);
//noFill();
beginShape();
vertex(20,140);
vertex(65,123);
vertex(156,204);
vertex(200,161);
vertex(200,72);
vertex(340,20);
vertex(280,180);
vertex(180,280);
vertex(20,140);
endShape();
 
smooth();
//stroke(0);
//noFill();
beginShape();
vertex(22,362);
vertex(80,312);
vertex(156,364);
vertex(225,292);
vertex(293,325);
vertex(244,420);
vertex(310,462);
vertex(290,590);
vertex(202,515);
vertex(140,640);
vertex(10,510);
vertex(93,426);
vertex(22,362);
 
endShape();

}

void drawSomething02 () {
    smooth();
fill(0);
triangle(420,80,450,120,390,120);
triangle(580,80,580,320,460,200);
ellipse(mouseX,mouseY,160,160);
ellipse(160,120,60,60);
triangle(60,20,120,140,20,40);
triangle(100,60,120,60,120,100);
quad(305,314,325,322,286,414,261,400);
quad(340,380,380,380,390,560,330,560);
 
smooth();
//stroke(0);
//noFill();
beginShape();
vertex(20,140);
vertex(65,123);
vertex(156,204);
vertex(200,161);
vertex(200,72);
vertex(340,20);
vertex(280,180);
vertex(180,280);
vertex(20,140);
endShape();
 
smooth();
//stroke(0);
//noFill();
beginShape();
vertex(22,362);
vertex(80,312);
vertex(156,364);
vertex(225,292);
vertex(293,325);
vertex(244,420);
vertex(310,462);
vertex(290,590);
vertex(202,515);
vertex(140,640);
vertex(10,510);
vertex(93,426);
vertex(22,362);
 
endShape();
  
}



void drawSomething03 () {
noStroke();   
smooth();
fill(255);

ellipse(mouseX,mouseY,160,160);

  
 
}



                
                                
