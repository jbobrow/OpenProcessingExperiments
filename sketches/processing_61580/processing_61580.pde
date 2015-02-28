
float b=550;
float c=450;
float d=350;
float e=250;
float f=150;
float g=50;
PFont myfont;

void setup(){
  size(650,650);
  myfont= loadFont("AdobeFangsongStd-Regular-48.vlw");
}

void mousePressed(){ //wherever u click, circles are created (mouseDragged)
background(random(255),random(255),random(255));
fill(random(200),random(200),random(200));


 noStroke();
  fill(random(200),random(200),random(200));
  rect(50,50,b,b);
  
  noStroke();
   fill(random(150),random(150),random(150));
  rect(100,100,c,c);
  
   noStroke();
      fill(random(100),random(100),random(100));
  rect(150,150,d,d);
  
   noStroke();
      fill(random(50),random(50),random(50));
  rect(200,200,e,e);
  
   noStroke();
      fill(random(20),random(20),random(20));
  rect(250,250,f,f);
  
   noStroke();
      fill(random(15),random(15),random(15));
  rect(300,300,g,g);
  
  textFont(myfont);
  fill(random(100),random(100),random(100));
textSize(80);
text("Flashing",170,350);

}



void draw(){
 
  
   
}




void keyPressed(){
  fill(random(255),random(255),random(255));
; 
}


