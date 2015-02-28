
float angle=0;
int frameNum = 0;
//qwe qwe1;
//qwe qwe2;
//qwe qwe3;
//qwe qwe4;
//qwe qwe5;
//qwe qwe6;
//qwe qwe7;
//qwe qwe8;
//qwe qwe9;
//qwe qwe0;

int a=30;
int b=30;
int c=CENTER;
int d=CENTER;
int e;
int f;
int g;
int h;
int i;
color co1 = color(255);
color co2 = color(0);

void setup() {
  size(600, 600,P3D);
  smooth();
}

//qwe1 = new qwe(
//qwe2 = new qwe(
//qwe3 = new qwe(
//qwe4 = new qwe(
//qwe5 = new qwe(
//qwe6 = new qwe(
//qwe7 = new qwe(
//qwe8 = new qwe(
//qwe9 = new qwe(
//qwe0 = new qwe(

void draw() {
 // rotate(angle);//in radians!!
  translate(mouseX, mouseY);//translate() sets (0,0) to (mouseX,mouseY)
  rotate(angle);//in radians!!
  
  strokeWeight(1.5);
//ellipse(-15,-15,a,b);
color(0);
if(keyPressed){
  if(key =='q'){
a++;
}} 
if(keyPressed) {
  if(key == 'w'){
a--;
}}
if(keyPressed) {
  if(key == 'e'){
b++;
}}
if(keyPressed) {
  if(key == 'r'){
b--;
}}
if(keyPressed){
  if(key =='t'){
c++;
}} 
if(keyPressed){
  if(key =='y'){
c++;
}} 

if(keyPressed){
  if(key =='u'){
fill(co1);
stroke(0);
}}
if(keyPressed){
  if(key =='i'){
fill(co2);
stroke(255);
}} 

if(keyPressed){
  if(key =='o'){
g++;
}}
if(keyPressed){
  if(key =='p'){
g--;
}} 

//if(keyPressed){
//  if(key =='a'){
//angle+=g;
//}}
//if(keyPressed){
//  if(key =='s'){
//angle=g;
//}} 




if(keyPressed){
  if(key =='v'){
e++;
}} 
if(keyPressed){
  if(key =='b'){
e--;
}} 
if(keyPressed){
  if(key =='n'){
f++;
}} 
if(keyPressed){
  if(key =='m'){
f--;
}}
   if (keyPressed) {
    if (key == 'v') {
      if(frameNum%2==0){
        saveFrame("saved/frame-####.tga");
      }
    }
   }
else{
//  ellipse(c,d,a,b);
  translate(e, f, 0);
  box(a,b,c);
}
  angle+=0.1;
  //order of transformations matter!
}

