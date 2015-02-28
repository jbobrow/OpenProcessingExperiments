
int num = 40;
planet[] stars = new planet[num];
sun s;

void setup(){
  size(800,600);
  background(0);
  for(int i = 0; i<num;i++){
    stars[i] = new planet();
  }
  s = new sun();
}

void draw(){
  smooth();
  fill(20,150);
  rect(0,0,width,height);
  for(int i = 0; i<num;i++){
    PVector f = s.attract(stars[i]);
    stars[i].applyforce(f);
    stars[i].update();
    stars[i].display();
  }
  s.display();
}


  




    
    
    
    
  
  
    
    
    
    

