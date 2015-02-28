
//ex1_7
void setup () {
size(200,200);
}

void draw (){
  
 background (255);
ellipseMode(CENTER);
rectMode(CENTER);


//background


//sky
fill(3+mouseX-37,169+mouseX-90,255+mouseX-120);
rect(0,0,400,300);
//sunandmoon
fill(255+mouseX-100,235+mouseX-120,0-mouseX);
ellipse(mouseX,mouseY,60,60);


//ground
fill(10,193,90);
rect(0,200,400,100);



//body
fill(150);
triangle(70,160, 100, 120, 130, 160);
fill(225);
triangle(84,140, 100, 120, 130, 160);
fill(15);
triangle(85,140, 108, 130, 93, 160);


fill(255);
stroke(0);
ellipse(90,150,5,5);
ellipse(107,134,5,5);
ellipse(115,150,5,5);



//head
fill(255);
ellipse(100,95,60,60);

//HAIR
noFill();
{stroke(234, 216, 12);
bezier(100, 65, 45, 65, 90, 115, 50, 120);
stroke(234, 216, 12);
bezier(100, 65, 47, 67, 92, 117, 52, 122);
stroke(234, 216, 12);
bezier(100, 65, 47, 67, 92, 117, 54, 124);
//right side
stroke(234, 216, 12);
bezier(100, 65, 150, 65, 107, 115, 147, 119);
stroke(234, 216, 12);
bezier(100, 65, 152, 67, 108, 117, 145, 121);
stroke(234, 216, 12);
bezier(100, 65, 154, 67, 110, 117, 143, 124);
}


//eyes
fill(10+mouseX+255,250-mouseX+80,219-mouseX+200);
stroke(255);
ellipse(88,90,9,9);
ellipse(113,90,9,9);

//left blink
noFill();
stroke(255, 110, 210);
bezier(85, 92,  88, 95,  90, 95,  92, 92);
//right blink
noFill();
stroke(255, 110, 210);
bezier(110, 92,  113, 95,  115, 95,  117, 92);

//smile
noFill();
stroke(0, 0, 0);
bezier(90, 105,  95, 115,  105, 115,  110, 105);

//legs
stroke(0);
line(90,160,90,180);
line(110,160,110,180);

//arms
stroke(0);
line(87,135,68,140);
line(111,135,130,138);

}


//jumping girl
void mousePressed(){
  frameRate(3);
//background
fill(3+mouseX-37,169+mouseX-90,255+mouseX-120);
rect(0,0,400,300);
//ground
fill(10,193,90);
rect(0,200,400,100);


//sunandmoon
  //jumpbody

fill(150);
triangle(70,130, 100, 90, 130, 130);
fill(225);
triangle(84,110, 100, 90, 130, 130);
fill(15);
triangle(85,110, 108, 98, 93, 130);

fill(255);
stroke(0);
ellipse(90,120,5,5);
ellipse(107,104,5,5);
ellipse(115,120,5,5);

  
  //jumphead
fill(255);
ellipse(100,65,60,60);

//jumpsmile
noFill();
stroke(0, 0, 0);
bezier(90, 75,  95, 85,  105, 85,  110, 75);

//jumpeyes
fill(255, 110, 210);
stroke(255);
ellipse(88,60,9,9);
ellipse(113,60,9,9);

//jumphair
noFill();
stroke(234, 216, 12);
bezier(100, 35, 45, 35, 90, 85, 50, 90);
stroke(234, 216, 12);
bezier(100, 35, 47, 37, 92, 87, 52, 92);
stroke(234, 216, 12);
bezier(100, 35, 47, 37, 92, 87, 54, 94);
//right side
stroke(234, 216, 12);
bezier(100, 35, 150, 35, 107, 95, 147, 99);
stroke(234, 216, 12);
bezier(100, 35, 152, 37, 108, 97, 145, 91);
stroke(234, 216, 12);
bezier(100, 35, 154, 37, 110, 97, 143, 94);


//jumplegs
stroke(0);
line(90,130,80,150);
line(110,130,120,150);

//jumparms
stroke(0);
line(87,105,72,98);
line(110,105,125,98);

//jumpsun
fill(254,255,49);
ellipse(180,10,70,70);
}

