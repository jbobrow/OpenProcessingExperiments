




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
  noStroke();
  for (int h = 0; h< height; h++) {
                for (int i = 0; i <width; i++) {
                        fill (random(120, 150), h, random(100, 200));
                        ellipse(i*100+random(500, 700), 5*i, 30, 30);
                        
                                               

                        
                        translate(h*7, i*7);
                        rotate(PI/3.0);
                       
                }

}


}




