
int r = 10; //radius
float cR = 120; //red
float cG = 255; //green
float cB = 120; //blue

void setup(){
 background(255);
 size(500,500);
 smooth(); 
 
}

void draw(){

 ellipseMode(RADIUS);
 //drawing circles with radius r, with colored stroke but no filling
 stroke(cR,cG,cB,200);
 strokeWeight(1);
 noFill();
 ellipse(249,249,r,r);
 
 //changing radius of circles
 
   //enlarge automatically
 if(mousePressed == false && r < 350){
   r = r + 2;
 }
 
   //reduce when mouse is pressed
 if(mousePressed == true && r>0){
   r = r - 2;
 }
 
   //prevent radius to reach -ve value
 if(r==0 && mousePressed == true){
   r = 0;
 }
 
 
//random color change for each 50px interval 
 if(r == 50 ||r == 100 ||r == 150 ||r == 200 ||r == 250 ||r == 300){
   cR = random(255);
   cG = random(255);
   cB = random(255);
 };

}



