
//SCREEN SIZE AND COLORS
int width      = 200;
int height     = 200;
int ground     = 225;
int hole       = ground-25;
int holeShadow = hole-25;
int markColor  = ground-125;
int cubeTop    = 0;
int cubeLR     = 20;
int cubeLG     = 40;
int cubeLB     = 80;
int cubeRR     = 60;
int cubeRG     = 180;
int cubeRB     = 220;
int drop       = 1;

//GROUND GRID
int xShift     = width/8;
int xHalfShift = xShift/2;
int xGridA;
int xGridB     = xGridA + xShift;
int xGridC     = xGridB + xShift;
int xGridD     = xGridC + xShift;
int xGridE     = xGridD + xShift;
int xGridF     = xGridE + xShift;
int xGridG     = xGridF + xShift;
int xGridH     = xGridG + xShift;
int xGridI     = xGridH + xShift;

int yShift     = width/(13+(1/3));
int yDropShift = yShift*4;
int yGridA     = height/2;
int yGridB     = yGridA + yShift;
int yGridC     = yGridB + yShift;
int yGridD     = yGridC + yShift;
int yGridE     = yGridD + yShift;
int yGridF     = yGridE + yShift;
int yGridG     = yGridF + yShift;

int hiddenTop  = -yShift-yShift; //Where the squares start


//DROP ACTION
boolean dropA  = false;
boolean dropB  = false;
boolean dropC  = false;
boolean dropD  = false;
boolean dropE  = false;
boolean dropF  = false;
boolean dropG  = false;

//CUBE CENTER START POINTS
int xCubeA = xGridB;
int yCubeA = hiddenTop;
int xCubeB = xGridC;
int yCubeB = hiddenTop;
int xCubeC = xGridD;
int yCubeC = hiddenTop;
int xCubeD = xGridE;
int yCubeD = hiddenTop;
int xCubeE = xGridF;
int yCubeE = hiddenTop;
int xCubeF = xGridG;
int yCubeF = hiddenTop;
int xCubeG = xGridH;
int yCubeG = hiddenTop;




void setup(){
size(width,height);
smooth();
} //END SETUP

void draw() {
  background(ground);

//HOLE
noStroke();
fill(hole);
quad(xGridA,yGridF,xGridD,yGridC,xGridD,yGridE,xGridB,yGridG);
quad(xGridE,yGridD,xGridH,yGridA,xGridH,yGridC,xGridE,yGridF);
//HOLe SHADOW
fill(holeShadow);
quad(xGridD,yGridC,xGridE,yGridD,xGridE,yGridF,xGridD,yGridE);
triangle(xGridH,yGridA,xGridI,yGridB,xGridH,yGridC);


//CUBES
//G
stroke(ground);
fill(cubeTop);
quad(xCubeG,yCubeG,xCubeG-xShift,yCubeG-yShift,xCubeG,yCubeG-yShift-yShift,xCubeG+xShift,yCubeG-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeG,yCubeG,xCubeG,yCubeG+yShift+yShift,xCubeG-xShift,yCubeG+yShift,xCubeG-xShift,yCubeG-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeG,yCubeG,xCubeG+xShift,yCubeG-yShift,xCubeG+xShift,yCubeG+yShift,xCubeG,yCubeG+yShift+yShift);
//F
stroke(ground);
fill(cubeTop);
quad(xCubeF,yCubeF,xCubeF-xShift,yCubeF-yShift,xCubeF,yCubeF-yShift-yShift,xCubeF+xShift,yCubeF-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeF,yCubeF,xCubeF,yCubeF+yShift+yShift,xCubeF-xShift,yCubeF+yShift,xCubeF-xShift,yCubeF-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeF,yCubeF,xCubeF+xShift,yCubeF-yShift,xCubeF+xShift,yCubeF+yShift,xCubeF,yCubeF+yShift+yShift);
//E
stroke(ground);
fill(cubeTop);
quad(xCubeE,yCubeE,xCubeE-xShift,yCubeE-yShift,xCubeE,yCubeE-yShift-yShift,xCubeE+xShift,yCubeE-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeE,yCubeE,xCubeE,yCubeE+yShift+yShift,xCubeE-xShift,yCubeE+yShift,xCubeE-xShift,yCubeE-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeE,yCubeE,xCubeE+xShift,yCubeE-yShift,xCubeE+xShift,yCubeE+yShift,xCubeE,yCubeE+yShift+yShift);
//C
stroke(ground);
fill(cubeTop);
quad(xCubeC,yCubeC,xCubeC-xShift,yCubeC-yShift,xCubeC,yCubeC-yShift-yShift,xCubeC+xShift,yCubeC-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeC,yCubeC,xCubeC,yCubeC+yShift+yShift,xCubeC-xShift,yCubeC+yShift,xCubeC-xShift,yCubeC-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeC,yCubeC,xCubeC+xShift,yCubeC-yShift,xCubeC+xShift,yCubeC+yShift,xCubeC,yCubeC+yShift+yShift);
//D
stroke(ground);
fill(cubeTop);
quad(xCubeD,yCubeD,xCubeD-xShift,yCubeD-yShift,xCubeD,yCubeD-yShift-yShift,xCubeD+xShift,yCubeD-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeD,yCubeD,xCubeD,yCubeD+yShift+yShift,xCubeD-xShift,yCubeD+yShift,xCubeD-xShift,yCubeD-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeD,yCubeD,xCubeD+xShift,yCubeD-yShift,xCubeD+xShift,yCubeD+yShift,xCubeD,yCubeD+yShift+yShift);
//B

stroke(ground);
fill(cubeTop);
quad(xCubeB,yCubeB,xCubeB-xShift,yCubeB-yShift,xCubeB,yCubeB-yShift-yShift,xCubeB+xShift,yCubeB-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeB,yCubeB,xCubeB,yCubeB+yShift+yShift,xCubeB-xShift,yCubeB+yShift,xCubeB-xShift,yCubeB-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeB,yCubeB,xCubeB+xShift,yCubeB-yShift,xCubeB+xShift,yCubeB+yShift,xCubeB,yCubeB+yShift+yShift);
//A
stroke(ground);
fill(cubeTop);
quad(xCubeA,yCubeA,xCubeA-xShift,yCubeA-yShift,xCubeA,yCubeA-yShift-yShift,xCubeA+xShift,yCubeA-yShift);
fill(cubeLR,cubeLG,cubeLB);
quad(xCubeA,yCubeA,xCubeA,yCubeA+yShift+yShift,xCubeA-xShift,yCubeA+yShift,xCubeA-xShift,yCubeA-yShift);
fill(cubeRR,cubeRG,cubeRB);
quad(xCubeA,yCubeA,xCubeA+xShift,yCubeA-yShift,xCubeA+xShift,yCubeA+yShift,xCubeA,yCubeA+yShift+yShift);


//DESIGNATION MARKS AND DROPS
//MARK G
noStroke();
fill(markColor,markColor,markColor,markColor);
if (mouseX>(xGridG + xHalfShift) && mouseX<=(xGridH + xHalfShift)) {
  quad(xGridG,yGridB,xGridH,yGridA,xGridI,yGridB,xGridH,yGridC);
}
//MARK F
if (mouseX>(xGridF + xHalfShift) && mouseX<=(xGridG + xHalfShift)) {
  quad(xGridF,yGridC,xGridG,yGridB,xGridH,yGridC,xGridG,yGridD);
}
//MARK E
if (mouseX>(xGridE + xHalfShift) && mouseX<=(xGridF + xHalfShift)) {
  quad(xGridE,yGridD,xGridF,yGridC,xGridG,yGridD,xGridF,yGridE);
}
//MARK C
if (mouseX>(xGridC + xHalfShift) && mouseX<=(xGridD + xHalfShift)) {
  quad(xGridC,yGridD,xGridD,yGridC,xGridE,yGridD,xGridD,yGridE);
}
//MARK B
if (mouseX>(xGridB + xHalfShift) && mouseX<=(xGridC + xHalfShift)) {
  quad(xGridB,yGridE,xGridC,yGridD,xGridD,yGridE,xGridC,yGridF);
}
//MARK D
if (mouseX>(xGridD + xHalfShift) && mouseX<=(xGridE + xHalfShift)) {
  quad(xGridD,yGridE,xGridE,yGridD,xGridF,yGridE,xGridE,yGridF);
}
//MARKA
if (mouseX>(xGridA + xHalfShift) && mouseX<=(xGridB + xHalfShift)) {
  quad(xGridA,yGridF,xGridB,yGridE,xGridC,yGridF,xGridB,yGridG);
} 


//FRONT FLOOR AREA
noStroke();
fill(ground);
quad(xGridA,yGridF,xGridB,yGridG,xGridB,height,xGridA,height);
quad(xGridB,yGridG,xGridD,yGridE,xGridD,height,xGridB,height);
quad(xGridD,yGridE,xGridE,yGridF,xGridE,height,xGridD,height);
quad(xGridE,yGridF,xGridI,yGridB,xGridI,height,xGridE,height);



//DROPS AND LIMITS
//A
if (dropA) {
  yCubeA = yCubeA + drop;
}
if (yCubeA>=yGridG+yDropShift){
  yCubeA =hiddenTop;
}
//B
if (dropB) {
  yCubeB = yCubeB + drop;
}
if (yCubeB>=yGridG+yDropShift){
  yCubeB =hiddenTop;
}
//C
if (dropC) {
  yCubeC = yCubeC + drop;
}
if (yCubeC>=yGridG+yDropShift){
  yCubeC =hiddenTop;
}
//D
if (dropD) {
  yCubeD = yCubeD + drop;
}
if (yCubeD>=yGridG+yDropShift){
  yCubeD =hiddenTop;
}
//E
if (dropE) {
  yCubeE = yCubeE + 1;
}
if (yCubeE>=yGridG+yDropShift){
  yCubeE =hiddenTop;
}
//F
if (dropF) {
  yCubeF = yCubeF + drop;
}
if (yCubeF>=yGridG+yDropShift){
  yCubeF =hiddenTop;
}
//G
if (dropG) {
  yCubeG = yCubeG + drop;
}
if (yCubeG>=yGridG+yDropShift){
  yCubeG =hiddenTop;
}


} //END DRAW   

void mousePressed() {
  //A
if (mouseX>(xGridA + xHalfShift) && mouseX<=(xGridB + xHalfShift)) {
    dropA = !dropA;
}
  //B
if (mouseX>(xGridB + xHalfShift) && mouseX<=(xGridC + xHalfShift)) {
    dropB = !dropB;
}
  //C
if (mouseX>(xGridC + xHalfShift) && mouseX<=(xGridD + xHalfShift)) {
    dropC = !dropC;
}
  //D
if (mouseX>(xGridD + xHalfShift) && mouseX<=(xGridE + xHalfShift)) {
    dropD = !dropD;
}
  //E
if (mouseX>(xGridE + xHalfShift) && mouseX<=(xGridF + xHalfShift)) {
    dropE = !dropE;
}
  //F
if (mouseX>(xGridF + xHalfShift) && mouseX<=(xGridG + xHalfShift)) {
    dropF = !dropF;
}
  //G
if (mouseX>(xGridG + xHalfShift) && mouseX<=(xGridH + xHalfShift)) {
    dropG = !dropG;
}
} //END MOUSEPRESSED
