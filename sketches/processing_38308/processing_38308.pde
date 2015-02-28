
int moonX=80, moonY=80, moonWidth=80, moonHeight=80;

void setup() {
size(870,180);
smooth();
noStroke();
//fill(210,255,203);
background(10);
}

void draw (){
//color change
fill(mouseX,300,mouseY); 

//moon 1
ellipse(moonX,moonY,moonWidth,moonHeight);

//moon 2
ellipse(moonX+100,moonY,moonWidth,moonHeight);

//moon 3
ellipse(moonX+200,moonY,moonWidth,moonHeight);

//moon 4
ellipse(moonX+300,moonY,moonWidth,moonHeight);

//moon 5
ellipse(moonX+400,moonY,moonWidth,moonHeight);

//moon 6
ellipse(moonX+500,moonY,moonWidth,moonHeight);

//moon 7
ellipse(moonX+600,moonY,moonWidth,moonHeight);

//moon 8
ellipse(moonX+700,moonY,moonWidth,moonHeight);



//moon shadows
if (keyPressed){
fill(10,240);

//moon shadow 1
ellipse(moonX-5,moonY,moonWidth+5,moonHeight+5);

//moon shadow 2
ellipse(moonX+92,moonY,moonWidth+5,moonHeight+7);

//moon shadow 3
ellipse(moonX+193,moonY,moonWidth-8,moonHeight+7);

//moon shadow 4
ellipse(moonX+285,moonY,moonWidth-10,moonHeight+8);

//moon shadow 5
ellipse(moonX+387,moonY,moonWidth-24,moonHeight+12);

//moon shadow 6
ellipse(moonX+482,moonY,moonWidth-34,moonHeight+16);

//moon shadow 7
ellipse(moonX+580,moonY,moonWidth-30,moonHeight+48);

//moon shadow 8
ellipse(moonX+680,moonY,moonWidth-30,moonHeight+54);
//inverse ellipse
fill(mouseX,300,mouseY);
ellipse(moonX+701,moonY,moonWidth-70,moonHeight);

}

}

