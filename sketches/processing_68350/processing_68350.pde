
//this is only for test purpose, then the code isn't clean.

int cR,cG,cB;
int sBox=10;
float oCamX, oCamY, oCamZ, cCamX, cCamY, cCamZ, upX, upY, upZ;
float rotCam=-1;
float xAdd,yAdd;
void setup() {
  size(400, 400, P3D);
  smooth();
oCamX=200;
oCamY=200;
xAdd=1;
yAdd=0.5;
}

void draw() {

  background(150);
  noStroke();//pêrmet de changer la couleur du contour, peut avoir de la transparence aussi

//camera(); //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

rotCam=PI;

oCamZ=600;


if (oCamX>=600){
xAdd=-1;
}else if (oCamX<=-200){
xAdd=1;
}
oCamX=oCamX+xAdd;

if (oCamY>=600){
yAdd=-0.5;
}else if (oCamY<=-200){
yAdd=0.5;
}
oCamY=oCamY+yAdd;



cCamX=200;//établie le centre de la scèene, ou la caméra pointe toujours
cCamY=200;
cCamZ=0;

upX=0;//rotation de la caméra sur 90 degrés entre -1 et 1 (mais peut aller plus loin, cependant, la caméra bouge très peu
upY=rotCam;//miroir de la caméra par -1 et 1, 0 donne une fermeture de la caméra?
upZ=0;//rotation de la caméra sur 90 degrés entre -1 et 1 (mais peut aller à -Pi,PI Meme si peu utile, ces argument doivent rester pour la caméra.

camera(oCamX, oCamY, oCamZ, cCamX, cCamY, cCamZ, upX, upY, upZ);
cR=0;
  for (int k=-200;k<201;k=k+50) {  
  pushMatrix();
  fill(cR,cG,cB,155);  
  cR=cR+32;
  translate(0,0,k);
  cG=0;
  for (int i=0;i<401;i=i+50) {
    
    pushMatrix();
    fill(cR,cG,cB,155);
    cG=cG+32;
    translate(i, 0);// ici, il N'EST PAS dans pushMatrix, donc s'accumule à chaque passage
    cB=0;
    for (int j=0;j<401;j=j+50) {
      
      pushMatrix();
      fill(cR,cG,cB,155);
      cB=cB+32;
      translate(0, j);//comme les translate s'acculume, il faut trouver un moyen de les reseter pour faire un champs de cube, ou le mettre dans pushMatrix.
      box(10);
      popMatrix();
    }
    popMatrix();
  }
  popMatrix();
  }
  println(frameRate);
}
