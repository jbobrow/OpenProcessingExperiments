
int maVariable;

void setup() {
  size(500,500);
  maVariable=10;
}

void draw() {


  background(255,100,0);

  stroke(255,0,0);
  strokeWeight(90);
  line(0,0,0,0);
  strokeWeight(20);
  line(50,0,0,50);
  strokeWeight(5);
  line(60,0,0,60); 
  strokeWeight(10);
  line(100,0,0,100); 
  line(125,0,0,125);
  strokeWeight(3); 
  line(150,0,0,150); 
  line(170,0,0,170); 

  strokeWeight(6);
  line(0,500,500,400); 
  line(170,500,500,425); 
  strokeWeight(3); 
  line(250,500,500,440);  
  line(300,500,500,460);  
  line(350,500,500,470);  
  strokeWeight(1);
  line(400,500,500,480);
  strokeWeight(15);
  line(400,505,500,485);
  strokeWeight(15);
  line(400,505,500,500);

  noStroke();
  fill(255,222,0,100);
  rect(250,250,100,100);
  fill(255,222,0,150);
  rect(230,270,100,100);
  fill(255,222,0,200);
  rect(210,290,100,100);

  noFill();
  strokeWeight(3);
  stroke(0,30,255);
  ellipse(450,200,200,200);
  ellipse(430,180,185,185);
  ellipse(410,160,170,170);
  ellipse(390,140,155,155);
  ellipse(370,120,140,140);
  ellipse(350,100,125,125);
  ellipse(330,80,110,110);
  ellipse(315,60,95,95);
  ellipse(300,40,80,80);
  ellipse(285,20,65,65);


  if (mousePressed==true) {

    fill(random(255),random(255),random(255));
    noStroke();
    beginShape();
    vertex(100,300);
    vertex(115,330);
    vertex(150,330);
    vertex(120,355);
    vertex(140,390);
    vertex(100,370);
    vertex(65,390);
    vertex(80,355);
    vertex(50,330);
    vertex(85,330);
    vertex(100,300);
    endShape();

    ellipse(100,280,20,20);
    ellipse(170,330,20,20);
    ellipse(150,400,20,20);
    ellipse(55,400,20,20);
    ellipse(30,325,20,20);
  }


  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,maVariable,maVariable);
}
void mousePressed() {
  if (mouseButton==LEFT) {
    maVariable = maVariable+10 ;
    noFill();
    stroke(0,255,36);
    rect(450,450,20,40);
    rect(450,430,30,50);
    rect(450,410,40,60);
  }

  if(mouseButton==RIGHT) {
    maVariable = maVariable-10 ;
    noStroke();
    fill(0,255,252);
    ellipse(200,20,30,30);
    ellipse(250,20,30,30);
    ellipse(300,20,30,30);
    ellipse(350,20,30,30);
    ellipse(400,20,30,30);
  }
}


