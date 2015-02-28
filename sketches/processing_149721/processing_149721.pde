
float[] y = new float[1000];

void setup() {
  size(800, 800);
  noStroke();
  fill(0, 255, 200);
  for (int i = 0; i < 1000; i++) {
   y[i] = -120*i;
 }
}

void draw() {
  background(255);
    for (int i = 0; i < y.length; i++) {
     y[i] += 20;
     for (int j =0; j < 1.1*width; j += 90){
    float x = j ;
    drop(x, y[i]);   
    drop(x+45,y[i]+60); 
     } 
   } 
   fill(255,230, 50);
   triangle(500, 300, 650, 400, 350, 400);
   fill(255);
   rect(350,400, 300, 400);
   
   strokeWeight(10);
   stroke(255,230,50);
   line(500,400,500,500);
   arc(480,500,40,40,0,PI);
   
   noStroke();  
   fill(230,50,50);
   triangle(400,780,450,780,450,750);
   rect(430,700,40,80);
   triangle(490,780,540,780,540,750);
   rect(520,700,40,80);

   
}

void drop(float x, float y){
pushMatrix();
translate(x,y);
noStroke();
fill(0, 200,230);
triangle(0,0,10,40,-10,40);
arc(0,40,20,20,0,PI);
popMatrix();
} 


