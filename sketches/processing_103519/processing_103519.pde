
PImage img;
void setup(){
  size(1000,1000);
img = loadImage("1000,1000 sucai-01.jpg");
}


void draw(){
 image(img,0,0,1000,1000); 
 
 noFill();
stroke(#7ECDE8,200);
strokeWeight(2);
   bezier(370,439,345,483,390,510,388,506);
   bezier(339,483,320,510,330,530,349,536);
   bezier(372,574,400,580,420,610,406,624);
   bezier(372,574,410,590,420,610,414,633);

noFill();
stroke(20,29); 
strokeWeight(10);
ellipse(364,536,130,130);

fill(#FF586E);//red start
noStroke();
ellipse(370,439,20,20);
ellipse(339,483,10,10);
ellipse(292,376,7,7);
ellipse(331,360,7,7);
ellipse(423,573,10,10);
ellipse(414,633,20,20);
ellipse(450,634,7,7);
ellipse(280,640,7,7);
ellipse(227,660,7,7);// red over

fill(#75F9FC);//blue start
noStroke();
ellipse(388,506,20,20);
ellipse(349,536,10,10);
ellipse(337,546,10,10);
ellipse(404,564,10,10);
ellipse(372,574,10,10);

fill(#FF932E,200);//orange start
noStroke();
ellipse(406,624,20,20);

fill(#B1FF6A);//green start
noStroke();
ellipse(446,495,10,10);
ellipse(441,529,10,10);
ellipse(441,415,10,10);
ellipse(361,429,10,10);

//noFill();
//stroke(#757673);
//strokeWeight(6);
//arc(400,450,700,700,HALF_PI,PI+HALF_PI);

ellipseMode(CENTER);
rectMode(CENTER);

  if (mousePressed) {
     fill(#DAF22C);
    noStroke();
    ellipse(mouseX,mouseY,20,20);

  } else{
         stroke(#CABEDE);
         strokeWeight(1);
noFill();
rect(mouseX,mouseY,20,20);
fill(255);
ellipse(mouseX,mouseY,10,10); 
 
  }
  
  fill(#C4C4C4);//name
noStroke();
rect(0,910,1000,90 );
    

}






