



Kitty myKitty;

void setup() {
  size(600,600);
   background(255,0,145);
  myKitty = new Kitty(0,0);


  smooth();
  
}

void draw() {
  
   

 
  myKitty.move();
  myKitty.display();
  

}

class Kitty { 
  color c;
 
  float kittysize;
  float x;
  float y;
  float speed;
  int colorstep; 

  Kitty(float tempXpos, float tempYpos) { 
    c = 0;
    
    kittysize = 10.;

    speed =40; 
    colorstep = 50;
  }

  void display() {
  noStroke();
  

//ear
fill(255,c);//徒顏色
beginShape();//三點組成三角形
vertex(mouseX-180,mouseY-50);
vertex(mouseX-120,mouseY-20);
vertex(mouseX-160,mouseY+15);
endShape(CLOSE);



//ear
fill(255,c);
beginShape();
vertex(mouseX-25,mouseY-20);
vertex(mouseX+40,mouseY-50);
vertex(mouseX+22,mouseY+15);
endShape(CLOSE);
//face
fill(255,255,255,c);
ellipse(mouseX-70,mouseY+50,200,160);


//nose
fill(255,252,0,c);
ellipse(mouseX-70,mouseY+80,20,15);
//butterfly circle

fill(random(234,255),random(255),0);
ellipse(mouseX+30,mouseY+15,70,70);
 
if(mousePressed) fill(0,random(0,240),random(204,255));
else fill(random(234,255),random(255),0);
ellipse(mouseX-30,mouseY-20,70,70);
 
if(mousePressed) fill(random(0,255),255,random(0,255));
else fill(random(234,255),random(255),0);
 
ellipse(mouseX,mouseY,30,30);


//eyes
fill(0,0,0,c);
ellipse(mouseX-120,mouseY+65,20+kittysize,25+kittysize);
ellipse(mouseX-20,mouseY+65,20+kittysize,25+kittysize);
}
  void move() {
    kittysize= kittysize + speed;
    if(mousePressed) kittysize=random(0,0.5);
    else
    if(kittysize > 30. || kittysize< 20) {
      speed = speed * random(0.9, 1.1); 
      speed = speed * -1;
 
      

  c = c + colorstep; 
    }
    if(mousePressed) c=0;
    else
    if(c > 255) c = c; 
    
 
  }
}

