
float x = width/2;
float center = height/2;
float t_angle = 0;
int half = 50;
int ctr = 0;
String c;

void setup (){
  size (1000, 1000);
  smooth();
  textSize(20);
  for (int w = half; w < width; w+=100){
  for (int h= half; h < height; h += 100){
    strokeWeight(2);
    ctr++;
    c = String.valueOf(ctr);
    fill(random(200, 250));
    form(w, h, c);
  }
  }
}

void draw (){

}

void form (int x, int y, String c) {
  pushMatrix();
    translate(x, y);
    
    fill(0, 0, 255, random(255));
    float loop = half/random(1,half/2);
   for (int i = 100; i > 1; i-= loop){
     strokeWeight(.1);
     ellipse (0, 0, i, i);
     rotate(random(TWO_PI));
     fill(random(255), random(255), random(255), random(255));
      arc(50, 50, i, i, PI, PI+HALF_PI);
      arc(-50, 50, i, i, PI+HALF_PI, TWO_PI);
      arc(50, -50, i, i, HALF_PI, PI);
      arc(-50, -50, i, i, 0, HALF_PI);

 
   } 
 
 
  popMatrix();
}

