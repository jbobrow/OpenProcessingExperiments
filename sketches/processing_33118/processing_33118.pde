
float x1,y1,x2,y2,xspeed,yspeed,c = random(255),c1 = random(255),c2 = random(0,255);
int x1direction,y1direction,x2direction,y2direction;



void setup(){
size(500,500);
frameRate(50);
smooth();


x1 = 200;

y1 = 40;

x2 = 70;

y2 = 70;

xspeed = random(3,5);
yspeed = random(5,7);

x1direction = 1;
y1direction = 1;
x2direction = 1;
y2direction = 1;

}

void draw(){


  
PImage b;
b = loadImage("unkle22.jpg");
image(b, 0, 0);
  



x1 = x1 + xspeed*x1direction;
y1 = y1 + yspeed*y1direction;





noFill();
strokeWeight(1);
  stroke(c1);
  ellipse(x1,y1,5,5);
  
  stroke(random(255));
  ellipse(x1,y1,10,10);
  
  stroke(random(255));
  ellipse(x1,y1,15,15);
  
  stroke(random(255));
  ellipse(x1,y1,20,20);
  
  stroke(random(255));
  ellipse(x1,y1,25,25);
  
  stroke(random(255));
  ellipse(x1,y1,30,30);
  
  stroke(random(255));
  ellipse(x1,y1,35,35);
  
  stroke(random(255));
  ellipse(x1,y1,40,40);
  
  stroke(random(255));
  ellipse(x1,y1,45,45);
  
  stroke(random(255));
  ellipse(x1,y1,50,50);
  
  stroke(random(255));
  ellipse(x1,y1,55,55);
  
  stroke(random(255));
  ellipse(x1,y1,60,60);
  
  stroke(random(255));
  ellipse(x1,y1,65,65);



if(x1>=460 || x1 <= 40){
  x1direction *= -1;
  }
  
if(y1 >= 460 || y1 <=40){
  
  y1direction *= -1;
}



fill(c2);
noStroke();
ellipse(x2,y2,70,70);

x2 = x2 + xspeed*x2direction;
y2 = y2 + yspeed*y2direction;


if(x2>=460 || x2 <= 40){
    x2direction *= -1;
    }
    
  if(y2 >= 460 || y2 <=40){
    
    y2direction *= -1;
}



if(mousePressed){
  
  

  noStroke();
  fill(220,10,10);


ellipse(x2,y2,70,70);

ellipse(mouseX,mouseY,70,70);//if you press the mouse, a new red ellipse will be created, also, there will be a new ellipse moving with your mouse.
}

if(dist(x1,y1,x2,y2) <= 57.5){


  x1direction *= -1;
  y1direction *= -1;
  
  x2direction *= -1;
  y2direction *= -1;
  
  
  
  
}











}








