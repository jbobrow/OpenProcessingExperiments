



PImage img;
PImage tweet;
PImage google;
PImage cv;
PImage Facebook;
PImage StageJobs;
PImage LinkedIN;
PImage SatgeJobs;
PImage Processing;
PImage Contact;
PImage Web;


int click = 1 ;
float easing = 0.05;
float Radius = 80;
float miniRadius = 15;
float grow,growGoogle,growSJP,growCV,growFB,growWebsite, growLinkedin, growOP = 25;
float grow2 = 25;
float opacity = 100;
float a1,a2,b1,b2,c1,c2,d1,d2,e1,e2,f1,f2,g1,g2,h1,h2;
float LimitN = 150;
float LimitNE = 100;
float LimitE = 150;
float LimitSE = 100;
float LimitS = 150;
float LimitSW = 100;
float LimitW = 150;
float LimitNW = 100;
float redA,greenA,blueA = 0;
float redB,greenB,blueB = 0;
float redC,greenC, blueC= 0;
float redD,greenD,blueD = 0;
float redE,greenE,blueE = 0;
float redF,greenF,blue = 0 ;
float redG,greenG,blueG = 0;
float redH,greenH,blueH = 0;
float strokeA =100;


void setup(){
  size(400,400);
  background(255);
  ellipseMode(RADIUS);
  img = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/CircleCam2.png");
  tweet = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/twitter2.png");
  google = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/google.png");
  cv = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/CV1.png");
  Facebook = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/Facebook1.png");
  LinkedIN = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/LinkedIn.png");
  StageJobs = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/SJP1.png");
  Processing = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/Processing.png");
  Contact = loadImage("Contact.png");
  Web = loadImage("http://www.cameronmckirdy.co.uk/wp-content/uploads/2014/10/Web.png");
 

}



  
 void mouseReleased(){

 click= 1 ; 

}





 




  

   
 void draw(){
  
   
  
 
   background(255);


   
   
 

 

  

float startPX = width/2; //Start Point X 
float startPY = height/2; //Start Point Y
float between = dist(mouseX,mouseY,startPX,startPY);
   

   noFill();
beginShape();
vertex(a1, a2);
vertex(h1, h2);
vertex(d1, d2);
vertex(c1, c2);
vertex(b1, b2);
vertex(g1, g2);
vertex(e1, e2);
vertex(f1, f2);
vertex(a1, a2);
endShape(CLOSE);
   
   stroke(0,0,0);
   
   
   
   image(tweet,a1-15,a2-15,miniRadius*2,miniRadius*2);
   image(google,b1-15,b2-15,miniRadius*2,miniRadius*2);
   image(Facebook,c1-15,c2-15,miniRadius*2,miniRadius*2);
   image(cv,d1-15,d2-15,miniRadius*2,miniRadius*2); 
   image(StageJobs,e1-15,e2-15,miniRadius*2,miniRadius*2); 
   image(Processing,f1-15,f2-15,miniRadius*2,miniRadius*2);
   image(Processing,f1-15,f2-15,miniRadius*2,miniRadius*2);
   image(LinkedIN,g1-15,g2-15,miniRadius*2,miniRadius*2);
   image(Web,h1-15,h2-15,miniRadius*2,miniRadius*2);
   
   image(img,125,125,miniRadius*10,miniRadius*10);
  
     

   
   
//Hover Movement

if (between < Radius+70) {
 a1 = a1 + 4.9;
 a2 = a2 + 4.9;
 b1 = b1 - 3.05;
 b2 = b2 - 3.05;
 c1 = c1 - 4;
 d1 = d1 - 4;
 d2 = d2 + 4;
 e1 = e1  + 6.4;
 e2 = e2  - 6.4;
 f1 = f1  + 6.5;
 g2 = g2 - 3.5;
 h2 = h2 + 5;

 
}
 
 else {
   
 a1 = a1 - 5;
 a2 = a2 - 5;
 b1 = b1 + 5;
 b2 = b2 + 5;
 c1 = c1 + 6;
 d1 = d1 + 5;
 d2 = d2 - 5;
 e1 = e1  - 5;
 e2 = e2  + 5;
 f1 = f1  - 6;
 g2 = g2 + 5;
 h2 = h2 - 5;
 
   
 } 
 
 // a Limiter

if (a1 > (startPX+LimitSE)) {
a1 = startPX+LimitSE;
a2 = startPY+LimitSE;
   }
   
   // b Limiter 
if  (b1 < (startPX-LimitNW)){
b1 = startPX-LimitNW;
b2 = startPY-LimitNW;
}

   // c Limiter 
if  (c1 < (startPX-LimitW)){
c1 = startPX-LimitW;
c2 = startPY;
}

// d Limiter 
if  (d1 < (startPX-LimitSW)){
d1 = startPX-LimitSW;
d2 = startPY +LimitSW;
}

// e Limiter 
if  (e1 > (startPX+LimitNE)){
e1 = startPX+LimitNE;
e2 = startPY - LimitNE;
}
  // f Limiter 
if  (f1 >(startPX+LimitE)){
f1 = startPX+LimitE;
f2 = startPY;
}
   // g Limiter 
if  (g2 <(startPY-LimitN)){
g1 = startPX;
g2 = startPY-LimitN;
}

   // h Limiter 
if  (h2 >(startPY+LimitS)){
h1 = startPX;
h2 = startPY+LimitS;
}

// Part 2 
// a Limiter

if ( a1 < startPX) {
a1 = startPX ;
a2 = startPY ;
   }
   
   // b Limiter 
if  (b1 > startPX){
b1 = startPX;
b2 = startPY;
}

   // c Limiter 
if  (c1 > startPX){
c1 = startPX;
c2 = startPY;
}

// d Limiter 
if  (d1 > startPX){
d1 = startPX;
d2 = startPY;
}

// e Limiter 
if  (e1 < startPX){
e1 = startPX;
e2 = startPY;
}
  // f Limiter 
if  (f1 < startPX){
f1 = startPX;
f2 = startPY;
}
   // g Limiter 
if  (g2 > startPY){
g1 = startPX;
g2 = startPY;
}

   // h Limiter 
if  (h2 < startPY){
h1 = startPX;
h2 = startPY;
}






 

float betweenA = dist(mouseX,mouseY,a1,a2);
float betweenB = dist(mouseX,mouseY,b1,b2);
float betweenC = dist(mouseX,mouseY,c1,c2);
float betweenD = dist(mouseX,mouseY,d1,d2);
float betweenE = dist(mouseX,mouseY,e1,e2);
float betweenF = dist(mouseX,mouseY,f1,f2);
float betweenG = dist(mouseX,mouseY,g1,g2);
float betweenH = dist(mouseX,mouseY,h1,h2);



// twitter activator

if (betweenA < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(a1,a2,grow2,grow2);

grow = grow + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
grow = miniRadius;
grow2 = miniRadius;

  
}

if (grow >= 30 && grow < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!
  
  link("https://twitter.com/CamMckirdy", "_new");   
}


// Google activator

if (betweenB < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(b1,b2,grow2,grow2);

growGoogle = growGoogle + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growGoogle = miniRadius;
grow2 = miniRadius;

  
}

if (growGoogle >= 30 && growGoogle < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!
 
    link("https://plus.google.com/u/0/+CameronMckirdy1992/about", "_new"); 
  
 
  
}
  

// Facebook activator

if (betweenC < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(c1,c2,grow2,grow2);

growFB = growFB + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growFB = miniRadius;
grow2 = miniRadius;

  
}

if (growFB >= 30 && growFB < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

       link("https://www.facebook.com/CamMckirdy", "_new"); 
 
  
}
  
  // CV activator

if (betweenD < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(d1,d2,grow2,grow2);

growCV = growCV + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growCV = miniRadius;
grow2 = miniRadius;

  
}

if (growCV >= 30 && growCV < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

       link("http://cameronmckirdy.co.uk/Camerons_CV.pdf", "_new");  
 
  
}
  



  
  // SJP activator

if (betweenE < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(e1,e2,grow2,grow2);

growSJP = growSJP + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growSJP = miniRadius;
grow2 = miniRadius;

  
}

if (growSJP >= 30 && growSJP < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

      link("http://www.stagejobspro.com/uk/compose.php?uid=624640", "_new");    
 
  
}

  // Processing activator

if (betweenF < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(f1,f2,grow2,grow2);

growOP = growOP + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growOP = miniRadius;
grow2 = miniRadius;

  
}

if (growOP >= 30 && growOP < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

 link("http://www.openprocessing.org/user/40513", "_new");  
  
}


 // Processing activator

if (betweenG < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(g1,g2,grow2,grow2);

growLinkedin = growLinkedin + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growLinkedin = miniRadius;
grow2 = miniRadius;

  
}

if (growLinkedin >= 30 && growLinkedin < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

      link("uk.linkedin.com/in/cameronmckirdy/", "_new");    
  
}


 // Processing activator

if (betweenH < miniRadius & mousePressed) {

stroke(0,0,0,strokeA);
ellipse(h1,h2,grow2,grow2);

growWebsite = growWebsite + 5;
grow2 = grow2 +1;
strokeA = strokeA - 1;

}

else {
stroke(0,0,0,strokeA);
strokeA = 100; 
growWebsite = miniRadius;
grow2 = miniRadius;

  
}

if (growWebsite >= 30 && growWebsite < 35){  //The Bit that makes it work!!!! Make sure you add the max value so it cant be added more than once!

      link("www.cameronmckirdy.co.uk", "_new");    
  
}


 }





 

