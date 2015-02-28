

//Koefficienter for stickman

int xVBen1 = 100;
int yVBen1 = 100;
int xVBen2 = 110;
int yVBen2 = 80;

//Højre ben

int xHBen1 = 120;
int yHBen1 = 100;
int xHBen2 = 110;
int yHBen2 = 80;

//Kroppen

int xKrop1 = 110;
int yKrop1 = 80;
int xKrop2 = 110;
int yKrop2 = 65;

//Venstre arm

int xVArm1 = 110;
int yVArm1 = 65;
int xVArm2 = 100;
int yVArm2 = 80;

//Højre arm

int xHArm1 = 110;
int yHArm1 = 65;
int xHArm2 = 120;
int yHArm2 = 80;

//Halsen

int xHals1 = 110;
int yHals1 = 65;
int xHals2 = 110;
int yHals2 = 57;

//Hovedet

int xHovede1 = 110;
int yHovede1 = 50;
int xHovede2 = 15;
int yHovede2 = 15;

void setup() {
  size(300,300);
  frameRate(40);
}

void draw() {
  
  background(255,255,255);

line(xVBen1,yVBen1,xVBen2,yVBen2);
line(xHBen1,yHBen1,xHBen2,yHBen2);
line(xKrop1,yKrop1,xKrop2,yKrop2);
line(xVArm1,yVArm1,xVArm2,yVArm2);
line(xHArm1,yHArm1,xHArm2,yHArm2);
line(xHals1,yHals1,xHals2,yHals2);
ellipse(xHovede1,yHovede1,xHovede2,yHovede2);
  

//Koefficienter +1, skaber bevægelse på x-aksen
  
//Venstre ben

xVBen1 = xVBen1+1;

xVBen2 = xVBen2+1;


//Højre ben

xHBen1 = xHBen1+1;

xHBen2 = xHBen2+1;


//Kroppen

xKrop1 = xKrop1+1;

xKrop2 = xKrop2+1;


//Venstre arm

xVArm1 = xVArm1+1;

xVArm2 = xVArm2+1;


//Højre arm

xHArm1 = xHArm1+1;

xHArm2 = xHArm2+1;

//Hals

xHals1 = xHals1+1;

xHals2 = xHals2+1;

//Hovedet

xHovede1 = xHovede1+1;

}


