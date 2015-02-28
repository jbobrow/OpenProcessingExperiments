
//WORKSHOP 3b

//Global Variables

int val = 100;
int rad;
float x = 100;
float a = 20;
float distance;
float mx, my; //mouth x and y
float ex, ey, rx; //eyes
float ed, pd;
float gx, gy, gz; //glasses
float gh, gw;

//Setup

void setup() {
size(600, 600);
smooth();
ellipseMode(RADIUS);
rad = 60;
mx = 210;
my = 338;
ex = 215;
ey = 152;
rx = 376; //right eye x coordinate
ed = 20; //outer diameter
pd = 10; //pupil diameter
gx = 142; //glasses
gy = 117;
gz = 338;
gh = 120;
gw = 100;
}


void draw(){
  background(255);
  strokeWeight(14);
  if(mouseY < 300)
{ 
  strokeWeight(20+a);
  rect(gx-x,gy, gh+x,gw+x); //glasses
  rect(gz,gy, gh+x,gw+x);
  line(271,140+x, 334,140+x);
  
 distance = dist(mouseX, mouseY, ex-(x/2), ey+(x/2));
 if(distance < rad){
   fill(0);
   ellipse(ex-(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }else{
   fill(255);
   ellipse(ex-(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }
   if (mousePressed && distance < rad) {
   fill(200, 23, 12);
   ellipse(ex-(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }
  
  strokeWeight(6+a); //eyes
  ellipse(ex-(x/2),ey+(x/2), ed+(x/2),ed+(x/2));//left eye
  ellipse(ex-(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
  
   distance = dist(mouseX, mouseY, rx+(x/2), ey+(x/2));
 if(distance < rad){
   fill(0);
   ellipse(rx+(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }else{
   fill(255);
   ellipse(rx+(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }
   if (mousePressed && distance < rad) {
   fill(20, 20, 200);
   ellipse(rx+(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
 }
 
  ellipse(rx+(x/2),ey+(x/2), ed+(x/2),ed+(x/2));//right eye
  ellipse(rx+(x/2),ey+(x/2), pd+(x/2),pd+(x/2));
  
  beginShape(); //nose
    fill(255);
    strokeWeight(4);
    vertex(282,143+x);
    vertex(282-x,306+x);
    vertex(320+x,306+x);
    vertex(320,143+x);
   endShape();
   
    noFill();
   strokeWeight(x/2); //mouth
   rect(mx-x/3,my+x, 242,6+x);
   
   if(mouseY<400){
   strokeWeight(2);
   for (int i=195; i<=405; i+=5) {
  line(i,405+x/10, i,410+x+10);
   }
   }
}
  else {
  strokeWeight(20); //glasses
  rect(gx,gy, gh,gw);
  rect(gz,gy, gh,gw);
  line(271,140, 336,140);
  
  strokeWeight(6);
  ellipse(ex,ey, ed,ed);//left eye
  ellipse(ex,ey, pd,pd);
  ellipse(rx,ey, ed,ed);//right eye
  ellipse(rx,ey, pd,pd);
  
  beginShape(); //nose
    noFill();
    strokeWeight(4);
    vertex(282,143);
    vertex(282,mouseX);
    vertex(320,mouseX);
    vertex(320,143);
   endShape();
   
   strokeWeight(2); //mouth
   rect(mx,my, 186,12);
   strokeWeight(1);
for (int i=195; i<=405; i+=5) {
  line(i,405, i,410);
  
}if ((mouseY > 460) && (mouseY < 590) && (mouseX > 50) && (mouseX < 550)){
    for (int i=195; i<=405; i+=5) {
  line(i,405, i,410);}
  float mx = map(mouseX, 0, width, 0, 600);
  for (int i=195; i<=405; i+=5) {
  line(i,405, mx,mouseY);
    }
    
}
 }
}

   


/*




//beard

strokeWeight(1);
for (int i=195; i<=438; i+=5) {
  line(i,405, i,410);
}

*/


