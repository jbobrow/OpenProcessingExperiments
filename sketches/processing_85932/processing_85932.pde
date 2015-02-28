
float x;
float y;

void setup(){
size(500,500);
background(0);
smooth();
noStroke();

}
void draw(){
  background(0);
float larghezza=width;
float altezza=height;
float chiaro=255;
float medio=150;
float scuro=50;
float easing=0.05;
float targetX=mouseX;
  float coloreLinee=255;
  float coloreRosso=255;
  float coloreBlu=0;
float coloreRosso1;
float coloreBlu1;
float coloreVerde1;
float coloreRosso2=255;
float coloreBlu2=0;
float coloreVerde2=0;
float opacitaLinee=30;
x+=(targetX/2-x)*easing;
float targetY=mouseY;
y+=(targetY-y)*easing;

if(mousePressed){
  chiaro=70;
  scuro=150;
  medio=255;
  background(0);
  coloreLinee=0;
  coloreRosso2=random(255);
  coloreBlu2=random(255);
  coloreVerde2=random(255);
}







//BLOCCO BASSO SX
//scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
  coloreRosso2=255;
  coloreBlu2=255;
  coloreVerde2=255;
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
  opacitaLinee=30;
background(0);

}
}else {
fill(scuro);
}
for (int i=0;i<width*7;i+=15){
  stroke(coloreLinee,opacitaLinee);
  line(0,0+i/2,0+i,0);
    line(0,height-i,0+i*2,height);

}
noStroke();
beginShape();
vertex((larghezza/20)*2,(altezza/20)*12);
vertex((larghezza/20)*2,(altezza/20)*14);
vertex((larghezza/20)*4,(altezza/20)*13);
vertex((larghezza/20)*4,(altezza/20)*11);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*4.5,(altezza/20)*15.25);
vertex((larghezza/20)*4.5,(altezza/20)*17.25);
vertex((larghezza/20)*6.5,(altezza/20)*16.25);
vertex((larghezza/20)*6.5,(altezza/20)*14.25);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*4,(altezza/20)*13);
vertex((larghezza/20)*6.5,(altezza/20)*11.75);
vertex((larghezza/20)*6.5,(altezza/20)*13.75);
vertex((larghezza/20)*4,(altezza/20)*15);
endShape(CLOSE);


//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}
beginShape();
vertex(0,(altezza/20)*15);
vertex(0,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*12);
vertex((larghezza/20)*2,(altezza/20)*14);
vertex((larghezza/20)*4.5,(altezza/20)*15.25);
vertex((larghezza/20)*4.5,(altezza/20)*17.25);
endShape(CLOSE);


//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}beginShape();
vertex(0,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*10);
vertex((larghezza/20)*4,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*12);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*2,(altezza/20)*14);
vertex((larghezza/20)*4,(altezza/20)*13);
vertex((larghezza/20)*6.5,(altezza/20)*14.25);
vertex((larghezza/20)*4.5,(altezza/20)*15.25);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*4,(altezza/20)*13);
vertex((larghezza/20)*6.5,(altezza/20)*11.75);
vertex((larghezza/20)*4.5,(altezza/20)*10.75);
vertex((larghezza/20)*4,(altezza/20)*11);
endShape(CLOSE);

//BLOCCO BASSO DX
//scuro

if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}beginShape();
vertex((larghezza/20)*18,(altezza/20)*12);
vertex((larghezza/20)*18,(altezza/20)*14);
vertex((larghezza/20)*16,(altezza/20)*13);
vertex((larghezza/20)*16,(altezza/20)*11);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*15.5,(altezza/20)*15.25);
vertex((larghezza/20)*15.5,(altezza/20)*17.25);
vertex((larghezza/20)*13.5,(altezza/20)*16.25);
vertex((larghezza/20)*13.5,(altezza/20)*14.25);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*16,(altezza/20)*13);
vertex((larghezza/20)*13.5,(altezza/20)*11.75);
vertex((larghezza/20)*13.5,(altezza/20)*13.75);
vertex((larghezza/20)*16,(altezza/20)*15);
endShape(CLOSE);


//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}beginShape();
vertex(larghezza,(altezza/20)*15);
vertex(larghezza,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*12);
vertex((larghezza/20)*18,(altezza/20)*14);
vertex((larghezza/20)*15.5,(altezza/20)*15.25);
vertex((larghezza/20)*15.5,(altezza/20)*17.25);
endShape(CLOSE);


//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*10);
vertex((larghezza/20)*16,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*12);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*18,(altezza/20)*14);
vertex((larghezza/20)*16,(altezza/20)*13);
vertex((larghezza/20)*13.5,(altezza/20)*14.25);
vertex((larghezza/20)*15.5,(altezza/20)*15.25);
endShape(CLOSE);

beginShape();
vertex((larghezza/20)*16,(altezza/20)*13);
vertex((larghezza/20)*13.5,(altezza/20)*11.75);
vertex((larghezza/20)*15.5,(altezza/20)*10.75);
vertex((larghezza/20)*16,(altezza/20)*11);
endShape(CLOSE);



//BLOCCO CENTRO BASSO
//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*8,(altezza/20)*15);
vertex((larghezza/20)*10,(altezza/20)*14);
vertex((larghezza/20)*12,(altezza/20)*15);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*8,(altezza/20)*15);
vertex((larghezza/20)*7,(altezza/20)*14.5);
vertex((larghezza/20)*5,(altezza/20)*15.5);
vertex((larghezza/20)*8,(altezza/20)*17);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*12,(altezza/20)*15);
vertex((larghezza/20)*13,(altezza/20)*14.5);
vertex((larghezza/20)*15,(altezza/20)*15.5);
vertex((larghezza/20)*12,(altezza/20)*17);
endShape(CLOSE);
//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}beginShape();
vertex(larghezza/2,altezza);
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*8,(altezza/20)*15);
vertex((larghezza/20)*8,(altezza/20)*17);
vertex((larghezza/20)*5,(altezza/20)*15.5);
vertex((larghezza/20)*5,(altezza/20)*17.5);
endShape(CLOSE);
//scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex(larghezza/2,altezza);
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*12,(altezza/20)*15);
vertex((larghezza/20)*12,(altezza/20)*17);
vertex((larghezza/20)*15,(altezza/20)*15.5);
vertex((larghezza/20)*15,(altezza/20)*17.5);
endShape(CLOSE);



//BLOCCO CENTRO ALTO

//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza/2,0);
vertex((larghezza/20)*5,(altezza/20)*2.5);
vertex((larghezza/20)*7,(altezza/20)*3.5);
vertex((larghezza/20)*10,(altezza/20)*2);
vertex((larghezza/20)*13,(altezza/20)*3.5);
vertex((larghezza/20)*15,(altezza/20)*2.5);
endShape(CLOSE);

//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}
beginShape();
vertex((larghezza/20)*10,(altezza/20)*2);
vertex((larghezza/20)*13,(altezza/20)*3.5);
vertex((larghezza/20)*13,(altezza/20)*5.5);
vertex((larghezza/20)*10,(altezza/20)*4);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*5,(altezza/20)*2.5);
vertex((larghezza/20)*7,(altezza/20)*3.5);
vertex((larghezza/20)*7,(altezza/20)*5.5);
vertex((larghezza/20)*5,(altezza/20)*4.5);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*8,(altezza/20)*5);
vertex((larghezza/20)*10,(altezza/20)*6);
vertex((larghezza/20)*10,(altezza/20)*4);
endShape();

//scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex((larghezza/20)*7,(altezza/20)*3.5);
vertex((larghezza/20)*10,(altezza/20)*2);
vertex((larghezza/20)*10,(altezza/20)*4);
vertex((larghezza/20)*7,(altezza/20)*5.5);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*13,(altezza/20)*3.5);
vertex((larghezza/20)*15,(altezza/20)*2.5);
vertex((larghezza/20)*15,(altezza/20)*4.5);
vertex((larghezza/20)*13,(altezza/20)*5.5);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*10,(altezza/20)*4);
vertex((larghezza/20)*10,(altezza/20)*6);
vertex((larghezza/20)*12,(altezza/20)*5);
endShape();


// BLOCCO ALTO SX

//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(0,(altezza/20)*5);
vertex((larghezza/20)*4.5,(altezza/20)*2.75);
vertex((larghezza/20)*6.5,(altezza/20)*3.75);
vertex((larghezza/20)*4,(altezza/20)*5);
vertex((larghezza/20)*6.75,(altezza/20)*6.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
endShape(CLOSE);

//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}beginShape();
vertex(0,(altezza/20)*5);
vertex(0,(altezza/20)*10);
vertex((larghezza/20)*2,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*8.05);
vertex((larghezza/20)*4.75,(altezza/20)*9.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
endShape(CLOSE);

// scuro 
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex((larghezza/20)*6.75,(altezza/20)*6.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
vertex((larghezza/20)*4.75,(altezza/20)*9.5);
vertex((larghezza/20)*6.75,(altezza/20)*8.5);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*6.5,(altezza/20)*3.75);
vertex((larghezza/20)*4,(altezza/20)*5);
vertex((larghezza/20)*6,(altezza/20)*6.05);
vertex((larghezza/20)*6.5,(altezza/20)*5.75);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*2,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*8.05);
vertex((larghezza/20)*4,(altezza/20)*9.1);
vertex((larghezza/20)*4,(altezza/20)*10);
endShape(CLOSE);






// BLOCCO ALTO DX

//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza,(altezza/20)*5);
vertex((larghezza/20)*15.5,(altezza/20)*2.75);
vertex((larghezza/20)*13.5,(altezza/20)*3.75);
vertex((larghezza/20)*16,(altezza/20)*5);
vertex((larghezza/20)*13.25,(altezza/20)*6.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
endShape(CLOSE);


// scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex(larghezza,(altezza/20)*5);
vertex(larghezza,(altezza/20)*10);
vertex((larghezza/20)*18,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*8);
vertex((larghezza/20)*15.25,(altezza/20)*9.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
endShape(CLOSE);

// medio 
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}
beginShape();
vertex((larghezza/20)*13.25,(altezza/20)*6.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
vertex((larghezza/20)*15.25,(altezza/20)*9.5);
vertex((larghezza/20)*13.25,(altezza/20)*8.5);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*13.5,(altezza/20)*3.75);
vertex((larghezza/20)*16,(altezza/20)*5);
vertex((larghezza/20)*14.05,(altezza/20)*6.05);
vertex((larghezza/20)*13.5,(altezza/20)*5.75);
endShape(CLOSE);
beginShape();
vertex((larghezza/20)*18,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*8);
vertex((larghezza/20)*16,(altezza/20)*9.05);
vertex((larghezza/20)*16,(altezza/20)*10);
endShape(CLOSE);
//BLOCCO CUORE

noStroke();
for(int i=0;i<width/2+width/8;i+=10){
 float centroX=width/2;
 float centroY=height/2;
  if(targetX>width/2){
    centroX=map(mouseX,0,width,width/2-width/20,width/2+width/20);
  }
  if(targetX<width/2){
     centroX=map(mouseX,0,width,width/2-width/20,width/2+width/20);
  }
  if(targetY>height/2){
    centroY=map(mouseY,0,height,height/2-height/20,height/2+height/20);
  }
  if(targetY<height/2){
    centroY=map(mouseY,0,height,height/2-height/20,height/2+height/20);
  }
  ellipseMode(CENTER);
  fill(coloreRosso2,coloreVerde2,coloreBlu2,50);
  ellipse(centroX,centroY,0+i,0+i);
}

if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}
beginShape();
vertex((larghezza/20)*13.25,(altezza/20)*6.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
vertex((larghezza/20)*15.25,(altezza/20)*9.5);
vertex((larghezza/20)*13.25,(altezza/20)*8.5);
endShape(CLOSE);
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex((larghezza/20)*6.75,(altezza/20)*6.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
vertex((larghezza/20)*4.75,(altezza/20)*9.5);
vertex((larghezza/20)*6.75,(altezza/20)*8.5);
endShape(CLOSE);
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*8,(altezza/20)*15);
vertex((larghezza/20)*10,(altezza/20)*14);
vertex((larghezza/20)*12,(altezza/20)*15);
endShape(CLOSE);
// BLOCCO ALTO DX

//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(larghezza,(altezza/20)*5);
vertex((larghezza/20)*15.5,(altezza/20)*2.75);
vertex((larghezza/20)*13.5,(altezza/20)*3.75);
vertex((larghezza/20)*16,(altezza/20)*5);
vertex((larghezza/20)*13.25,(altezza/20)*6.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
endShape(CLOSE);


// scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}
beginShape();
vertex(larghezza,(altezza/20)*5);
vertex(larghezza,(altezza/20)*10);
vertex((larghezza/20)*18,(altezza/20)*11);
vertex((larghezza/20)*18,(altezza/20)*8);
vertex((larghezza/20)*15.25,(altezza/20)*9.5);
vertex((larghezza/20)*15.25,(altezza/20)*7.5);
endShape(CLOSE);
// BLOCCO ALTO SX

//chiaro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(chiaro);
}
beginShape();
vertex(0,(altezza/20)*5);
vertex((larghezza/20)*4.5,(altezza/20)*2.75);
vertex((larghezza/20)*6.5,(altezza/20)*3.75);
vertex((larghezza/20)*4,(altezza/20)*5);
vertex((larghezza/20)*6.75,(altezza/20)*6.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
endShape(CLOSE);

//medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}
beginShape();
vertex(0,(altezza/20)*5);
vertex(0,(altezza/20)*10);
vertex((larghezza/20)*2,(altezza/20)*11);
vertex((larghezza/20)*2,(altezza/20)*8.05);
vertex((larghezza/20)*4.75,(altezza/20)*9.5);
vertex((larghezza/20)*4.75,(altezza/20)*7.5);
endShape(CLOSE);

//CENTRO BASSO medio
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(medio);
}beginShape();
vertex(larghezza/2,altezza);
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*8,(altezza/20)*15);
vertex((larghezza/20)*8,(altezza/20)*17);
vertex((larghezza/20)*5,(altezza/20)*15.5);
vertex((larghezza/20)*5,(altezza/20)*17.5);
endShape(CLOSE);
//scuro
if(keyPressed && (key==CODED)){
  if(keyCode==LEFT||keyCode==RIGHT){
  coloreRosso1=random(255);
  coloreBlu1=random(255);
  coloreVerde1=random(255);
 fill(coloreRosso1,coloreBlu1,coloreVerde1);
}
}else {
fill(scuro);
}beginShape();
vertex(larghezza/2,altezza);
vertex(larghezza/2,(altezza/20)*16);
vertex((larghezza/20)*12,(altezza/20)*15);
vertex((larghezza/20)*12,(altezza/20)*17);
vertex((larghezza/20)*15,(altezza/20)*15.5);
vertex((larghezza/20)*15,(altezza/20)*17.5);
endShape(CLOSE);


}


