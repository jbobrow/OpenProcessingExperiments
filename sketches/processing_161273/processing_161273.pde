

//certain things happen when mouse is in certain area//
 
/*
void setup() {
size(400,400);
background(255,255,0);
 
}
 
void draw() {
 
rect(180,180,50,50);
fill(0,255,255);
 
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
    }
}
*/
//mousePressedDemo
PImage sad;
PImage happy;
 
void setup() {
size(400,400);
sad= loadImage("http://www.nycgo.com/images/460x285/TimesSquareSummer_460x285.jpg");
happy = loadImage("http://students.marshall.usc.edu/undergrad/files/2012/04/Selling-Your-Los-Angeles-Home1.jpeg");
text("Which is Better", 60, 80); 
}
void draw(){
if(mousePressed==true){
image(sad,0,0);
}else{
image(happy,0,0);
}
}














