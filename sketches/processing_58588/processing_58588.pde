
//variables - no. of objects, positions, size, color and weight
int obj; 
float posX, posY;
float s; 
float c; 

//set window, bg & anti-alias
void setup(){
size (600,460);
background (255);
smooth();
//set variable
obj= 200;

}

void draw(){
  //set static image
   noLoop();
  //color mode and levels
  colorMode(HSB,360,100,100);
 
 //loop left
for (int i=0; i<obj; i=i+5)
{
  //set position variable in loop
  posX = i;
  //set calc to color's variable
  float c = map ( i, 0, obj, 0,360);
  strokeWeight (i);
  //drawing inside a specific area
  stroke(c,i-10,100,c);
  
  point (posX, random(height/2-100,height/2+100));
}

//loop right
for (int i=0; i<obj; i=i+5)
{
  //set position variable in loop
  posX = i;
  //set calc to color's variable
  float c = map ( i, 0, obj, 0,360);
  strokeWeight (i);
  //drawing inside a specific area
  stroke(i,75,c,c);
 // fill(i,50,65);
  point (width-posX, random(height/2-100,height/2+100));
  
}

saveFrame ("stripeondots.png");

}

