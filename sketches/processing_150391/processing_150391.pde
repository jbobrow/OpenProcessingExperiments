
Planet[] planets = new Planet [9];

void setup(){
  size(600,600);
planets[0] = new Planet (10,  #5F5F5F, 110, .009);
planets[1] = new Planet (15,  #936C07, 120,.018);
planets[2] = new Planet (15,  #1B146A, 130,.077);
planets[3] = new Planet (10,  #5B6F28, 140,.046);
planets[4] = new Planet (40,  #FACA08, 160,.095);
planets[5] = new Planet (40,  #E9FA08, 190,.004);
planets[6] = new Planet (20,  #04376C, 210,.033);
planets[7] = new Planet (10,  #4285CB, 230,.052);
planets[8] = new Planet (4,  #6AB3FF, 250,.021);

}
  
  void draw(){
    background(0);
    fill(#F7A900);
    ellipse(width/2, height/2, 100, 100);
     translate(width/2,height/2);
    for (int i = 0; i<9; i++){
    
      planets[i].display();
    }
    
   
    
  }
class Planet {
  float rr;
  color c;
  float ang =.01;
 float speed ;
  
  float dist;
  Planet(float temprr, color tempc, float tempdist, float tempspeed) {
    rr= temprr;
    c= tempc;
    dist = tempdist;
    speed = tempspeed;
  }

  
  void display() {
    float x= cos(ang)*dist;
     ang-=speed;
    float y = sin(ang)*dist;
    fill(random(255), random(255), random(255));
    fill (c);
    ellipse(x, y, rr, rr);
    
  }
}



