
void setup (){ 
size(1000,800);
}

void draw(){
background(0,0,0);


//redoutline triangle
stroke(255,0,0);
fill(0,0,0);
triangle(50,0,150,100,50,150);

fill(255,0,0);
line(0,50,50,150);

//pink ellipse
noStroke();
fill(255,100,204);
ellipse(50,150,10,10);
ellipse(150,150,10,10);

//tealoutlinetriangle
//reference triagnle
stroke(39,229,228);
fill(0,0,0);
triangle(50,150,150,150,50,250);

//green checkerpattern in triangle
noStroke();
fill(54,134,67);
rect(50,150,10,10);
rect(50,170,10,10);
rect(50,190,10,10);
rect(50,210,10,10);
rect(50,230,10,10);
rect(60,160,10,10);
rect(60,180,10,10);
rect(60,200,10,10);
rect(60,220,10,10);
rect(70,150,10,10);
rect(70,170,10,10);
rect(70,190,10,10);
rect(70,210,10,10);
rect(80,160,10,10);
rect(80,180,10,10);
rect(80,200,10,10);
rect(90,150,10,10);
rect(90,170,10,10);
rect(90,190,10,10);
rect(100,160,10,10);
rect(100,180,10,10);
rect(110,150,10,10);
rect(110,170,10,10);
rect(120,160,10,10);
rect(130,150,10,10);

noStroke();
fill(255,100,204);
ellipse(150,150,10,10);




//yellow triangle outline
//reference teal triangle(50,150,150,150,50,250);
fill(0,0,0);
strokeWeight(2);
stroke(#FFE75A);
triangle(150,150,250,150,150,100);





noStroke();
fill(#FF3B3B);
ellipse(50,250,10,10);

//white_triangle_yellow_fill
fill(#F4FF67);
stroke(#FFFFFC);
triangle(250,150,350,100,250,2);

//yellow ellipse
fill(#FAF319);
ellipse(250,150,10,10);

//white ellipses
fill(255,255,255);
ellipse(350,100,10,10);
ellipse(250,2,10,10);
ellipse(150,20,10,10);

//white line
fill(255,255,255);
line(150,20,250,150);

//green checkerpattern in triangle
noStroke();
fill(54,134,67);
rect(50,150,10,10);
rect(50,170,10,10);
rect(60,160,10,10);
rect(70,170,10,10);
rect(80,180,10,10);
fill(0,0,0);


//white elipse top
fill(255,255,255);
ellipse(50,0,10,10);

//white ellips tope red bootom right triangle
fill(255,255,255);
ellipse(150,95,10,10);



//white triangle connected to teal checkered triangle
//reference teal triangle(50,150,150,150,50,250);
fill(0,0,0);
stroke(255,255,255);
triangle(-20,300,50,250,50,350);

//white lines
fill(255,255,255);
line(-300,250,50,250);



//brown checkered fill for white triangle
noStroke();
fill(#67543C);
rect(40,255,10,10);
rect(40,275,10,10);
rect(40,295,10,10);
rect(40,315,10,10);
rect(40,335,10,10);
rect(30,265,10,10);
rect(30,285,10,10);
rect(30,305,10,10);
rect(30,325,10,10);
rect(20,275,10,10);
rect(20,295,10,10);
rect(20,315,10,10);
rect(10,285,10,10);
rect(10,305,10,10);

//red triangle 2
//reference whitechecker triangle(-20,300,50,250,50,350);

stroke(255,0,0);
fill(0,0,0);
triangle(50,350,120,300,120,400);
//

//white line
stroke(255,255,255);
line(50,250,100,340);

//red line
stroke(255,0,0);
line(120,400,50,455);

//red triangle greenishfill
//reference red triangle triangle(50,350,120,300,120,400);
fill(#83B4A8);
stroke(255,0,0);
triangle(120,300,120,400,150,380);

//blue ellipse
noStroke();
fill(0,0,255);
ellipse(120,300,10,10);

//white triangle purple fill
fill(#522664);
stroke(255,255,255);
triangle(120,400,220,350,220,450);

//
}



