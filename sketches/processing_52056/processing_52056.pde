
void setup (){
size (500,500);
smooth ();
}


void draw(){
  background (255,255,255);
  fill(0);
  
  float mx = map (mouseX, 0, width, 30, 5);
  
  
line (245,32,245,381);
line (112,109,372,109);
line (168,270,328,270);


line (157,340,338,300);


line (244,110,228,269);
line (246,110,266,271);


//eyes
fill(random(100,255));
if ((mousePressed == true) && (mouseButton == LEFT)) {
   fill(random(100,255)); 
  }
 else{
  fill(0); 
  }
ellipse (167,109, mx,mx);
ellipse (316,109, mx,mx);
 
 

fill(0);
ellipse (227,270, 10, 10);
ellipse (265,270,10,10);
ellipse (111,109,5,5);
ellipse (371,109,5,5);
ellipse (245,381,5,5);

noFill();
arc ( 167,109,60,60,TWO_PI-PI/2, TWO_PI);
arc ( 316,109,60,60,PI, TWO_PI-PI/2);

}


