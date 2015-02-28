
float yoffset = 0;
int seed = 5;        // Random seed to control randomness while drawing the tree
int maxLevel = 8;

color trunk = color(255, 255,255);
color leaves = color(255, 255, 255,50);
color leaves2 = color(255, 255, 255,100);




void setup() {
  size(600,600);

}
void draw(){



  background(0);
  translate(width/2,height);
    yoffset += 0.003;
  randomSeed(seed);

  branch(100,5,1);

}

void branch(float len, float xoffset,int level) {
  float tob = map(len, 2, 100, 1, 2);


  
  stroke(lerpColor(trunk, leaves, level/maxLevel));


organicLine(0,0,0,-len,tob);
  translate(0,-len);
len *= 0.7f;      // 0.66
  // Move along through noise space
  xoffset += 0.1;



  if (len > 7) { // no inf. loop
int n = int (random (1, 4));
    for( int i = 0; i < n; i++) {
      float theta = map( noise( xoffset + i, yoffset), 0, 1, -PI/4, PI/4);
      if (n % 2 == 0) theta += -1;
       


    pushMatrix();
    rotate(theta);
    branch(len*random(0.70,0.95), xoffset, level + 1);
    popMatrix();
 
    pushMatrix();
    rotate(theta*0.002);
    branch(len*random(0.70,0.95), xoffset, level + 1);
 popMatrix();

 
/* pushMatrix();
    rotate(-theta);
    branch(len*random(0.70,0.95), xoffset, level + 1);
    popMatrix();*/
 
 
    }
  }
}

void organicLine(float x1, float y1, float x2, float y2, float strokeW)
{
  strokeWeight(strokeW);

  float numSections = 5;                              // vary the # of sections? 

  float cx = x2-x1*1.5;         // change in x
  float cy = y2-y1;         // change in y

  float nx1 = x1;
  float ny1 = y1;
float nseed = random(-40,40);
  for (int i = 1; i <= numSections; i++)       
  {
    float n = noise(nseed+=0.05);
    float nx2 = x1 + i/numSections * (cx +n);               // add variation here
    float ny2 = y1 + i/numSections * (cy +n);               // and here

    line(nx1, ny1, nx2, ny2);

    nx1 = nx2;
    ny1 = ny2;
  }
}





