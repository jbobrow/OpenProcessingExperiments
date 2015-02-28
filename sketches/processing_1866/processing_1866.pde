

void setup(){
size(800,500);
noStroke ();
fill (0);
rect(0,0,width,height);


}

void draw(){
smooth();

for (int i = 0; i < 10; i++) {
  
flod();
delay (10);
}
//saveFrame("Flor1.png");



}


void flod (){

//pushMatrix();  
translate(random(width),random(height));

//fill(255,50);
//ellipse(0,0, width/14, width/14);
//fill (255,244,22);
//ellipse(0,0, width/20, width/20);

fill(random(255), random(255), random(255), random(255)); 


for (int i = 0; i < 15; i++) {

//rotate(PI/4); 
rotate (radians (360/15));
//strokeWeight(3);
//stroke(0,50);


ellipse(width/10,0,100,25);

//rotate(PI/4); 
//rotate (radians (360/8));
//strokeWeight(random (1,10));
//stroke(160,45,120);

//ellipse(width/14,0,100,25);


}
//popMatrix();
}




