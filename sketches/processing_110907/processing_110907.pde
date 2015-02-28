
void setup(){
  size(800,800);
  smooth();
  frameRate(20);
}
 
 
 
 
void draw(){
 
   
 
   
   
background (0);
  
   
float  diam = random (50);
 
 
fill(255);
int dx = 50, dy = 50;
for (int y = 50; y <= 790; y = y + dy) {
for (int x = 50; x <= 790; x = x + dx) {
  ellipse(x, y, diam,diam);
 
 
 
 
}}
 
 
 
 
 
int da = 150, db = 150;
color c1=color( 255) ;
 
for (int a = 50; a < 790; a = a + da) {
for (int b = 50; b < 790; b = b + db) {
fill(c1);
  rect(a, b, 100,100);
  noStroke();
  if (mouseX>50&&mouseY;>50 ){
  c1=color (random(255),200);
 
if (mouseX>175&&mouseY;>175 ){
  c1=color (random(255),0,0,200);
  if (mouseX>225&&mouseY;>225 ){
  c1=color (0,random(255),0,200);
    if (mouseX>325&&mouseY;>325 ){
  c1=color (0,0,random(255),200);
   
}}}}}
}
 
 
 
 
 
 
 
 
}

