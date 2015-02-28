
int x = 0;
int y = 0;

void setup(){
size(500,500);
background(255);

}

void draw(){
float rand_blur = random(0,0.7);
  fill(255,230,200,5);
  rect(0,0,500,500);
     
 for(int i=0;i<50;i++){ 
  fill(random(200,245),random(40,70),random(50,200),100);
  filter(BLUR,rand_blur);
  noStroke();
  rotate(random(x));
  rect(random(x),random(y),x,2);
   x=x;
y=y+30;
 }
 x=int(random(500));
 y=int(random(500));
}


