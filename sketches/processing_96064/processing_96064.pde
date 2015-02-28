
/*-------------------
Codi creat per Arnau Cuadras
Pràctica "P2_b"
Informàtica
Grup 4
2n GEDI
ELISAVA
-------------------*/
void setup(){
size(600,600);
noCursor();
}
void draw(){
   float pos1=random(width);
float pos2=random(height);
float pos3=random(width);
float pos4=random(height);
float pos5=random(width);
float pos6=random(height);
float pos7=random(width);
float pos8=random(height);
  float distGeo1=dist(pos1,pos2,mouseX,mouseY);
  fill(255,10);
  rect(0,0,width,height);
  stroke(255);
    if (mousePressed==true)
  {
  stroke(random(255),random(255),random(255));
  strokeWeight(3);
 }else{
stroke(0);
fill(0);
 strokeWeight(1);
}
 line(pos1,pos2,mouseX,mouseY);
 line(pos3,pos4,mouseX,mouseY);
 line(pos5,pos6,mouseX,mouseY);
 line(pos7,pos8,mouseX,mouseY); 
 float pos9=mouseX+random(width);
 float pos10=mouseX+random(height);
 ellipse(pos9,pos10,20,20);
if (distGeo1>200==true){
  triangle(pos1,pos2,pos1+20,pos2+10,pos1-10,pos2-20);
  }  
  if (distGeo1<200==true)
  rect(pos3,pos4,pos3/10,pos4/10,5-2,5-2);
  ellipse(pos5,pos6,pos5/10,pos6/10);
}
