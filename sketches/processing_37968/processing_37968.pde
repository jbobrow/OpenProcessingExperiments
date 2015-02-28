
void setup(){
  size(500, 500);
  background(0);
  smooth();  
}
void draw(){
//double for loops
for (int a=5; a<width; a+=50){
for (int b=5; b<width; b+=70){
 planet(a, b+10);
    }
  }
}

void planet (int x, int y){
  float r=random(1, 255);
  float g=random(1, 255);
  float b=random(1, 255);
//rings
noFill();
strokeWeight(2);
stroke(206, 162, 15);
ellipse(x, y, 150, 60); 
ellipse(x, y, 200, 80);
stroke(255);
ellipse(x, y, 250, 100);

//center
noStroke();
fill(r, g, b, 160);
ellipse(x, y-10, 60, 60);
}


                
