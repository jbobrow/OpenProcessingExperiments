
PImage img;
int value = 0;


void setup(){
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
fill(158,173,54);
ellipse(373,291,40,35);
fill(158,173,54);
ellipse(334,300,20,15);


//eyes
strokeWeight(2);
fill(255);
ellipse(230,200,90,70);
fill(255);
ellipse(320,200,90,70);
fill(88,133,255);
ellipse(241,210,35,30);
fill(88,133,255);
ellipse(310,210,35,30);
fill(0);
ellipse(241,210,20,15);
fill(0);
ellipse(310,210,20,15);



//eye brow
strokeWeight(7);
line(197,163,203,170);
line(227,155,226,164);
line(256,161,253,168);
line(292,158,297,168);
line(320,153,319,164);
line(320,153,319,164);
line(348,159,342,166);

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
bezier(199,244,204,241,208,239,212,240);
fill(254,255,72);
bezier(332,244,337,244,340,245,348,249);
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

ellipse(241,210,35,30);
ellipse(310,210,35,30);
fill(0);
ellipse(241,210,20,15);
fill(0);
ellipse(310,210,20,15);


    fill(constrain(mouseX,mouseY,a),b,c);
    strokeWeight(0);
   rect(pmouseX,pmouseY,50,50);
 

  
}
    }
     
 
void keyPressed(){
setup();
 
 }


