
float y=0;
float x=0;
void setup() {
    size(200,200);
}
void draw() {
  background(1);
  stroke(random(255),random(255),random(255));
    strokeWeight(5);
    fill(0);
for(float x=0; x<3.14*2; x=x+0.01)
    point(100+sin(x)*70,100+cos(x)*70);

}
 
 
                    
                
