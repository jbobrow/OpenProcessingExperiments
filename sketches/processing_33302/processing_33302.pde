
float x = 30;
float y = random(30,60);
float yspeed = 2;



void setup(){
size(500,500);
frameRate(50);
smooth();


}

void draw(){





PImage b;
b = loadImage("unkle.jpg");
image(b, 0, 0);

stroke(random(255),random(255),random(255),100);
for(int i = 0; i < width-30; i += 65){    

fill(random(255),random(255),random(255),100);
ellipse(x+i,y,60,60);



line(0,100,500,100);
line(0,200,500,200);
line(0,300,500,300);
line(0,400,500,400);


if(y > 130 && y <= 430){
if(y > 130 && y <=230){

fill(0);
ellipse(x+i,y,60,60);
}

else if(y > 230 && y <= 330){

fill(0,255,0);
ellipse(x+i,y,60,60);
  
}


else if(y > 330 && y <= 430){

fill(0,0,255);
ellipse(x+i,y,60,60);
  
}
}






}


y = y + yspeed;
}

