
//p1=Serena =i
//p2=Danielle =j
//p3=Paulina =k
//p4=Taylor =a
//p5=Kat =b
//p6=Gianna =c
//p7=Devon =d
//p8=Kim =e
//p9=Monica =f
//p10=Kristina =g
//p11=Amelia =h
//p12=Ariana =l
//p13=Ben =m
//p14=Shelby =n
//p15=Julian =o
//p16=Juwan =p

int i=0;
int j=0;
int k=0;
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=0;
int l=0;
int m=0;
int n=0;
int o=0;
int p=0;

int serena[]={12,5,13};
int danielle[]={9,6,30,47,14,32,8,13,13,28,19,3,21,34,6,17,34,11,7,12,8,6,25,9,38,12,19,7,18,14,32,20,9};
int paulina[]={};
int taylor[]={11,10,3,10,7,11,5,17,6,3,11,43,8,2,6};
int kat[]={44,35,41,6,6,7,12,22,23};
int gianna[]={5,15,10,11,6,3,24,20,4,7,8,14,9,10,10,8,3,4,5,3,16,10,5,4};
int devon[]={4,10,8,6,10,4,13,10,6,21,8,13,27};
int kim[]={5,14,14,2,3,30,4,18};
int monica[]={9,11,25,5,16};
int kristina[]={4};
int amelia[]={4,22,8,10,2,14,3,2};
int ariana[]={23,25};
int ben[]={10,7,2,24,2,3,27};
int shelby[]={6,7,10,3,18,19,5,8,12};
int julian[]={12};
int juwan[]={};





int numSec[]= {  };

float p1[] = {125*.75,500*.75};
float p2[] = {175*.75,350*.75};
float p3[] = {275*.75,225*.75};
float p4[] = {425*.75,150*.75};
float p5[] = {600*.75,125*.75};
float p6[] = {775*.75,150*.75};
float p7[] = {925*.75,225*.75};
float p8[] = {1025*.75,350*.75};
float p9[] = {1075*.75,500*.75};
float p10[] = {1025*.75,650*.75};
float p11[] = {925*.75,775*.75};
float p12[] = {775*.75,850*.75};
float p13[] = {600*.75,875*.75};
float p14[] = {425*.75,850*.75};
float p15[] = {275*.75,775*.75};
float p16[] = {175*.75,650*.75};


void setup(){
  size(900,750);
  background(0);
}


void draw(){
  //scale(.75);
 background(0);

 //ellipses
 pushMatrix();
 scale(.75);
 fill(0);
 stroke(255);
  ellipse(600,125,25,25);
  ellipse(600,875,25,25);
  ellipse(425,850,25,25);
 ellipse(275,775,25,25);
 ellipse(175,650,25,25);
 ellipse(125,500,25,25);
 ellipse(175,350,25,25);
 ellipse(275,225,25,25);
 ellipse(425,150,25,25);
 ellipse(775,150,25,25);
 ellipse(925,225,25,25);
 ellipse(1025,350,25,25);
 ellipse(1075,500,25,25);
 ellipse(1025,650,25,25);
 ellipse(925,775,25,25);
 ellipse(775,850,25,25);

 popMatrix();


 //person 1 serena i
for(i=0; i<serena.length; i++){
 pushMatrix();
 noStroke();
 translate(p1[0],p1[1]);
 rotate(frameCount/70.0);
 polygon(0,0,serena[i]*3,6);
 popMatrix();}

 //person 2 danielle j
for(j=0; j<danielle.length; j++){
 pushMatrix();
 noStroke();
 translate(p2[0],p2[1]);
 rotate(frameCount/70.0);
 polygon(0,0,danielle[j]*3,6);
 popMatrix();}

 //person 3 paulina k
 for(k=0; k<paulina.length; k++){
 pushMatrix();
 noStroke();
 translate(p3[0],p3[1]);
 rotate(frameCount/70.0);
 polygon(0,0,paulina[k]*3,6);
 popMatrix();}

 //person 4 taylor a
 for(a=0; a<taylor.length; a++){
 pushMatrix();
 noStroke();
 translate(p4[0],p4[1]);
 rotate(frameCount/70.0);
 polygon(0,0,taylor[a]*3,6);
 popMatrix();}

 //person 5 kat b
  for(b=0; b<kat.length; b++){
 pushMatrix();
 noStroke();
 translate(p5[0],p5[1]);
 rotate(frameCount/70.0);
 polygon(0,0,kat[b]*3,6);
 popMatrix();}

 //person 6 gianna c
  for(c=0; c<gianna.length; c++){
 pushMatrix();
 noStroke();
 translate(p6[0],p6[1]);
 rotate(frameCount/70.0);
 polygon(0,0,gianna[c]*3,6);
 popMatrix();}

 //person 7 devon d
 for(d=0; d<devon.length; d++){
 pushMatrix();
 noStroke();
 translate(p7[0],p7[1]);
 rotate(frameCount/70.0);
 polygon(0,0,devon[d]*3,6);
 popMatrix();}

 //person 8 kim e
 for(e=0; e<kim.length; e++){
 pushMatrix();
 noStroke();
 translate(p8[0],p8[1]);
 rotate(frameCount/70.0);
 polygon(0,0,kim[e]*3,6);
 popMatrix();}

 //person 9 monica f
  for(f=0; f<monica.length; f++){
 pushMatrix();
 noStroke();
 translate(p9[0],p9[1]);
 rotate(frameCount/70.0);
 polygon(0,0,monica[f]*3,6);
 popMatrix();}

 //person 10 kristina g
 for(g=0; g<kristina.length; g++){
 pushMatrix();
 noStroke();
 translate(p10[0],p10[1]);
 rotate(frameCount/70.0);
 polygon(0,0,kristina[g]*3,6);
 popMatrix();}

 //person 11 amelia h
 for(h=0; h<amelia.length; h++){
 pushMatrix();
 noStroke();
 translate(p11[0],p11[1]);
 rotate(frameCount/70.0);
 polygon(0,0,amelia[h]*3,6);
 popMatrix();}

 //person 12 ariana l
 for(l=0; l<ariana.length; l++){
 pushMatrix();
 noStroke();
 translate(p12[0],p12[1]);
 rotate(frameCount/70.0);
 polygon(0,0,ariana[l]*3,6);
 popMatrix();}

 //person 13 ben m
 for(m=0; m<ben.length; m++){
 pushMatrix();
 noStroke();
 translate(p13[0],p13[1]);
 rotate(frameCount/70.0);
 polygon(0,0,ben[m]*3,6);
 popMatrix();}

 //person 14 shelby n
  for(n=0; n<shelby.length; n++){
 pushMatrix();
 noStroke();
 translate(p14[0],p14[1]);
 rotate(frameCount/70.0);
 polygon(0,0,shelby[n]*3,6);
 popMatrix();}

 //person 15 julian o
  for(o=0; o<julian.length; o++){
 pushMatrix();
 noStroke();
 translate(p15[0],p15[1]);
 rotate(frameCount/70.0);
 polygon(0,0,julian[o]*3,6);
 popMatrix();}

 //person 16 juwan p
  for(p=0; p<juwan.length; p++){
 pushMatrix();
 noStroke();
 translate(p16[0],p16[1]);
 rotate(frameCount/70.0);
 polygon(0,0,juwan[p]*3,6);
 popMatrix();}

 mousePlace();


}

void polygon(float x, float y, float radius, int npoints){
 float angle=TWO_PI/npoints;
  fill(56,69,255,60);
   beginShape();
  for(float a=0;a<TWO_PI;a+=angle){
  float sx= x + cos(a)*radius;
  float sy= y + sin(a)*radius;
  vertex(sx,sy);
  }
  endShape(CLOSE);
}

void mousePlace(){
 if(mouseX>75 && mouseX<112.5 && mouseY>356.25 && mouseY<393.75 ||
    mouseX>431.25 && mouseX<468.75 && mouseY>75 && mouseY<112.5 ||
    mouseX>787.5 && mouseX<825 && mouseY>356.25 && mouseY<393.75 ||
    mouseX>675 && mouseX<712.5 && mouseY>562.5 && mouseY<600  ||
    mouseX>562.5 && mouseX<600 && mouseY>618.75 && mouseY<656.25 ||
    mouseX>431.25 && mouseX<468.75 && mouseY>637.5 && mouseY<675 ||
    mouseX>187.5 && mouseX<225 && mouseY>562.5 && mouseY<600 ||
    mouseX>112.5 && mouseX<150 && mouseY>468.75 && mouseY<506.25    ){
  textSize(32);
  textAlign(CENTER);
   fill(255);
   text("Strategist", mouseX, mouseY);
 }

 if(mouseX>562.5 && mouseX<600 && mouseY>93.75 && mouseY<131.25 ||
    mouseX>675 && mouseX<712.5 && mouseY>150 && mouseY<187.5 ||
    mouseX>750 && mouseX<787.5 && mouseY>468.75 && mouseY<506.25 ||
    mouseX>300 && mouseX<337.5 && mouseY>618.75 && mouseY<656.25){
      textSize(32);
    textAlign(CENTER);
     fill(255);
     text("Media Planner", mouseX, mouseY);
    }

  if(mouseX>300 && mouseX<337.5 && mouseY>93.75 && mouseY<131.25){
    textSize(32);
    textAlign(CENTER);
     fill(255);
     text("Strategy Director", mouseX, mouseY);
  }

  if(mouseX>112.5 && mouseX<150 && mouseY>243.75 && mouseY<281.25){
    textSize(32);
    textAlign(CENTER);
     fill(255);
     text("Media Director", mouseX, mouseY);
  }

  if(mouseX>750 && mouseX<787.5 && mouseY>243.75 && mouseY<281.25 ||
     mouseX>187.5 && mouseX<225 && mouseY>150 && mouseY<187.5){
    textSize(32);
    textAlign(CENTER);
     fill(255);
     text("Intern", mouseX, mouseY);
  }
}




//https://processing.org/examples/regularpolygon.html

