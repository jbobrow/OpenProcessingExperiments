
/*
 Konkuk University
 SOS iDesign

Name: KIM Jieun
 ID: 201420072

*/
int value = 0;

void setup(){
setupAudio();
size (600, 600);
  //noLoop();
smooth();
background(201,229,225);
 }


void draw(){
getVolume(); 
 float Y = map(volume, 0, 200, 2, 100); 
 float X = map(volume, 0, 200, 2, 200); 
 background(201,229,225);
 colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);

   
 println(mouseX+" : " + mouseY);

//draw a face

 fill(255,255,255);
 strokeWeight(4);
 ellipse(295,304,265,278);
 fill(247,224,47);
 strokeWeight(4);
 ellipse(295,304,240,253);

 
 //draw a eye
 float eyeLeftX = constrain(mouseX,345,375);
 float eyeLeftY = constrain(mouseY,250,300);
 float m = map(value,300,100,400,200);
 float eyeRightX = map(mouseX,0,width,183,285);
 float eyeRightY = map(mouseY,0,width,214,335);
 
 fill(255,255,255);
 ellipse(eyeLeftX,eyeLeftY,82,80);
 ellipse(eyeLeftX-130,eyeLeftY,82,80);
 
 
 fill(5,5,5);
 ellipse(eyeLeftX,eyeLeftY,7,7);
 ellipse(eyeLeftX-130,eyeLeftY,7,7);


 //draw a nose
  getVolume(); 
 float Y = map(volume, 0, 200, 2, 100); 
 float X = map(volume, 0, 200, 2, 200); 
 
 fill(5,5,5);
 ellipse(293,303,X,Y);
 fill(247,224,47);
 bezier(258,321,267,343,293,345,297,319);
 bezier(297,319,312,343,327,333,335,313);
 
 //draw a mouse
 fill(196,14,14);
 bezier(283,339,296,406,316,413,315,334);
 
 //draw a ear
 fill(255,255,255);
 bezier(208,195,X+100,75,192,Y+50,248,171);
 bezier(319,164,X+360,51,402,Y+50,362,180);
  //noLoop();
 fill(247,120,173);
 bezier(218,189,X+120,97,191,Y+70,234,179);
 bezier(330,168,X+360,78,383,Y+90,350,176);
 
 
if(mousePressed){

//draw a hand
 fill(247,224,47);
 bezier(378,335,403,234,467,261,410,348);
 bezier(378,335,443,340,452,423,388,457);
 bezier(388,457,341,452,329,415,370,414);
 bezier(370,414,328,401,331,376,375,373);
 bezier(375,373,333,366,336,341,378,335);
 line(375,373,399,377);
 noStroke();
 triangle(387,383,380,455,363,402);
 triangle(384,414,394,448,379,451);
   
   
 float x=random(600); 
 float y=random(255); 
 float z=random(400); 
 float w=random(255); 

 fill(constrain(mouseX,mouseY,x),y,z); 
 noStroke();
 ellipse(mouseX,mouseY,80,80); 
 bezier(283,339,296,406,316,413,315,334);
 bezier(218,189,X+120,97,191,Y+70,234,179);
 bezier(330,168,X+360,78,383,Y+90,350,176);
 
 //noLoop();

 stroke(0);
 line(360,412,387,416);

    }
}


void keyPressed(){ 
  setup(); 

} 



/*Audio
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
 /*


