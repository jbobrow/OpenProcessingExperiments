
//SOMA2607: Week 2 Homework_HW Project
//tutorial group: Fri 2-5pm
//z3430312,DongniLi


//position
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;


void setup() {
  size(500,500);
  background(0);
  smooth();
  noStroke(); 
}


void draw() {
    stroke(random(0,255),random(0,255),random(0,255),random(0,63));
    fill(random(0,255),random(0,255),random(0,255),random(0,63));
    strokeWeight(1);
    
    //line
    line(mouseX,mouseY,random(0,255),random(0,255));
    
    
    //triangle
    triangle(x1,y1,x2,y2,x3,y3);
    x1 = int(random(mouseX-50, mouseX-50));
    y1 = int(random(mouseY-50,mouseY+30));
    x2 = int(random(mouseX-50, mouseX+30));
    y2 = int(random(mouseY-50,mouseY+30));
    x3 = int(random(mouseX-50, mouseX+30));
    y3 = int(random(mouseY-50,mouseY+30));  
}


void mousePressed() {
    background(0);  
}



