
int patternSeperationX = 20;
int patternSeperationY = 20;

void setup() {
  size(250,500);
  smooth();

  PImage b;
  b = loadImage("right2.jpg");
  b.resize(250,500);
  background(b);
  
  noStroke();
  fill(255,255,0,80);
    triangle(-460,0,250,0,250,200);
    triangle(0,310,0,500,300,500);
    fill(0,100);
    noStroke();
    triangle(200,200,220,240,230,210);
    triangle(220,240,230,210,250,250);
    triangle(250,250,230,210,250,217);
    triangle(250,195,250,212,230,205);
    strokeWeight(3);
    stroke(0,0,255);
    line(250,400,150,340);
    line(150,340,175,340);
    line(175,340,175,335);
    line(175,335,110,320);
    line(25,300,110,320);
    line(25,280,25,300);
    line(25,280,0,275);
    line(0,250,30,245);
    line(0,235,30,245);
    line(0,180,90,175);
    line(90,175,145,160);
    line(145,160,180,170);
    line(180,170,250,172);
    stroke(45,170,40);
    line(0,435,50,450);
    line(50,450,70,460);
    line(70,460,90,480);
    line(90,480,140,485);
    line(140,485,150,500);
    
    
     for(int i = 0; i < 250/patternSeperationX; i++){
      for(int j = 4; j < 155/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
}
void draw()
{}
void yourFunction(){
 fill(0,80);
 stroke(0,100);
 strokeWeight(1);
  rect(0,random(10,20),random(15,25),random(15,25));
}



