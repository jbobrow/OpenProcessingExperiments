
float posicioX = 400;
float posicioY = 300;
float ampladapeix = 80;
float alsadapeix = 40;
float trianglex1 =345;
float trianglex2 = 370;
float triangley1 = 285;
float triangley2 = 315;
float velocitatX = 2;
float velocitatY = 1.5;
float ullX = 428;
float ullY = 295;
float midaull = 12;
float ullX2 = 432;
float midaull2 = 5;
float llavisX = 441;
float llavisY1 = 302;
float llavisY2 = 305;
PImage img;
float algax1 = 80;
float algax2 = 100;
float algax3 = 87;
float algay1 = 180;
float algay2 = 190;
float velocitatalga1 = 5;
float algax4 = 450;
float algax5 = 458;
float algax6 = 470;
float velocitatalga2 = 5;
float colorpeix1 = 252;
float colorpeix2 = 147;
float colorpeix3 = 18;

void setup() {
size(600,400);
img = loadImage("modern-living-room-furniture-home-interior-design.jpg");
frameRate(80);
}

void draw() {
  
  //fons del mar
  background(#F7F4F0);
  
 //casa
  image(img,0,0,width,height);
  
  //tauleta
  fill(116,85,0);
  stroke(0);
  rect(0,320,width,100);
  
  //peixera
  stroke(0);
  strokeWeight(2);
  fill(45,163,250,200);
  rect(50,50,width-100,height-100);
  stroke(#834609);
  strokeWeight(1);
  fill(165,123,5);
  rect(50,300,width-100,50);
  
  
  //algues esquerra
  stroke(#055239);
  fill(0,116,51);
  triangle(algax1,algay1,90,320,70,320);
  triangle(algax2,algay1,120,320,95,320);
  triangle(algax3,algay2,97,330,77,330);
  algax1 = algax1 + velocitatalga1;
  algax2 = algax2 + velocitatalga1;
  algax3 = algax3 + velocitatalga1;
  velocitatalga1 = -velocitatalga1;
  
  //algues dreta
  triangle(algax4,algay2,435,320,465,320);
  triangle(algax5,algay1,450,330,470,330);
  triangle(algax6,algay2,460,325,490,325);
  algax4 = algax4 + velocitatalga2;
  algax5 = algax5 + velocitatalga2;
  algax6 = algax6 + velocitatalga2;
  velocitatalga2 = -velocitatalga2;
  
  //roca1
  fill(#BCBCBC);
  stroke(#7C7C7C);
  beginShape();
curveVertex(250,330);
curveVertex(250,330);
curveVertex(260,280);
curveVertex(300,280);
curveVertex(320,330);
curveVertex(320,330);
endShape();

//roca2
beginShape();
curveVertex(230,340);
curveVertex(230,340);
curveVertex(240,300);
curveVertex(270,300);
curveVertex(280,340);
curveVertex(280,340);
endShape();
  
  //velocitats punts X i Y
    //termesX
  posicioX = posicioX + velocitatX;
  trianglex1 = trianglex1 + velocitatX;
  trianglex2 = trianglex2 + velocitatX;
  ullX = ullX + velocitatX;
  ullX2 = ullX2 + velocitatX;
  llavisX = llavisX + velocitatX;
    //termes Y
  posicioY = posicioY + velocitatY;
  triangley1 = triangley1 + velocitatY;
  triangley2 = triangley2 + velocitatY;
  ullY = ullY + velocitatY;
  llavisY1 = llavisY1 + velocitatY;
  llavisY2 = llavisY2 + velocitatY;
  
  
//peix
stroke(#B76A1E);
strokeWeight(1);
fill(colorpeix1, colorpeix2, colorpeix3);
triangle(trianglex1,triangley1,trianglex1,triangley2,trianglex2,posicioY);
ellipse(posicioX, posicioY, ampladapeix, alsadapeix); 
fill(255);
ellipse(ullX,ullY,midaull,midaull);
fill(0);
ellipse(ullX2,ullY,midaull2,midaull2);
fill(#E04274);
ellipse(llavisX,llavisY1,8,5);
ellipse(llavisX,llavisY2,8,5);

//moviment eix X
if((posicioX + ampladapeix/2 >= 550)|| (trianglex1 <= 50)||(ullX + midaull/2 >= 540)||(ullX2 + midaull2/2 >= 540)){
  velocitatX = -velocitatX;
}

//moviment eix Y
  if((posicioY + alsadapeix/2 >= 350)||(posicioY - alsadapeix/2 <= 50)){
  velocitatY = -velocitatY;
  }
  
//text
 textAlign(CENTER);
  textSize(40);
  fill(random(120,255));
  text("He wants to scape",300,390);
  

}

void mousePressed(){
  velocitatX = random(1,6);
  velocitatY = random(1,6);
  colorpeix1 = random (255);
  colorpeix2 = random (255);
  colorpeix3 = random (255);
}





