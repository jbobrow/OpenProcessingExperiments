
int diam = 35;

void setup(){
  size(600,200);
  frameRate(25);
}

void draw(){
  float l = map(mouseX, 0, 600, 120, 180);
  float r = map(mouseX, 0, 600, 420, 480);
  float u = map(mouseY, 0, 200, 70, 130);

  smooth();
  
  if(mousePressed == false){
    background(105);
    noStroke();

    
    //left eye
    fill(255);
    ellipse(150,100,120,120);
    
    //right eye;
    ellipse(450,100,120,120);
    
    //left iris
    noStroke();

    fill(0);
    ellipse(l, u, diam, diam); 
    
    //right iris
    fill(0);
    ellipse(r, u, diam, diam);
    
    }
  else {
    if (mouseX < width/3){
    diam = 25;
    background(105);
    strokeWeight(10);
    stroke(0);
    line(90,40,210,100);
    line(90,160,210,100);
    noStroke();
    
    //right eye;
    fill(255);
    ellipse(450,100,120,120);    
    
    //right iris
    fill(0);
    ellipse(r, u, 25, 25);
    
    }
  else 
    if (mouseX < 2*width/3){
    diam = 25;
    background(105);
    strokeWeight(10);
    stroke(0);
    line(90,40,210,100);
    line(90,160,210,100);
    line(510,40,390,100);
    line(510,160,390,100);
    
    }
   else
   if (mouseX < 3*width/3){
    diam = 25;
    background(105);
    strokeWeight(10);
    stroke(0);
    line(510,40,390,100);
    line(510,160,390,100);
    noStroke();
    
    //left eye
    fill(255);
    ellipse(150,100,120,120);
    
    //left iris
    fill(0);
    ellipse(l, u, 25, 25);
    
   }   
  }
}
