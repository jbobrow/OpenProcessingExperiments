
float y = 0.0;
float speed = 2.0;	// value for speed 
float radius = 16.0; // value for circle size
void setup(){ 
  size(250,250); 
  smooth(); 
  noStroke(); 
  ellipseMode(RADIUS);
} 

void draw(){
fill(200,15); // background colour, alpha for motion blur 
rect(0,0,width,height); // background shape size of window 

fill(random(10,300),220,250); // circle fill colour 
ellipse(33, y-20, radius, radius);

fill(random(10,190),10,120);
ellipse(200,y+20,radius+5,radius+5);

fill(random(10,300),100,370);
ellipse(100,y-100,radius+10,radius+10);

fill(30,random(100,300),random(200,350));
ellipse(160,y-40,radius-2,radius-2);

fill(90,random(20,100),random(70,350));
ellipse(250,y-70,radius+1,radius+1);

y += speed;	// increase value to move circle

if(y > height+radius+120){
// if y is greater than height of window and half circle size
y = - radius;
// move it to above top of window with a negative position
}
}

