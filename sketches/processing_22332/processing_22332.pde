
float r = PI/6;
float speed1 =2;

float x1 = 100;
float y1 = 100;

void setup(){
  rectMode(CENTER);
size(500,500);
background(255);
smooth();
}

void draw(){
  
  pushMatrix (); // setup a marker to revert to
translate (width/2, height/2); // move origin horizontally and vertically
rotate (r); // rotate around the new origin
rect(width/2,height/2,200,200);
fill (random(255),random(255),random(255),random(100));
rect (0,0, 200, 200);
fill (random(255),random(255),random(255),random(100));
rect (0, 0, 50, 50);



popMatrix (); //revert to marker

r += PI/36; //increment angle – make smaller to slow rotation

}

