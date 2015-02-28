
int cent_x, cent_y;
PVector new_pos, curr;
float y_angle = 0, x_angle = 0, r;

//frame rate * 60 seconds (save every 1min)
int rate = 48;
int save_rate = 48 * 60;

void setup(){
  background(0);
  size(800, 800);
  smooth();
  noFill();
  stroke(255, 10);  
  r = 1;
  cent_x = width/2;
  cent_y = height/2;
  curr = new PVector(0,0);  
  new_pos = new PVector(0,0); 
  new_pos.x = r * sin(0);
  new_pos.y = r * cos(0);  
  frameRate(rate);
}

void draw(){
  //float seed = Variance(random(50)); 
  x_angle += random(-0.1,0.1);  
  //r = random(100);
  r += random(-2, 2);
  curr.x = r * sin(x_angle);
  curr.y = r * cos(x_angle);
  Render(curr, new_pos);
  new_pos = new PVector(curr.x, curr.y); 
  if (frameCount % save_rate == 0)
   saveFrame("system-1-#####.jpg"); 
}

float Variance(float seed){
  return noise(seed);
}

void Render(PVector curr){
  translate(cent_x, cent_y);
  point(curr.x, curr.y);
  println(curr.x + " " + curr.y);
}

void Render(PVector curr, PVector new_pos){
  translate(cent_x, cent_y);
  beginShape();
  curveVertex(new_pos.x, new_pos.y);  
  curveVertex(new_pos.x, new_pos.y);    
  curveVertex(curr.x, curr.y);    
  curveVertex(curr.x, curr.y);   
  endShape();
}

