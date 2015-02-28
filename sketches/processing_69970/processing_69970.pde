
int rad = 250; 
float [] xPos = new float [400];  
float [] yPos = new float [400];
int k1, k2 ;

void setup() {    
  size(800, 800);      
  smooth();           
  background(0);   

  for (int i = 0; i < 400; i++) {
    int inc = i;
    float angle = radians(inc);
    xPos[i] = cos(angle) * rad;
    yPos[i] = sin(angle) * rad;
  }
}

void draw() {      

  translate(width/2, height/2);

  for (int i = 0; i < 400; i++) {
    stroke(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  }
  k1= (int)random(400);
  k2 = (int)random(400);

  line(xPos[k1], yPos[k1], xPos[k2], yPos[k2]);
}


