

void setup() {
  size(800, 600);  
  stroke(0);     
}

	
void draw() { 

background(0);

raster();
 
float deg = mouseX;
float rad = radians(deg);
//println(deg + " degrees is " + rad + " radians");

 translate(2,0);

rotate(rad);
scale(1+(mouseY/290));
raster();

scale(1);
}

