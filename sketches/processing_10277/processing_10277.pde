
class Triangle {
  
  int s=5; //size of triangle
  int x,y;
  boolean state; //true = alive
  boolean nextState;
  float hue=0, saturation=1, brightness=1;
  Triangle neighbours[] = new Triangle[3];
  int age=0;
  
  Triangle(int _x, int _y) {
    x=_x;
    y=_y;
    randomize();
    s=width/mx;
  }
  
  void randomize() {
    state = !boolean(int(random(2))); //50% chance of being alive
    nextState = state;
  }
  
  void update() {
    int sum = int(neighbours[0].state) + int(neighbours[1].state) + int(neighbours[2].state);
    if (sum==0 || sum==3) nextState=false; //death
    if (sum==1) nextState=state; //survive or stay dead
    if (sum==2) nextState=true; //birth or survive
               
    if (nextState==state) age++;
    else age=0;
  }
  
  void draw() {
    state = nextState;
    
    hue = .15 + float(age)/5; //full red in 5 generations
    saturation = 1;
    brightness = int(state)+.3;
    fill(hue,saturation,brightness);
     
    pushMatrix();
        if (mx-1-x<y) translate(-width,0); //wrap to other side
        
        if (x%2==0) triangle((x+y)*s,y*s,(x+y+1)*s,(y+1)*s,(x+y+2)*s,y*s); //normal triangle
        else triangle((x+y)*s,(y+1)*s,(x+y+1)*s,y*s,(x+y+2)*s,(y+1)*s); //upside down triangle
    popMatrix();
  }
  
}


