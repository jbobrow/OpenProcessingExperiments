
//Ryan Galloway
//Computer Science 1 Final
//this probably took ten hours, but it wouldn't taken ten minutes to make
//if I had the actually final product in mind

float angle=0;
int frameNum = 0; //for screenshot feature

//parameters for player's shapes
int a=30;
int b=30;
int z=30;
int c=CENTER;
int d=CENTER;

//controls translate's parameters
int e=0;
int f=0;

//for translate
int xmov=600;
int ymov=600;

//colors for box's fill and stroke
color co1 = color(255);
color co2 = color(148,140,117);
color co3 = color(123,23,12);
boolean boo;

void setup() {
  size(600,600,P3D);
  smooth();
//  camera(width/2, height/2, (height/2.0) / tan(PI*60.0 / 360.0), width/2, height/2, 0, 0, 1, 0);
}

void draw() {
//  rotate(angle);//in radians!!
lights();
//next couple of lines are code from programming.org that let you change perspective with mouse.
//I fooled around with making all of the numbers here variables that are controlled on the keyboard,
//much like all of the other parameters. None of this tinkering resulted in anything interesting.
  float cameraY = height/2;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 2;
  }
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  translate(width/2, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  //allows keyboard to control shape
  translate(xmov,ymov);
  rotate(angle); 
  strokeWeight(1.5); //considered enabling stroke weight control. Didn't like it.
//dimensions of shape
//shape x
if(keyPressed){
  if(key =='q'){
a++;
}} 
if(keyPressed) {
  if(key == 'w'){
a--;
}}
//shape y
if(keyPressed) {
  if(key == 'e'){
b++;
}}
if(keyPressed) {
  if(key == 'r'){
b--;
}}


//switch colors!
if(keyPressed){
  if(key =='u'){
fill(co1);
stroke(0);
}}
if(keyPressed){
  if(key =='i'){
fill(co2);
stroke(0);
}} 
if(keyPressed){
  if(key == 'o'){
  fill(co3);
    stroke(0);
  }}
if(keyPressed){
  if(key == 'p'){
  fill((int)random(100),(int)random(100),(int)random(100));
  }}
  
//box's z dimension
if(keyPressed){
  if(key =='b'){
z++;
}}
if(keyPressed){
  if(key =='n'){
z--;
}} 

//box translate
if(keyPressed){
  if(key =='m'){
e++;
}} 
if(keyPressed){
  if(key ==','){
e--;
}} 
if(keyPressed){
  if(key =='.'){
f++;
}} 
if(keyPressed){
  if(key =='/'){
f--;
}}

//DIRECTIONAL BUTTONS TO MOVE CUBE (unconventional)
if(keyPressed){
  if(key =='s'){
ymov = ymov + 10;
}} 
if(keyPressed){
  if(key =='x'){
ymov = ymov - 10;
}} 
if(keyPressed){
  if(key =='z'){
xmov = xmov - 10;
}} 
if(keyPressed){
  if(key =='c'){
xmov = xmov + 10;
}}



//take a picture of your work!
   if (keyPressed) {
    if (key == 'v') {
      if(frameNum%2==0){
        saveFrame("saved/frame-####.tga");
      }
    }
   }
else{
  //the actual shape! The whole project started out with an ellipse.
  //I moved on to a rectangle and then finally moved on to a box.
  //Controls to have fun with an ellipse are still intact.
//  ellipse(c,d,a,b);
//  rect(c,d,a,b);
  translate(e, f, 0);
  box(a,b,z);
}
  angle+=0.1;
}



