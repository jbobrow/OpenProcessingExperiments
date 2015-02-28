

/* 


 Konkuk University 


 SOS iDesign 


  


Name: An JunYeong 


ID: 201420088 


  


*/ 
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


background (#BCBCBC); 


  //noLoop(); 


  


smooth(); 


colorMode (RGB, 255); 


 } 


  


void draw(){ 

println(mouseX + " : " + mouseY); 

  


noStroke (); 

fill (#BCBCBC); 

rect (0,418,600,418); 
rect (0,0,600,348); 



fill (#393939); 
rect (0,358,600,60); 


 
fill (#7C7C7C); 

rect (0,348,600,10); 


  

noStroke (); 

fill (#1F4840); 
rect (205,507,182,44); 

  


noStroke (); 

fill (#C9570A); 
quad (201,407,161,492,423,507,388,412);
quad (161,492,193,514,299,529,301,496); 
quad (300,496,299,529,397,517,417,505); 


triangle (388,410,405,460,405,434); 
quad (406,434,404,462,416,493,418,458); 
triangle (418,458,424,493,406,485); 
triangle (203,403,184,429,183,448); 
quad (184,429,168,459,170,478,200,430); 
triangle (168,459,162,488,183,458); 
triangle (190,509,190,525,298,528); 
triangle (394,509,394,525,298,528); 


  


noStroke (); 


fill (#29641C); 
ellipse (297,406,180,72); 


  


strokeWeight (2); 


stroke (0); 


line (388,468,393,490); 
line (192,468,189,485); 


  


  


  


noStroke (); 


fill (#CBC690); 
ellipse (301,345,265,180); 


  


noStroke (); 


fill (255); 


ellipse (265,324,69,75); 
ellipse (340,324,69,75); 


  


float mx1 = constrain(mouseX,247,279); 
float mx2 = constrain(mouseX,325,362); 
float my = constrain(mouseY,308,354); 


getVolume(); 
float Y = map(volume, 0, 500, 2, 10);  
float X = map(volume, 0, 500, 2, 10); 

  


noStroke (); 


fill (0); 

ellipse (mx1,my,X,Y); 
ellipse (mx2,my,X,Y); 


  


noStroke (); 


fill (#2D8B11);
ellipse (177,501,40,40); 
ellipse (409,504,40,40); 

rect (166,205,268,95); 

quad (170,197,166,205,434,205,427,197); 

quad (170,197,427,197,408,188,193,188); 

quad (409,312,405,298,433,277,443,288); 

quad (409,311,443,288,460,316,422,339); 

quad (421,338,460,316,469,349,440,368); 

quad (440,368,469,349,470,371,454,378); 

quad (168,273,193,289,188,310,153,290); 

quad (188,310,153,290,136,320,176,336); 

quad (176,336,136,320,131,347,168,355); 

quad (131,347,168,355,148,377,134,373); 


  


noStroke (); 


fill (#29641C); 

rect (184,230,233,75); 

quad (184,230,417,230,410,224,189,224); 



stroke (#29641C); 
fill (#2D8B11); 

ellipse (186,491,15,15); 
ellipse (395,496,15,15); 


  


strokeWeight (1.4); 
stroke (0); 


line (204,397,232,413);
line (232,413,262,422); 
line (262,422,286,425); 
line (286,425,320,424); 
line (320,424,364,414); 
line (364,414,386,403); 
line (284,414,297,415); 
line (297,415,311,415); 
line (311,415,323,414); 


  


strokeWeight (2.5); 
stroke (0); 
line (297,442,298,528); 
line (225,457,246,478); 
line (267,457,246,478); 
line (325,457,346,478); 
line (367,457,346,478); 


  


strokeWeight (3.0); 
stroke (0); 

line (192,549,402,549); 
line (205,547,387,547); 
line (212,546,291,546); 
line (305,546,383,546); 


  


strokeWeight (4); 


line (284,402,302,398); 
line (302,398,310,398); 
line (310,398,322,406); 
line (322,406,284,402); 


  


noStroke (); 
fill (0); 
quad (284,402,302,398,310,398,322,406); 
strokeWeight (2.5); 
stroke (0); 
noFill (); 
rect (225,457,42,42); 
rect (325,457,42,42); 


  


 } 


   


void keyPressed(){ 


 } 


