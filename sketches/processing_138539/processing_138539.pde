
float [] x= new float[30000];
float [] y= new float[30000];
float [] t= new float[30000];
void setup() {
  size(400,400);
for(int i = 0; i<30000 ; i++){
x[i] = random (width);
y[i] = random (height);
t[i] = random (2,20);
}
}
void draw(){
  background(255);
  for(int i = 0; i<30000 ; i++){
    x[i]++;
    ellipse(x[i],y[i],t[i],t[i]);
    if(t[i]<10){
      stroke(214,4,205);
    fill(105,3,127);
    }else{ 
      fill(7,11,178);
      stroke(5,175,80);
    }
  }
  }
