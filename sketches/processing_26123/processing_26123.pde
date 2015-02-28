

float x = 100;
float y = 0;
float xspeed = 5;
float yspeed = 5;
float speed = 0;
float gravity = 0.1;
float r = 25;
float chickR;
float chickG;
float chickB;

void setup(){
  
size(500,500);

}

void draw(){
   background(255,0,0);
   
 
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width)||(x <0)){
    xspeed = xspeed * -1;
    r = 50;
  }
  
  if ((y > height)||(y < 0)){
    yspeed = yspeed * -1;
    r = 50;
  }


//face
fill(250,200,60);
ellipse(x+120,y+100,200,180);


//left eye
fill(255);
ellipse(x+80,y+70,50,20);
fill(0);
ellipse(x+80,y+70,20,20);

//right eye
fill(255);
ellipse(x+160,y+70,50,20);
fill(0);
ellipse(x+160,y+70,20,20);

//chick
chickR = random(255);
chickG = random(255);
chickB = random(255);
fill(chickR,chickG,chickB);

ellipse(x+50,y+100,30,30);
ellipse(x+190,y+100,30,30);

//mouth
fill(200,50,50);
rect(x+80,y+110,80,40);
fill(255);
stroke(0);
rect(x+80,y+120,80,20);
line(x+80,y+130,x+160,y+130);

y = y + speed;
speed = speed + gravity;

//if face reached the bottom
//reverse speed
if (y > height){
  speed = speed * -0.95;
}

 }



