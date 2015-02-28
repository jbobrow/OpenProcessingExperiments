
void setup(){
  size(500,800);
  strokeCap(SQUARE);
  background(255);
  colorMode(HSB);
}

void draw(){
}

void mousePressed(){
  drawBuild(mouseX,mouseY);
}

void keyPressed(){
  saveFrame("metropolis####.png");
}

void drawBuild(float x, float y){
// function to draw a building
// set some random parameters for the shape
  float theta = random(0.7,1.3);
  float a = random(10,100);
  float b = random(10,100);
  float l = 200;
  smooth();
  // fill a white background for the building (in a needlessly inefficient way :))
  for (int i=0;i<l;i++){
      stroke(255);
      strokeWeight(2);
      line(x,y+i,x-a*sin(PI-theta),y-a*cos(PI-theta)+i);
      line(x,y+i,x+b*sin(theta),y+b*cos(theta)+i);
  }
  noSmooth();
  // draw the shading on the first wall
 int numj = round(a*sin(PI-theta))+50;
 for (int j=0;j<numj;j++){
    // randomly vary the colour a little
    color c = color(random(35,50),random(60,120),random(140,190));
    // randomly vary the lengths a little
    // vary the length of the shading lines so they are longer at the edges of the building
    int numi = round(100*(2+cos(map(j,0,numj,0,TWO_PI)))/random(0.9,10));
    for (int i=0;i<numi;i++){
      //stroke(255);
      //strokeWeight(2);
      noStroke();
      // gradually fade out each stroke towards the end
      fill(c,map(i,0,numi,155,0));
      ellipse(map(j,0,numj,x,x-a*sin(PI-theta)),map(j,0,numj,y+i,y-a*cos(PI-theta)+i),2,2);
      
    }
  }
  // shade in the other wall
 numj = round(b*cos(theta))+50;
 for (int j=0;j<numj;j++){
    color c = color(random(35,50),random(60,100),random(170,250));
    int numi = round(100*(2+cos(map(j,0,numj,0,TWO_PI)))/random(0.9,10));
    for (int i=0;i<numi;i++){
      //stroke(255);
      //strokeWeight(2);
      noStroke();
      fill(c,map(i,0,numi,155,0));
      ellipse(map(j,0,numj,x,x+b*sin(theta)),map(j,0,numj,y+i,y+b*cos(theta)+i),2,2);
      //line(x,y+i,x-a*sin(PI-theta),y-a*cos(PI-theta)+i);
      //line(x,y+i,x+b*sin(theta),y+b*cos(theta)+i);
    }
  }
  smooth();
  stroke(0);
  strokeWeight(1);
//  line(x,y,x-a*sin(PI-theta),y-a*cos(PI-theta));
//  line(x,y,x+b*sin(theta),y+b*cos(theta));
//  line(x,y,x,y+l);
//  line(x-a*sin(PI-theta),y-a*cos(PI-theta),
//    x-a*sin(PI-theta),y-a*cos(PI-theta)+l);
//  line(x+b*sin(theta),y+b*cos(theta),
//    x+b*sin(theta),y+b*cos(theta)+l);
}

