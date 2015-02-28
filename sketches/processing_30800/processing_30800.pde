
void setup(){
  
  size(600,600);
frameRate(120);
  smooth();
 
}
void draw(){
 colorMode(HSB);
  background(random(255),random(255),random(255));

 
for(float i=0; i<=width; i+=5){
  stroke(random(255),120,80);
    noFill();
    rectMode(CENTER);
    rect(300,300,i,i);
    ellipse(300,300,i+250,i+250);
  float alto2= map(i,0,300,300,0);
  ellipse(300,300,i/2,alto2); 
        
  float alto= map(i,0,600,600,0);
  ellipse(300,300,i,alto); 

}


}


