
float x;
float y = 20;
float a = 200;
float b = -85;
float c = 450;
float d = 150;
int mida = 100;



void setup(){
size(500,500);

}

void draw(){
background(247,236 -mouseY/2,14);

//núvols
noStroke();
fill(75,174,250);
ellipse(130-a/38,40,150,35);
ellipse(330-a/28,80,100,35);
ellipse(430-a/18,40,150,35);

// arbres
size(500,500);
noStroke();
fill(85,53,5);
rect(90,240,20,80);
fill(49,172,19);
ellipse(100,240,60,60);

fill(85,53,5);
rect(d+90,240,20,80);
fill(49,172,19);
ellipse(d+100,240,60,60);

fill(85,53,5);
rect(d/2+90,240,20,80);
fill(49,172,19);
ellipse(d/2+100,240,60,60);

fill(85,53,5);
rect(d*2+90,240,20,80);
fill(49,172,19);
ellipse(d*2+100,240,60,60);

fill(85,53,5);
rect(d*2.5+90,240,20,80);
fill(49,172,19);
ellipse(d*2.5+100,240,60,60);

//carretera
fill(195,187,175);
rect(0,300,500,200);
fill(255);
rect(0,400,500,10);



//cotxe verd
x = x + 0.6;
fill(32,128,12);
rect(x+0,y+400,100,30);
rect(x+15,y+378,70,30);
fill(255);
rect(x+23,y+382,20,18);
rect(x+53,y+382,20,18);
//cotxe verd rodes
fill(0);
ellipse(x+30,y+430,30,30);
ellipse(x+70,y+430,30,30);

//cotxe blau
a = a - 0.5;
fill(10,126,242);
rect(a+0,b+400,100,30);
rect(a+15,b+378,70,30);
fill(255);
rect(a+23,b+382,20,18);
rect(a+53,b+382,20,18);
//cotxe blau rodes
fill(0);
ellipse(a+30,b+430,30,30);
ellipse(a+70,b+430,30,30);

//cotxe taronja
c = c - 0.3;
fill(247,110,12);
rect(c+0,b+400,100,30);
rect(c+15,b+378,70,30);
fill(255);
rect(c+23,b+382,20,18);
rect(c+53,b+382,20,18);
//cotxe blau rodes
fill(0);
ellipse(c+30,b+430,30,30);
ellipse(c+70,b+430,30,30);


//OVNI
stroke(0);
strokeWeight(4);
fill(147+mouseX/5,4-mouseX/500,255);
ellipse(mouseX,mouseY,40+mouseY/18, 50+mouseY/28);

//OVNI Finestra
fill(255,random(205),random(205));
ellipse(mouseX,mouseY,18+mouseY/25,28+mouseY/25);
fill(147+mouseX/5,4-mouseX/500,255);
ellipse(mouseX,mouseY+20,100+mouseY/5, 27+mouseY/25);


}

