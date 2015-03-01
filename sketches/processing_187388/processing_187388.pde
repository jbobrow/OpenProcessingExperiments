
int number = 50;
float [] x = new float[number];
float [] y = new float[number];
color [] c = new color[number];
float [] bs = new float[number];
float [] xsp = new float[number];
float [] ysp = new float[number];

void setup(){
  
 size (600, 600);
 for(int i=0; i< number; i++){
 x[i] = random(width);
 y [i]= random(height);
 c [i]= color (random(255),random(255),random(255),random(100,250));
 bs [i]= random(20,60);
 xsp [i]= random(-5,5);
 ysp [i]= random(-5,5);
}
println(x);
}

void draw(){  
  background(255);
for(int i=0; i< number; i++){
  if ( x[i] > width - bs[i]/2 || x[i] <bs[i]/2){
    xsp[i] = xsp[i]*-1;
  }
    if ( y[i] > height - bs[i]/2 || y[i] <bs[i]/2){
    ysp[i] = ysp[i]*-1;
    }
    
x[i] = x[i] + xsp[i];
y[i] = y[i] + ysp[i];
noStroke();
fill(c[i]);
ellipse(x[i],y[i],bs[i],bs[i]);
}
}
  
