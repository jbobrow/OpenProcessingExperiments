
int hello=0;
int goodbye=20;
int y= 0;

void setup() {
  size(500,500);
  noFill();
  background(255);
  
  fill(125,179,222,50);
  noStroke();
  smooth();
  
  
}

void draw(){
  
  while(goodbye < 150) {
  
 ellipse(hello,y,goodbye,goodbye);
goodbye=goodbye + 60;
}

hello = hello +55;
goodbye = 0;

if(hello>550){
  y = y +50;
  hello = 0;
}

}



//if(goodbye == 500) {
 // goodbye=0;


