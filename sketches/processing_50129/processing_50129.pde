
void setup(){
  size(400,400);
  background(0);
}



void draw(){


float distx = random(100);
float disty = random(100);
float distx2 = random(100,400);
float disty2 = random(100,400);

stroke(random(200,256), random(200,256), random(100,150));
line(distx, mouseY, distx, 100 );
stroke(random(100,256), random(200,250), random(50,250));
line(0, disty, 100, disty);

stroke(random(100,125), random(100,125), random(50,75));
line(distx , 100, distx, 200 );
stroke(random(50,175), random(100,125), random(25,125));
line(100, disty, 199, disty);

stroke(random(200,256), random(200,256), random(50,75));
line(distx , 200, distx, 300 );
stroke(random(200,256), random(200,256), random(25,125));
line(200, disty, 300, disty);

stroke(random(100,125), random(100,125), random(50,75));
line(distx , 300, distx, 400 );
stroke(random(50,175), random(100,125), random(25,125));
line(300, disty, 400, disty);


if(mouseY > 30 && mouseY <50)
stroke(random(200,255),random(10,100),random(10,100));
line(distx2 , mouseY, distx2, 400 );

if(mouseY > 50 && mouseY < 70)
stroke(random(10,100), random(10,100), random(200,255));

if(mouseY > 80 && mouseY < 100)
stroke(random(200,255), random(200,255), random(10,20));
line(distx2 , mouseY, distx2, 400 );

stroke(random(50,175), random(100,125), random(25,125));

line(100, disty2, 400, disty2);

}
