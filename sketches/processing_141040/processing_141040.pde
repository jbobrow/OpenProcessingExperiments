
//Naomi Rauch
//CS118
//Mid-Term
//March 22, 2014

PImage img; //variable for image of pagoda
float smx;//starting x
float smy;//starting y
float easing; //smoothing floating latern in y direction

void setup(){
  size(400,400);
  img = loadImage("picture.jpg");
  smooth();
  smx = random(0,width); //random starting point in x direction

  smy = height; //start lanterns at bottom of screen
  easing = 0.01; //smooths lantern
}

void draw(){
//add movement from random starting point

image(img,0,0,width,height);
if (smx>0) {
  float scalar = map(smy,-10,height,.1,.5);//makes scale of lantern change
  smy += (0 - smy)*easing;
  smx = smx + 5.5; //movement in x direction

  lantern(smx,smy,50,scalar);//draws lantern from custom function
}else if (smy <= 100) { //put in to make disappear at top???
  image(img,0,0,width,height);
}
}
void lantern(float x, float y, float lantw, float s){
  //drawing lantern
  //x and y variables are coordinates of center
  //lantw is width of lantern; height a factor or with by 1.618
  //s is for scale
  //light source of lantern at center of lantern
  
  scale(s);
 
  for(float deltax=lantw; deltax>= lantw/6; deltax -= .05){
   
    float dim = map(deltax, lantw/4, lantw, 0, 255);
    fill(255,255,dim,5);
    noStroke();
    ellipse(x, y, deltax, deltax*1.618);
 
}

}
  
  
  
  
  



