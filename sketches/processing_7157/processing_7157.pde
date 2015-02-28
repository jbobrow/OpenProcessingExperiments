
float x = 0.0;
float y = 0.0;
float mx= 0.0;
float my= 0.0;
float easing = 0.05;
float x2= 0.0;
float y2= 0.0;

float r= 0.0;
int t1= 180;
int t2=100;
int t3= 180;
int t4= 100;
int q;

int w1=0; // colors
int w2=0;
int s = second ();

int i1;
int i2=0;

float p1;
float p2;
int p3=150;
int p4=250;

void setup () {
  size (640,480);
  smooth();
  strokeWeight (2);
  stroke (0);
}
  
  
  void draw () {
   
    background (40,50,115);

    noStroke();
    // Eyeballs
    strokeWeight (1);
    fill(0);
ellipse (200,180,t2,t1);
    
 ellipse (440,180,t4,t3);
    //Left Pupil
float targetX= constrain (mouseX, 150, 250);
float targetY= constrain (mouseY, 110, 250);
float dx= targetX-x;
float dy= targetY-y;
x += dx*easing;
y += dy*easing;
fill(255);
ellipse (x,y,60+r,60+r);
// Right pupil
targetX= constrain (mouseX, 390, 490);
targetY= constrain (mouseY,110,250);
dx= targetX-x2;
dy= targetY-y2;
x2 += dx*easing;
y2 += dy*easing;
strokeWeight (1);
ellipse (x2,y2,60+r,60+r);
    strokeCap (SQUARE);
    strokeWeight(10);
    stroke (0);
    line (160, 70-i1, 240, 70+i1);
    line (400, 70+i1, 480, 70-i1);

if (mousePressed == true){

  if (i1<75){
    i1 += 15*easing;}
  
w2 += 20*easing;
if (w1 < 200) {
  w1 += 20 *easing;}
  

r =40;  


}

stroke (255);
noFill();
strokeWeight (100);
ellipse (200,179,199,278);
ellipse (440,179,199,278);

//blinking eye left
 if (mouseX< 240) {
   if (mouseX> 160){
     if (mouseY >110) {
       if (mouseY < 250){
     fill (255);
     ellipse (200,180,120,200);
     stroke (0);
     strokeWeight (10);
     line (260,180,160,130);
     line (260,180,140,180);
     line (260,180,160,230);
     
   }
 }
   }
 }

//blinking eye right
 if (mouseX> 400) {
   if (mouseX< 500){
     if (mouseY >110) {
       if (mouseY < 250){
     fill (255);
     ellipse (440,180,120,200);
     stroke (0);
     strokeWeight (10);
     line (380,180,480,130);
     line (380,180,500,180);
     line (380,180,480,230);
     
   }
 }
   }
 }


}
  
void mouseReleased (){
  w1=0;
  w2= 0;
  r = 15*easing;
}
  

