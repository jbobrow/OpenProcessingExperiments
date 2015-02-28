
/* 
Thats what i love about processing
number of line to be drawn and drag. enjoy
on press s key you can save as many snap shots
pressing 1 to 4 will change color and background
and backspace and delete key will reset canvas
*/

//Global Varibales
color strokeColor = color(0,10);
int a = 0;
int w = 0;
PImage back;
PImage back2;
PImage back3;
PImage back4;
String tt = "Type s for multiple snap shot";
String tu = " 1-4: change background and color of texture";
String tv = "backspace and delete key for reset canvas";

//setup function
void setup()
{

size(800,600);
colorMode(HSB, 360,100,100,100);
noFill();
background(360);
//image
back = loadImage("back.jpg");
back2= loadImage("back2.jpg");
back3= loadImage("back3.jpg");
back4= loadImage("back4.jpg"); 
text(tt,10,width/2,height/2);
text(tu,15,1,1);
text(tv,20,1,1);

}

//draw function
void draw() {


  if (mousePressed){
    
pushMatrix();
translate(width/2, height/2);

int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
int radius = mouseX-width/2;
float angle = TWO_PI/circleResolution;

strokeWeight(2);
stroke(strokeColor);
beginShape();
for (int i=0; i<=circleResolution; i++) 
{
 float x = 0 + cos(angle*i) * radius;
 float y = 0 + sin(angle*i) * radius;
 vertex(x,y);
}
endShape();
popMatrix();
}
}
void keyReleased(){
if (key == DELETE || key == BACKSPACE)
background(360);
if (key == 's' || key == 'S')
saveFrame("screenshot"+ a +".jpg");
a++;
switch(key){
case '1':
  strokeColor = color(94,100,75,100);
    tint(255, 127);
  image(back,0,0,800,600);
  break;
case '2':
  strokeColor = color(192,100,64,30);
  tint(255, 127);
  noFill();
  image(back3,0,0,800,600);
  break;
case '3':
  strokeColor = color(52,100,71,50);
  fill(#FAED60);
  tint(255, 127);
  image(back2,0,0,800,600);
  break;
case '4':
  strokeColor = color(0,10);
  noFill();
  image(back4,0,0,800,600);
  break;
}


}


