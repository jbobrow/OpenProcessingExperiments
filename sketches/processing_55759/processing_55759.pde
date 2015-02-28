
float easing = 0.02;

void setup() {
size(300, 350);
background(255);
smooth();
}

//body

int a = 40;
int bx = 120;
int by = 240;
int hx = 120;

int hr = 140;

int ey = 100;
int e = 10;
int el = 90;

int h = 30;
int eh = 5;

int x = 120;
int y = 30;
int w = 70;
int l = 140;

int er = 150;
int hy = 100;

void draw () {
  background(255);
  if((mouseX > x) && (mouseX < x+w) &&
     (mouseY > y) && (mouseY < y+l)) {
   er = mouseX;
   hy = mouseY;
     } //else {
        //er = 150;
        //hy = 100;}
  if (mousePressed) {
h = 30;
eh = 5;
} else {
h = 0;
eh = 0;
}


  //right arm
  fill(0);                  //colour
  triangle(185,175,195,170,180,155);
  triangle(200,168,213,147,210,170);
  triangle(235,170,213,185,210,173);
  noStroke();
  fill(100);                //colour
  ellipse(190,200,a,a);
  noStroke();
  fill(150);                //colour
  ellipse(180,210,a,a);
  //stroke(0);
  fill(50);                 //colour
  ellipse(170,220,a,a);
  //noStroke();
  fill(200);                //colour
  ellipse(200,180,a-10,a-10);
    //ellipse(170,220,40,40);
    //stroke(0);
    
//stroke(0);
fill(255);
  
  //left arm
  fill(150);                //colour
  ellipse(80,250,a,a);
  //ellipse(70,230,40,40);
  fill(50);                //colour
  ellipse(70,230,a,a);

fill(175);                //colour
strokeWeight(5);
stroke(50);
triangle(50,200,90,210,70,230); //left shoulder
triangle(180,180,150,210,170,230); //right shoulder
stroke(0);
fill(110);                //colour
triangle(100,260,140,260,120,320); //bottom
stroke(30);
strokeWeight(1);
fill(255);                //colour
ellipse(bx,by,100,100);
stroke(0);
strokeWeight(5);
ellipse(bx,by,80,80);
strokeWeight(10);
stroke(80);
ellipse(bx,by,60,60);

//neck
smooth();
noFill();                //colour
strokeWeight (10);
stroke(150);
ellipse(120,150,100,100);
strokeWeight(1);

//head
stroke(50);
strokeWeight(5);
fill(200);                 //colour
ellipse(hx,hy,hr,hr-h);
noFill();                  //colour
strokeWeight(10);
stroke(255);
ellipse(hx,hy,hr-40,hr-40-h);
//ellipse(120,100,60,60);
strokeWeight(1);
stroke(50);

fill(50);                  //colour
//rect(60,50,120,10);
//rect(50,60,140,10);

//eyes
rect(er-5,hy-35,10,70);
quad(er-20,hy-23,er+28,hy+20,er-26,hy-22,er+20,hy+25);
quad(er-27,hy+20,er+16,hy-30,er-20,hy+26,er+25,hy-25);
rect(er-34,hy-5,70,10);
ellipse(er-60,hy,e+20,e+20-eh);
ellipse(er,hy,e+30,e+30-eh);

fill(255);
noStroke();
ellipse(er,hy,e+10,e+10-eh);
ellipse(er-60,hy,e,e-eh);
//fill(237,29,47);
//ellipse(150,100,8.5,8.5)

//fill(101,188,70);
//ellipse(90,100,5,5); 
//ellipse(150,100,7,7); 
//rect(115,235,10,10);
}


