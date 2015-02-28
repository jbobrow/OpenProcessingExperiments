
class Ring1{

  float rad;
  int num;
  float big;
  float speed;

  Ring1(){

  }

  void display(int n, float r){
    
    rad = r;
    
    num = n;

    noStroke();
    fill(0);
    
    big=rad/5;
    
    for(int i = 0; i< num; i++)
    {
      rectMode(CENTER);
      ellipse(rad*cos((TWO_PI/num)*i+speed),rad*sin((TWO_PI/num)*i+speed),big,big);
    }
    
    stroke(255);
    fill(255);
    
    num= num+mouseY/100;
    
    for(int i = 0; i< num; i++)
    {
      ellipseMode(CENTER);
      ellipse(rad*cos((TWO_PI/num)*i-speed),rad*sin((TWO_PI/num)*i-speed),big,big);
    }
  }

  void move(float s, float r){
    speed+=s;
    rad =r;
  }
}


