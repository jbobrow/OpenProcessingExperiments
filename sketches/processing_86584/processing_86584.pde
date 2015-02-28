
float r=0;
float i=0;
float w=8;
float checker = 0;
PImage texture;
int stagewidth;
int stageheight;

void setup(){
  smooth();
  int i = 0;
    texture = loadImage("texture.jpg");

  stagewidth=texture.width;
 stageheight=texture.height;
  size(700,700,P3D);
  background(38,71,157);
  frameRate(8);
    
  blend(texture, 0, 0, 700, 700, 0, 0, 700, 700, BLEND);
  fill(0);

  fill(255,212,70);
  stroke(0);
   strokeWeight(2);
  ellipse(350,350,350,400);
  noStroke();
     rect(265,525,165,120);

  fill(0);
  stroke(0);
  strokeWeight(3);
  line(346,351,321,416); 
 line(321,416,350,416); 
 
 fill(random(255), random(255), random(255));
 quad(294,450,394,450,426,488,261,488);
  fill(random(255), random(255), random(255));
 quad(264,620,431,620,700,700,0,700);
  filter(BLUR, 1);
  
}
   
void draw ()  {
   
  stroke(0);
  strokeWeight(2);
   i = i + 0.01;
   fill(255,255,255,5);
 ellipse(250,320,50,50);
 ellipse(450,320,50,50);
 noStroke();
 fill(0);

 fill(random(100), random(100), random(100), 90);
quad(random(700),random(200),507,260,195,260, random(50),random(200)  ); 
fill(random(100), random (100), random(100));
pushMatrix();
translate(250, 320);
i+= 0.5;
rotate(i);
rect(0, 5, 10, 10);
popMatrix();

pushMatrix();
translate(450, 320);
i+= 0.5;
rotate(i);
rect(0, 5, 10, 10);
popMatrix();
 
  

 // http://fc07.deviantart.net/fs30/f/2009/238/4/b/Brown_noise_texture_by_texturemaker.jpg
 
 
 
 
 
 
 

   
}



