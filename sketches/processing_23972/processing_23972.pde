
void setup(){
  size(500,500);
  background(175);
}

int value = 0; 

void draw(){
background(137,242,255);

//land
noStroke();
fill(2,100,1);
rectMode(CENTER);  
rect(250,375,500,300);

smooth();
noFill();
strokeWeight(10); 
stroke(255);
curve(250,400,250,330,400,150,mouseX,mouseY);



//ears
smooth();
strokeWeight(1);
fill(255);
triangle(170,130,160,40,250,80);
triangle(330,130,340,40,250,80);
//inner ears
fill(240,161,180);
triangle(170,130,160,40,200,80);
triangle(330,130,340,40,300,80);
//inner ears shading
noStroke();
fill(214,136,154);
triangle(170,130,175,55,200,80);
triangle(330,130,329,55,300,80);

//body
stroke(0);
fill(255);
rectMode(CENTER);
rect(250,250,100,200);

//legs
ellipseMode(CENTER);

fill(246);
ellipse(300,320,50,80);
ellipse(200,320,50,80);
fill(255);
ellipse(310,355,50,40);
ellipse(190,355,50,40);

ellipse(300,250,50,60);
ellipse(200,250,50,60);
line(200,270,200,280);
line(300,270,300,280);
line(190,265,190,280);
line(290,265,290,280);
line(210,265,210,280);
line(310,265,310,280);

//head
stroke(0);
fill(255);
smooth();
ellipse(250,150,180,180);
//body

//eyes
fill(211,36,139);
ellipseMode(CENTER);
ellipse(215,140,20,20);
ellipse(285,140,20,20);

//iris
fill(124,1,24);
ellipse(215,140,10,10);
ellipse(285,140,10,10);

//reflection
fill(255);
ellipse(211,135,5,5);
ellipse(281,135,5,5);
//mouth
  

if (mousePressed == true)
{fill(178,9,9);}
else{noFill();}
noStroke();
arc(250,190,20,20,0,PI);

fill(255);
stroke(0);
arc(240,185,20,20,0,PI);
arc(260,185,20,20,0,PI);



}



                
