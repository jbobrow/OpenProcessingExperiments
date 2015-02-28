
folat x;
float y;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  frameRate(40);
  smooth();
}

void draw() {  //draw function loops 
  noStroke();
  fill(0,1);
  rect(0,0,width/2,height);
  noStroke();
  fill(0,05);
  rect(0,0,width,height);
  fill(250,125,145);
  ellipse(x,(100*sin(y)+250),100,100);
  x=x+1;
  y=y+0.01;
   
    if(x==500) { //add some interaction
x=0;
  }

}
