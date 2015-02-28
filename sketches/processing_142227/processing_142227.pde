
void setup () {
  background(255,255,255);
  size(600,600);
 // noLoop ();
  smooth ();
}


void draw () {
  
 
colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);



    println(mouseX,":",mouseY);
fill(254, 238, 231);
strokeWeight(3);
ellipse(284, 267, 330, 330);

fill(255, 0, 0);
strokeWeight(3);
ellipse(288, 365, 134, 51);


fill(255, 0, 0);
triangle(201, 74, 281, 216, 358, 76);

//eyes


float eyeLeftX = constrain (mouseX,310,330); 


float eyeLeftY = constrain (mouseY,215,203); 


float eyeRightX = map(mouseX,0,width,149,208); 


float eyeRightY = map(mouseY,0,width,199,203); 


fill(0);
ellipse(eyeLeftX,eyeLeftY,30,27);

ellipse(eyeLeftX-90,eyeLeftY,44,44);


fill(255, 0, 0);
strokeWeight(3);
ellipse(288, 365, 134, 51);


float w = random(-10,10);
  w=random(-10,10);

fill(255,255,255);
rect(250+w,340+w,24,21);

if(mousePressed){ 

fill(mouseX,mouseY,0);   


 translate(mouseX, mouseY);   



 fill(mouseX,50,mouseY,50);   


stroke(0, 0, 0);  
strokeWeight(1);  
  beginShape();   
  vertex(0, -50);  
  vertex(14, -20);   
  vertex(47, -15);   
  vertex(23, 7);   
  vertex(29, 40);   
  vertex(0, 25);   
  vertex(-29, 40);   
  vertex(-23, 7);   
  vertex(-47, -15);   
  vertex(-14, -20);   
  endShape(CLOSE);   


}

}

// Don't worry about understanding the code below!
 // You only need to know that you will use the Volume
 /* import ddf.minim.*;

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

