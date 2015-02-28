
void setup(){
  size(800,200);
  smooth();
}

void draw(){
  background(255);

syringe(10, 0, color(255, 0, 28), 5, 127);
syringe(60, 0, color(255, 26, 0), 10, 125);
syringe(110, 0, color(255, 12, 0), 15, 122);
syringe(160, 0, color(255, 60, 0), 20, 120);
syringe(210, 0, color(255, 70, 0), 25, 118);
syringe(260, 0, color(255, 0, 90), 30, 116);
syringe(310, 0, color(255, 0, 0), 35, 112);
syringe(360, 0, color(255, 0, 12), 40, 110);
syringe(410, 0, color(255, 0, 20), 45, 108);
syringe(460, 0, color(255, 0, 30), 50, 106);
syringe(510, 0, color(255, 0, 40), 55, 102);
syringe(560, 0, color(255, 0, 0), 60, 100);

noLoop();

}

void syringe(float x, float y, color c, float level, float blood){
 noFill();
 pushMatrix();
 translate(x,y);
 
 

  
  //plunger top

rectMode(CENTER);  
rect(30, 12, 20, 5);

 
 //body top

rectMode(CENTER);  
rect(30, 38, 30, 3);

 //plunger stem

rectMode(CENTER);  
rect(30, 25, 5, 30);

 //body fill
fill(c);
noStroke();
rectMode(CENTER);  
rect(30, blood, 20, level);

 //body main
noFill(); 
stroke(1);
rectMode(CENTER);  
rect(30, 85, 20, 90);

//needle top

rectMode(CENTER);  
rect(30, 132, 20, 5);

//needle mid

rectMode(CENTER);  
rect(30, 138, 10, 5);

//needle mid

rectMode(CENTER);  
rect(30, 138, 10, 5);

//needle

rect(30, 165, 1, 45);

//markings
line(20, 45, 32, 45);
line(20, 55, 32, 55);
line(20, 65, 32, 65);
line(20, 75, 32, 75);
line(20, 85, 32, 85);
line(20, 95, 32, 95);
line(20, 105, 32, 105);
line(20, 115, 32, 115);
line(20, 125, 32, 125);




popMatrix();
}

