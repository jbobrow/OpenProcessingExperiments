
PImage img;
int value = 0;

// Don't worry about understanding the code below!
 // You only need to know that you will use the Volume
 import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }

 //-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; // Sensitivity = standard is 0.2*volumeF
 }

 //-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();
 } 

void setup(){
  setupAudio();
size (600, 600);
// noLoop();
smooth();
img = loadImage ("1234.jpg");
background (173,255,247);


}

void draw(){
    println(mouseX,":",mouseY);
 //image (img, 0, 0);
   
 stroke(0);


// head and body

strokeWeight(2);
fill(254,255,72);
rect(128,146,300,300);
fill(255);
rect(128,330,300,80);
fill(160,125,48);
rect(128,380,300,70);
fill(255);
ellipse(320,200,90,60);

getVolume(); // this call fetches the microphone volume for the current frame.
float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.
fill(158,173,54);
ellipse(373,291,X,Y);
fill(158,173,54);
ellipse(334,300,X,Y);

//skin
strokeWeight(0);
fill(158,173,54);
ellipse(150,177,35,25);
fill(158,173,54);
ellipse(156,205,20,15);
fill(158,173,54);
ellipse(402,200,20,15);
fill(158,173,54);
ellipse(162,293,30,25);
fill(158,173,54);
ellipse(191,301,20,15);






//eyes

float eyeLeftX = constrain (mouseX,282,341);
float eyeLeftY = constrain (mouseY,170,218);
float eyeRightX = map(mouseX,0,width,282,341);
float eyeRightY = map(mouseY,0,width,170,341);


strokeWeight(2);
fill(255);
ellipse(230,200,90,70);
fill(255);
ellipse(320,200,90,70);

fill(88,133,255);
ellipse(eyeLeftX,eyeLeftY,35,30);
fill(88,133,255);
ellipse(eyeLeftX-80,eyeLeftY,35,30);
fill(0);
ellipse(eyeLeftX,eyeLeftY,20,15);
fill(0);
ellipse(eyeLeftX-80,eyeLeftY,20,15);



//eye brow
strokeWeight(7);
line(197,163+(random(-5,3)),203,170);
line(227,155+(random(-5,3)),226,164);
line(256,161+(random(-5,3)),253,168);
line(292,158+(random(-5,3)),297,168);
line(320,153+(random(-5,3)),319,164);
line(320,153+(random(-5,3)),319,164);
line(348,159+(random(-5,3)),342,166);

//face
 strokeWeight(4);
 stroke(255,90,104);
fill(254,255,72);
bezier(184,244,188,216,213,217,221,242);
stroke(255,90,104);
fill(254,255,72);
bezier(359,246,349,217,331,228,324,245);
fill(254,255,72);
ellipse(196,235,3,2);
fill(254,255,72);
ellipse(209,234,3,2);
fill(254,255,72);
ellipse(201,241,3,2);
fill(254,255,72);
ellipse(338,240,3,2);
fill(254,255,72);
ellipse(349,239,3,2);
fill(254,255,72);
ellipse(344,245,3,2);


//nose

 strokeWeight(4);
 stroke(0);
fill(254,255,72);
bezier(266,231,266,198,290,209,288,233);

//lip

strokeWeight(2);
stroke(0);
fill(254,255,72);
bezier(199,244,204,241+(random(-5,3)),208,239,212,240);
fill(254,255,72);
bezier(332,244,337,244+(random(-5,3)),340,245,348,249);
fill(254,255,72);
bezier(332,244,337,244,340,245,348,249);
fill(254,255,72);
bezier(204,242,247,261,291,262,339,246);

//clothes

strokeWeight(2);
line(221,331,254,347);
line(254,347,260,330);
line(292,330,306,345);
line(306,345,330,331);
fill(255,3,24);
bezier(260,330,271,340,286,336,292,330);
fill(0);
rect(148,390,50,10);
fill(0);
rect(229,389,90,10);
fill(0);
rect(347,388,50,10);
fill(255,3,24);
quad(276,335,257,398,276,417,299,400);



if(mousePressed){

fill(255);
rect(254,257,20,15);
fill(255);
rect(280,257,20,15);



//background shap & bonus score
 
  float a=random(300);
    float b=random(255);
    float c=random(300);
    float d=random(255);
    
   fill(random(255),100,200);


    fill(constrain(mouseX,mouseY,a),b,c);
    strokeWeight(0);
   rect(pmouseX,pmouseY,50,50);
 

  
}
    }
     
 
void keyPressed(){
setup();
 
 }

