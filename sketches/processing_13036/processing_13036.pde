
boolean button =false;
boolean button2=false;
boolean button3=false;

int x=50;
int y=50;
int w=100;
int h=75;

float speed = 2;
float r = 5;
float branchLength = 40;
int numBranches = 7;
 
void setup(){
  size(400,600);
  frameRate(5);
}
void draw(){
float r=random(255);
float g=random(255);
float b=random(255);
  
  if(mouseX>x && mouseX< x+w && mouseY>y && mouseY<y+h && mousePressed){
    button =true;
  }else{
    button = false;
  }
  if (button) {
    background(b,r,g);
    stroke(0);
  }else{
    background(255);
    stroke(0);
  }
  fill(r,g,b);
  frameRate(5);
  ellipse(x,y,w,h);
  
 if(mouseX>100 && mouseX<width && mouseY>100 && mouseY<height && mousePressed){
  button2 =true;
 }else{
   button2=false;
// }
//  if (button2){
//    background(g,b,r);
//    stroke(0);
//  }else{
//    background(255);
//    stroke(0);
  }
  fill(b,g,r);
  ellipse(x+280,y+200,w,h);
  ellipse(x+380,y+230,w,h);
  fill(r,b,g);
  frameRate(26);
  ellipse(x+150,y+400,w+50,h+50);
  
 if(mouseX>x && mouseX<150 && mouseY>150 && mouseY<height && mousePressed){
   button3=true;
 }else{
   button3=false;
 }
 fill(g,r,b);
 ellipse(x,y+300,w,h);
 
// fill(#111111, 2);
//  rect(0, 0, width, height);
   
 fractal(width/4, height/2, 10, numBranches);
r += speed;
}
 
void fractal(float x, float y, float a, int c)
{
  float nx = x + branchLength  * cos(a);
  float ny = y + branchLength  * sin(a);
   
  if (c >= 1 && c != 6) {
    strokeWeight(1);
    stroke(#ffffff, 150);
    line(x, y, nx, ny);
  }
 
  if (c < numBranches) {
    stroke(#19888C, 90);
   fill(#ffffff, 250);
   ellipse(x, y, 30, 30);
    
   noStroke();
    stroke(#2EF7FF, 20);
    fill(#19888C, 8);
    ellipse(x, y, 100, 100);
  }
   
 if (c > 0) {
    fractal(nx, ny, (a + r / 3) * -3, c - 1);
    fractal(nx, ny, (a - r / 3) * -3, c - 1);
    
    //
    
    
    
  }
 }



