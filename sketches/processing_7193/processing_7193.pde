
float gray = 0;

void setup() {
  size(640,480);
  smooth();
 
}

void draw() {
 background(240,177,17);
fill(255);



//eyeballs
strokeWeight(12);
 ellipse(200, 150, 160, 160);
 ellipse(400, 150, 160, 160);


//glasses 
 if (mousePressed) {
  gray +=5;

 }fill(gray); 
 ellipse(200, 150, 160, 160);
 ellipse(400, 150, 160, 160);
 
 //float x= map(mouseX, 0, width, 100, 300);
 
//pupil #1
float mx = constrain(mouseX, 170, 200);
float my = constrain(mouseY, 150, 170);
fill(0);
 ellipse(mx, my, 40, 60);
 

 //pupil #2
 float mxx = constrain(mouseX, 400, 430);
 float myy = constrain(mouseY, 150, 170);
 fill(0);
 ellipse(mxx, myy, 40, 60);



//glasses arc
strokeWeight(8);
noFill();
arc(300,155,40,40,TWO_PI-PI, TWO_PI);

//eyelids
strokeWeight(3);
noFill();
arc(400,150,140,140,TWO_PI-PI, TWO_PI);
arc(200,150,140,140,TWO_PI-PI, TWO_PI);


//winking/blushing
if ((keyPressed == true) && (key == 'a')) {
  strokeWeight(0);
  fill(255);
  ellipse(400,150,150,150);
  
  strokeWeight(3);
noFill();
arc(400,145,140,140, 0, PI);

strokeWeight(0);
fill(247,80,83,95);
ellipse(200,300,90,90);
ellipse(400,300,90,90);
fill(237,207,141,97);
ellipse(400,145,142,142);

}




}

 



