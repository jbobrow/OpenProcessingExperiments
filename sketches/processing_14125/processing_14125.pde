
void setup() {
  size(450,300);
  colorMode(HSB,360,100,100);
}

void draw() {
  background(0);
    for( int x=0; x<=300; x=x+50 ) {
    strokeWeight(3);
    stroke(255);
    line(150,150,350,150);
   
    noStroke();   
    float y=sin(random(x+frameCount))*255*0.8+60;
    float z=sin(random(x+frameCount))*180*0.7+35;
    fill(random(255),60,100);
    ellipse(150,150,3+y,y+5);
    ellipse(350,150,4+z,z);
 }
}



    
                
