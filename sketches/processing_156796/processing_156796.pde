




int h;
int i;
void setup() {

  size(800, 800);
  frameRate(60);
h = 0;
i= 0;

}


void draw() {
  i++;
  h++;
  fill(255);
  stroke(255);
  
  for (int h = 0; h< height; h++) {
                for (int i = 0; i <width; i++) {
                        fill (random(120, 150), i, random(100, 250));
                        line(i*100+random(500, 700), 50*h, 100, 100);
                        
                                               

                        
                        translate(i*7, h*7);
                        rotate(PI/2.0);
                       
                }

}


}




