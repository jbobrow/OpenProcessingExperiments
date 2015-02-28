
int y=20;
float X;
float Y;
float Theta;



void setup(){
  size(400,400);
  smooth();
}

void draw(){
  
    for(i=50;i<=350;i=i+20){
    X = i*sin(Theta) + 200;
    Y = i*cos(Theta) + 200;
    ellipse(X,Y,20,20);
    Theta = Theta+0.1; 
    
  }
}
