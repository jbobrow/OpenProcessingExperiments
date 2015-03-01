
float center = 300; 

void setup() {

//float center = 300;

size(600,600);
background(252, 255, 56);
}

void draw(){
 //float center = 300; 
  
//ellipseMode(CENTER);
fill(255, 201, 110);
stroke(255, 148, 25);
strokeWeight(6);
ellipse(300,300,300,350);

fill(255,255,255);
noStroke();
ellipse(center-50,center-50,50,50);
ellipse(center+50,center-50,50,50);

fill(0,0,0);
ellipse(center-50,center-50,25,30);
ellipse(center+50,center-50,25,30);

fill(255,255,255);
ellipse(center-55,center-55,10,10);
ellipse(center+45,center-55,10,10);

fill(255, 36, 47);
stroke(255,255,255);
arc(center, center+40, 80, 80, 0, 3.14);

 




}





