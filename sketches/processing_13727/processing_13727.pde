
int a=0;
void setup() {
  size(200,200);
}
 
void draw() {
  for(int y=10; y<=200; y=y+20){
    for(int x=10; x<=200; x=x+20)
    {
    noStroke();
    fill(random(255), random(255), random(0));
    ellipse(x,y,10,10);
    }
  }
    
    for(int y=10; y<=200; y=y+10){
    for(int x=10; x<=100; x=x+10){
    fill(random(255), random(0), random(255));
    ellipse(x,y,15,15);
    }
    a=a+1;
  }
}     
                
