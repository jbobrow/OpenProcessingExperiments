
void setup() {

size(250,250); 
background(255);
stroke(50,175,25,50);
fill(25,150,255,25);
  
float w,h;
float n = 9.0, sum = 0.0;

for(int i =1; i <= n; i++) {
sum+=1.0/i;
w = sum * (width/2.8289685);
h = w;
rect(0,0,w,h);
}

}
