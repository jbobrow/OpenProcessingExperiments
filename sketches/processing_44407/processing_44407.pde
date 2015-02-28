
int stoploop = 0; 

void setup(){
  size(300,300);
  background(255);
  colorMode(HSB, 360, 100, 100, 1);
  frameRate(5);
  boolean stoploop = false; 
  
noStroke(); 
}



void draw(){
 //for (int i = 0; i <50; i++){
 float xa1 = random(0,150); 
 float ya1 = random(0,150); 
 float xa2 = random(150,300); 
 float ya2 = random(0,150); 
 float xa3 = random(0,150); 
 float ya3 = random(150,300); 
 float xa4 = random(150,300); 
 float ya4 = random(150,300); 
 
 float xb1 = random(250,150); 
 float yb1 = random(250,150); 
 float xb2 = random(150,350); 
 float yb2 = random(250,150); 
 float xb3 = random(250,150); 
 float yb3 = random(150,350); 
 float xb4 = random(150,350); 
 float yb4 = random(150,350); 

float huerand = random(0,360);

noStroke(); 
    fill(0,0,100,0.1);
 rect(0,0,300,300);
    noStroke();
    fill(huerand,100,100,0.3);
 quad(xa1, ya1, xa2, ya2, xa3, ya3, xa4, ya4);
    fill(0,0,100,0.3);
 quad(xb1, yb1, xb2, yb2, xb3, yb3, xb4, yb4);


}

 
void mousePressed() {
noLoop();
}



                
                                
