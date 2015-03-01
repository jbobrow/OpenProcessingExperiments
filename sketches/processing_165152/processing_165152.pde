
int x = 10;
int y = 250;
int[] niceBars = {-10,40,-87,74,23,150,-140,30,24,-145,51,76,-45,23,64,-84,132,97,-12,42,63,88};
void setup(){
size(500,500);
background(255);

}
void draw(){

for(int n = 0; n< niceBars.length; n++){
  fill(random(255),random(255),random(255));
  x += 20;
  rect(x,y,20,-niceBars[n]);
}
}
