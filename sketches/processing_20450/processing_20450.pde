
int num = 18;
float mySize = floor(random(10,40));
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[3];
int[] col = new int[num];

void setup() {

  size(300,300);
rectMode(CENTER);
 
 
  myColors[0] = color(49,184,201,60);
  myColors[1] = color(201,92,49,60);
  myColors[2] = color(255,255,255,60);



  for(int x=num-1; x>=0; x--) {
    ypos[x] = random(0,height);
    speed[x] = random(-5,5);
    col[x] = floor(random(0,3));
  }
  noStroke();
  smooth();
}

void draw() {
  background(220);
  
  for(int x=0; x<num-1; x++) {
    
    fill(myColors[col[x]]);
   
     rect(width/num * x + width/num, ypos[x], mySize+random(12,40), mySize+random(12,40));

    ypos[x] = ypos[x] + speed[x];
    
   
    if(ypos[x] > height + mySize/2) ypos[x] = -mySize/2;
    if(ypos[x] < -mySize/2) ypos[x] = height - +mySize/2;
  }
}


