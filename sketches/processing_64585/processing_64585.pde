
PFont universbold;
float[] x = new float[100];
float r;
float r2;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  fill(255);
  
  textAlign(CENTER);
  universbold = loadFont("UniversLTStd-Bold-48.vlw");
  textFont(universbold, 20);
 
  
  for (int i = 0; i <x.length; i++){
    x[i] = random(-800,200);
  }
}

void draw(){
  r = random(-120, 100);
  r2= random(5,30);

  background(255,121,44);
  
  text("PANTONE", width/2, height/2);
  for (int i = 0; i < x.length; i++){
    x[i] += 0.5;
    float y = i *5;
    fill(255);
    
rotate(mouseX+5);
rect(x[i],y,12,17,0.52,5.76);
fill(r+229,255,r+62);
rect(x[i],y,12,11,0.52,5.76);
  }
}


