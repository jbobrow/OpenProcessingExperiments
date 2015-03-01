

void setup() {
  size(600, 600); 

  background(0); 

background(255);
}

 
void draw() {
  

float s = map(second(),0,59,0,100);
float m = map(minute(),0,60,00,100);
  float h = map(hour(), 0,24,0,300); 
 
 
 
   if(s<=1){
    
    background(255,s);
  }
  
 
pushMatrix();
translate(300,300);
  
  rotate(radians(6 * s));
fill(random(s),random(s),s);
stroke(150,random(s),random(100),random(50));

line(random(s),500,0.90,0.90);
popMatrix();

pushMatrix();
fill(150,m*3,random(200),0.2);

stroke(0,25);
ellipse( 300,300,random(m),50);
popMatrix();


fill(#FFF708,0.1);
strokeWeight(random(0.2,1.0));
//stroke(0,2);
ellipse(300,300,300,random(h+200));
}

