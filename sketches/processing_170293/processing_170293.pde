
int eSize = 20;

size(400,400);
colorMode(RGB,400);
background(400);
noStroke();

for(int y=0; y<=400; y+=10){
for(int x=0; x<=400; x+=10){
  fill(180, x, 200);
  ellipse(y, x, eSize, eSize);
  }
}  
  
  
int diameter,i;

//colorMode(RGB,360,100,100,100);

noStroke();
fill(255,165,0,8);
 
diameter = 350;

for(i=0; i<16; i++){
    ellipse(250,380,diameter,diameter);
    diameter = diameter - 20;
}


for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(y > 100 && y < 150){  
      fill(172);
    }
    else{   
      fill(172);  
    }
    ellipse(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y); 
  }
}

stroke(0);
strokeWeight(10);
line(150,20,150,400);

stroke(0);
strokeWeight(20);
line(155,150,155,400);

stroke(0);
strokeWeight(10);
line(80,27,220,45);

stroke(0);
strokeWeight(6);
line(90,200,230,215);

stroke(0);
strokeWeight(10);
line(80,220,220,235);

stroke(0);
strokeWeight(10);
line(90,280,230,295);

stroke(0);
strokeWeight(8);
line(120,310,190,305);
stroke(0);
strokeWeight(5);
line(125,300,125,316);
stroke(0);
strokeWeight(5);
line(177,298,177,313);
stroke(0);
strokeWeight(5);
line(185,296,185,311);
stroke(0);
strokeWeight(1);
line(185,296,400,317);
stroke(0);
strokeWeight(1);
line(185,296,0,318);

stroke(0);
strokeWeight(1);
line(177,298,400,322);
stroke(0);
strokeWeight(1);
line(177,298,0,311);

stroke(0);
strokeWeight(1);
line(125,300,400,335);
stroke(0);
strokeWeight(1);
line(125,300,0,315);

stroke(0);
strokeWeight(7);
line(90,10,90,35);

stroke(0);
strokeWeight(1);
line(90,10,155,0);

stroke(0);
strokeWeight(1);
line(90,10,0,40);

stroke(0);
strokeWeight(7);
line(190,25,190,50);

stroke(0);
strokeWeight(1);
line(190,25,360,0);

stroke(0);
strokeWeight(1);
line(190,25,0,85);

stroke(0);
strokeWeight(7);
line(210,28,210,53);

stroke(0);
strokeWeight(1);
line(210,28,395,0);

stroke(0);
strokeWeight(1);
line(210,28,0,95);

stroke(0);
strokeWeight(35);
line(115,80,114,115);

stroke(0);
strokeWeight(5);
line(115,80,150,85);

stroke(0);
strokeWeight(5);
line(115,120,150,125);

stroke(0);
strokeWeight(20);
line(168,65,168,77);
stroke(0);
strokeWeight(5);
line(168,65,150,65);
stroke(0);
strokeWeight(5);
line(168,80,150,76);

stroke(0);
strokeWeight(10);
line(45,200,45,400);

stroke(0);
strokeWeight(5);
line(15,215,75,205);

stroke(0);
strokeWeight(3);
line(20,210,20,220);
stroke(0);
strokeWeight(1);
line(20,210,400,350);
stroke(0);
strokeWeight(1);
line(20,210,0,210);

stroke(0);
strokeWeight(3);
line(60,213,60,203);
stroke(0);
strokeWeight(1);
line(60,203,400,333);
stroke(0);
strokeWeight(1);
line(60,203,0,203);

stroke(0);
strokeWeight(3);
line(70,211,70,201);
stroke(0);
strokeWeight(1);
line(70,201,400,324);
stroke(0);
strokeWeight(1);
line(70,201,0,200);

stroke(0);
strokeWeight(8);
line(15,285,75,275);

stroke(0);
strokeWeight(10);
line(350,205,350,400);

stroke(0);
strokeWeight(5);
line(320,210,380,220);
stroke(0);
strokeWeight(3);
line(325,205,325,217);
stroke(0);
strokeWeight(1);
line(325,205,400,215);
stroke(0);
strokeWeight(1);
line(325,205,0,220);

stroke(0);
strokeWeight(3);
line(365,211,365,224);
stroke(0);
strokeWeight(1);
line(365,211,400,218);
stroke(0);
strokeWeight(1);
line(365,211,0,225);

stroke(0);
strokeWeight(3);
line(375,214,375,226);
stroke(0);
strokeWeight(1);
line(375,214,400,220);
stroke(0);
strokeWeight(1);
line(375,214,0,230);

stroke(0);
strokeWeight(5);
line(320,260,380,250);
stroke(0);
strokeWeight(3);
line(325,253,325,264);
stroke(0);
strokeWeight(1);
line(325,253,400,265);
stroke(0);
strokeWeight(3);
line(335,252,335,263);
stroke(0);
strokeWeight(1);
line(335,252,400,260);
stroke(0);
strokeWeight(3);
line(375,245,375,256);
stroke(0);
strokeWeight(1);
line(375,245,400,250);

stroke(0);
strokeWeight(5);
line(15,245,75,235);
stroke(0);
strokeWeight(3);
line(19,238,19,250);
stroke(0);
strokeWeight(1);
line(19,238,325,253);
stroke(0);
strokeWeight(1);
line(19,238,0,240);
stroke(0);
strokeWeight(3);
line(60,232,60,242);
stroke(0);
strokeWeight(1);
line(60,232,335,252);
stroke(0);
strokeWeight(1);
line(60,232,0,235);
stroke(0);
strokeWeight(3);
line(70,230,70,240);
stroke(0);
strokeWeight(1);
line(70,230,375,245);
stroke(0);
strokeWeight(1);
line(70,230,0,235);


