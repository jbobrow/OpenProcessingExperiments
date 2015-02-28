
int deplacement;
void setup()
{
size(917,1065);
background (#e0dac2);
}

void draw(){
rotate(radians(-10));
noStroke();


/*rectangle noir*/
fill (#000000);
rect (-150, 0,750,200);

/*rectangle bleu*/
fill (#7097c2);
rect (500, 100,900,400);

/*rectangle rouge*/
fill (#da2b26);
rect (-100, 100,900,215);

/*ellipse noir*/
fill (#000000);
ellipse (450,500,500,500);

/*filet rouge*/
fill (#da2b26);
rect (500,350,500,10);

/*ligne rouge*/
strokeCap (PROJECT);
stroke (#c3c0bb);
strokeWeight (50);

for (int i = 0; i < 100; i++) {
  line (-100+i,1080,320+i,400);
  


}

/*filet gris*/
  stroke (#da2b26);
  line (-100,1080,320,400);

/*rectangle gris*/
noStroke();
fill (#c3c0bb);
rect (500,310,500,40);

/*rectangle jaune1*/
fill (#e5bf44);
rect (85,500,350,80);

/*rectangle gris*/
fill (#c3c0bb);
rect (10,580,600,70);

/*rectangle jaune2*/
fill (#e5bf44);
rect (355,500,80,180);
}



