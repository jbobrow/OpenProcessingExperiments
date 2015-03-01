




int h;
int i;
void setup() {

  size(800, 800);
h = 0;
i= 0;

}


void draw() {
  i++;
  h++;
  
  
  for (int h = 0; h< height; h++) {
                for (int i = 0; i <width; i++) {
                        stroke(i*2, random(20, 250), h*2-50);
                        
                        strokeWeight(4);
                        line(i*10+random(500, 700), 10*h, 100, 100);
                        
                                               

                        
                        translate(i*2+i, h*2);
                        rotate(PI/3+3*i);
                       
                }

}


}




