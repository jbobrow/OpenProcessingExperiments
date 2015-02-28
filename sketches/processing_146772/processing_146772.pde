
//this sketch will utilize class, arraylist, pushMatrix, popMatrix, 
//initial variables

Planet[] planets = new Planet[250];

void setup() {
  size(900, 500); 
  background(0);
  smooth();
  noStroke();
  
  
  for(int i=5; i<planets.length; i++) {
    planets[i] = new Planet(10*i, random(10, 19), random(0, 360), random(mouseX, mouseY), 295-25*i);

  }
  
  //draw sun at center
  
  //fill(100, 0, 0);
  //ellipse(width/2, height/2, 40, 40);
  
}

void draw() {
 
  background(0);
  //draw and update each planet
  for (int i=5; i<planets.length; i++) {
    planets[i].draw();
    planets[i].update();
  }
 
  //draw sun at center
  //fill(230, 20, 230);
  //ellipse(width/2, height/2, 20, 20);
}





class Planet {
  float d; //distance of planet from sun
  float r; //planet size
  float a; //angle planet position makes with horizontal x axis 
  float da; //rate of change in angle
  float C; //color
  
  //initilize planet
  Planet (float dO, float rO, float aO, float daO, float CO) {
    d=dO;
    r=rO;
    a=aO;
    da=daO;
    C=CO;
    
  }
  
  void draw() {
  fill(C, 100);
  //ellipse(width/2+r*cos(a), height/2+r*sin(a), random(0, 0.2)*r,random(0, 0.2)* r);
  //ellipse(mouseX+r*cos(a), mouseY+r*sin(a), random(0, 0.10)*r*10,random(0, 0.10)* r*10);
 //fill();
  ellipse(width/2+r*cos(a), height/2+r*sin(a), a/6, a/6);
  ellipse(width/2+r*cos(a), height/2+r*sin(a), random(0, 0.10)*r*10,random(0, 0.10)* r*10);
  //fill(0, 100, 175);
  //ellipse(width/2+d*cos(a), height/2+d*sin(a), mouseX/r, mouseY/r);
  //fill(0, 100, 75);
  //ellipse(width/3+d*cos(a), height/1+d*sin(a), mouseX/r, mouseY/r);
  //fill(0, 200, 175);
  //ellipse(r+d*cos(a), r+d*sin(a), r, r);
  //fill(0, 100, 275);
  //ellipse(width/4+d*cos(a), height/4+d*sin(a), mouseX/r, mouseY/r);
  //fill(0, 200, 100);
  //ellipse(width/7+d*cos(a), height/7+d*sin(a), mouseX/r, mouseY/r);
  
  }
  
  void update() {
    
    a+=da;
    a+=C*2.5;
  
    
    
  }
}

