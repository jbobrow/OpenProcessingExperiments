

//WEEK 3

size(305,305);
smooth();
background(95,94,95);


//USING A FOR LOOP

strokeWeight(3);
stroke(140,135,135);


//BACKGROUND CHECK PATTERN

/*line(5,5,300,5);
line(5,10,300,10);*/
for(int i=0; i<=300; i+=5) {line(5,i+5,300,i+5);}

//line(5,5,5,300);
for(int i=0;i<=300;i+=5) {line(i+5,5,i+5,300);}



//SKETCH WITH VARIABLES

int x = 228;
int y = 209;
int z = 204;

noStroke();

//------------------------------------

//right ear
fill(x,y,z);
ellipse(130,90,42,165);
fill(248,244,243);
ellipse(130,105,32,105);

//left ear
fill(x,y,z);
ellipse(180,95,42,165);
fill(248,244,243);
ellipse(180,110,32,105);

//head
fill(x,y,z);
ellipse(145,215,135,130);

//right eye
fill(248,244,243);
ellipse(110,198,40,50);
fill(34,30,31);
ellipse(118,193,18,22);

//left eye
fill(248,244,243);
ellipse(160,200,40,50);
fill(34,30,31);
ellipse(169,195,18,22);

//nose
fill(139,134,134);
ellipse(130,230,16,10);

//mouth
ellipse(148,260,18,7);












