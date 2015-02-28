
PShape p;
PShape t;
PShape u;
PShape s; 

PShape bTop;
PShape bEye;
PShape bMid;
PShape bLid;
void setup () {

size (640 , 480); 
smooth();
strokeWeight(80);


   p = loadShape("eyetop2.svg"); //load shape 
   t = loadShape("leopardeye_blink.svg"); //load shape eye puple
   u = loadShape("eye_under.svg"); //load shape eyebrow bottom
   s = loadShape("spots_under.svg"); //load shape spots
   
   
   bTop = loadShape("browTop.svg"); //load Top of eye brow
   bEye = loadShape("browEye.svg"); //load eye ball/pupil
   bMid = loadShape("browMid.svg"); //load Middle black fill of eye
   bLid = loadShape("browLid.svg"); //load bottom eye lid
   
 
 
 
 }

void draw() {
  background (255); 
  stroke (0);
 
 //Draw leapord eye 
 if (mouseX <320) {
    shape(t, -20, 170);

{
}

if (mouseY<200){
 shape(p,0,0);
}
if(mouseY>200)  {
 shape (p,0,20);
} 
if(mouseX>320){
shape (p,0,0);
}
 
    shape(u, 30,80);
    shape(s,30,80);
 }  
 if (mousePressed) {

        ellipse(270, 270, 110 ,60);
}  
    
  //Draw human eye
  


//if (mouseX >320);
//{
//           ellipse(300, 320, 110,70);
//}



  
if (mouseX>320){
if (mouseY<200){
 shape(bTop,0,0);
}
if(mouseY>200)  {
 shape (bTop,0,20);
} 


  if(mousePressed){
   shape(bTop,-20,20);
 
 }

    shape(bMid,0,-20);
    shape(bEye, 0,-20);
    shape(bLid,0,-20);
}
 }

