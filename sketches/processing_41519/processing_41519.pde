
int count = 4;
float space;

float ypos[] = new float[count];
float vib1[] = new float [count] ;
float vib2[] = new float [count];
float diff;

float a = random(79,81);
int mouseval = 0;
int stroke1 = 255;
int stroke2 = 0;
float vib = random(158,162);
int col = 100;






void setup() {

  size(700,400);
  background(0);
  space = height/(count +1.0);
  float curry = space;

  int i = 0;
  while ( i < count) {
    ypos[i] = curry;
    curry = curry + space;
    i = i + 1;
  }
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);


  smooth();

  int i = 0;
  while ( i < count) {
    if(mouseY > ypos[i] - 10 && mouseY< ypos[i] +10) {
      
     
      diff = abs(mouseY-pmouseY)/ 3.0;
      if( diff < 2){
      diff = 2;}
      line(0,ypos[i]+ random(-diff,diff),700, ypos[i]+random(-diff,diff));
    }

    else {
      line(0,ypos[i],700, ypos[i]);
    }

    i = i+1;
  }
}


