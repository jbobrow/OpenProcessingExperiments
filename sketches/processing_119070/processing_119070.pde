
float x;
float y;
float a;
float b;
float c;
float d;
float e = x;
float f = 1;
float g;
int number;

void setup(){
  size(500,500);
  background(0);
  smooth();
}

void draw(){
  x = random(255);
  y = random(255);
  a = random(255);
  b = random(500);
  c = random(500);
  d = random(20);
  noStroke();
  fill(x,y,a,a);
 ellipse(b,f,d,d);
 f = f+1;
 if(f > 500)
 f = 0;
}

void keyPressed(){
  if(key == 's'){
    println("saving...");
    String s= "screen" + nf(number,4) + ".jpg";
    save(s);
    number++;
    println("Done Saving");
  }
}


