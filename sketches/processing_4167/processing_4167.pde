
int c,b=256;void setup(){size(950,b,P3D);textFont(createFont("",30),25);}void draw(){fill(-b);background(0);rotateX(.8);text(join(subset(split(param("archive"),".jar,"),3),"\n"),b,-.2*c+++b,-50);}

