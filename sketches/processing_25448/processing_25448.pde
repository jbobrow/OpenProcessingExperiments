
//variables
int x = 285;
int y = 330;
int radius = 270;
int eyeradius=45;
PFont font;
float speed = 0.5;
float t = 24;


void setup(){
    size(570,660);
    smooth();
    font = loadFont("AmericanTypewriter-48.vlw");
    textFont(font);
}
 
void draw(){

    //background
  noFill();
  background(222,156,83);
  stroke(222,211,140);
  strokeWeight(20);
  for (int i=10;i<=900;i=i+90){
    
    ellipse(x,y-30,i,i);
  }
   
   //body
  noStroke();
  fill(137,190,178);
  ellipseMode(CENTER);
  ellipse(x/2+15,y/2+60,radius,radius);
  ellipse(x*3/2-15,y/2+60,radius,radius);
  arc(x,y/2+45,radius*2-25,radius*2+20, radians(0),radians(180));
  
  //left eye
  fill(130,57,53);
  ellipse(x/2+15,y-20,eyeradius,eyeradius);
   
//right eye
  fill(130,57,53);
  ellipse(x+x/2-15,y-20,eyeradius,eyeradius);
 
  //nose
  fill(130,57,53);
  ellipse(x,y+45,eyeradius+50,eyeradius);
  
  t +=speed;
  
    if(t>48){
      t=-t;
    }
  
  textSize(t);
  text("Hello Monica", 150,580);
  
  
  }

  
  



