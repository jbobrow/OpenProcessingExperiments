
float counter=0;
float ccounter=0;
float w = 100;
float h = 100;
float centerx = 200;
float centery = 200;
float hue;

void setup() {  //setup function called initially, only once
  size(500, 500);
  hue=random(255);
  background(25);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  
}
float rnd(){
    return random(2)-1;
}
void draw() {  //draw function loops 
  counter+=.05;
  ccounter+=.005;
  if(random(1.0)>.99){
  hue=random(255);
  }
  noStroke();
  //noFill();
  
  fill(25,1);
  //alpha(1);
  rect(0,0,width,height);
  fill(25);
  stroke(255);
  strokeWeight(2);
  //fill(abs(cos(ccounter))*255,105,180+random(25),random(25)+50);
  //w=h=cos(counter)*width/2;
  centerx=cos(counter)*30+width/2;
  centery=sin(counter)*30+height/2;
  //w=h=random(width/2);
triangle(centerx+sin(counter)*w, centery+cos(counter)*h, centerx+sin(counter+radians(120))*w, centery+cos(counter+radians(120))*h,centerx+sin(counter+radians(240))*w, centery+cos(counter+radians(240))*h);
    //triangle(centerx+sin(counter)*w+rnd(), centery+cos(counter)*h+rnd(), centerx+sin(counter+radians(120))*w+rnd(), centery+cos(counter+radians(120))*h+rnd(),centerx+sin(counter+radians(240))*w+rnd(), centery+cos(counter+radians(240))*h+rnd());
  
}
