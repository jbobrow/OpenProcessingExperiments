
int i = 0;
int j=0;
int y=125;
int Speed = 10;
int Speedt1 = 1;
int Speedt2=1;
int x = 20;
int t1 = 30;
int t2=30;

void setup(){
size(400, 400);
frameRate(24);
noStroke();

}

void draw(){
  
  background(0, 66, 84);
  
  for(int i=0; i<300; i+=20){
    float l=random(230, 255);
    float m=random(89, 160);
    float n=random(140, 200);
    float p=random(155, 255);
    fill(255, m, 0, p);
    ellipse(i, 420-2*i, i/2, i/2);
  }
    for(int i=0; i<300; i+=20){
      
  pushMatrix();
  translate(227, 60);
  rotate(radians(36));
  
  
     float l=random(230, 255);
    float m=random(89, 160);
    float n=random(140, 200);
    float p=random(155, 255);
    fill(255, m, 0, p);
    ellipse(i, 420-2*i, i/2, i/2);
    
    popMatrix();
    }
   
    if (y<=25) {
    Speed=10;
  }
  if (y>=375) {
    Speed=-10;
  }
  noStroke();
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(100,255);
  fill(217, 255, 0);
  triangle(y, 400-y, y+40, 300-y, y+100, 380-y);
  
  
   if (t1<=30) {
    Speedt1=1; Speedt2=-1;
  }
  if (t1>=40) {
    Speedt1=-1; Speedt2=1;
  }
    fill(255, 255, 255, 30);
triangle(t1, 0, 100+t1, 0, 80, 440+t1);
triangle(t2-20, 0, 80+t2, 0, 80, 440+t2);

  pushMatrix();
  translate(400, 243);
  rotate(radians(90));
triangle(t1, 0, 100+t1, 0, 80, 440+t1);
triangle(t2-20, 0, 80+t2, 0, 80, 440+t2);
popMatrix();
 
  y+=Speed;
  t1+=Speedt1;
  t2+=Speedt2;
}




