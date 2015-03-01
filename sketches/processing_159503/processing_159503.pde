
int counter;

void setup(){
  size(1000,1000);

counter = 0;
}
void draw(){
  counter++;
  
background(random(255),random(255),random(255));
  
fill(random(255),random(255),random(255),random(255));
noStroke();


rect(400,400,300,350);
//back
fill(random(255),random(255),random(255),random(255));
rect(100,100,500,550);

fill(random(255),random(255),random(255),random(255));
rect(500,100,500,550);

fill(random(255),random(255),random(255),random(255));
rect(100,100,500,550);

//over
fill(random(255),random(255),random(255),random(255));
rect(600,300,450, 350);

fill(random(255),random(255),random(255),random(255));
rect(300,500,450,400);

fill(random(255),random(255),random(255),random(255));
rect(400,200,550, 350);

fill(random(255),random(255),random(255),random(255));
rect(100,400,350,400);

fill(random(255),random(255),random(255),random(255));
rect(650,100,210,350);

fill(random(255),random(255),random(255),random(255));
rect(200,600,450,400);

fill(random(255),random(255),random(255),random(255));
rect(400,200,600,400);

fill(random(255),random(255),random(255),random(255));
rect(100,400,500,550);

fill(random(255),random(255),random(255),random(255));
rect(80,304,350,150);

fill(random(255),random(255),random(255),random(255));
rect(100,200,400,150);

fill(random(255),random(255),random(255),random(255));
rect(100,100,500,550);

//over
fill(random(255),random(255),random(255),random(255));
rect(600,300,450, 350);

fill(random(255),random(255),random(255),random(255));
rect(300,200,550,400);

fill(random(255),random(255),random(255),random(255));
rect(200,400,250, 150);

fill(random(255),random(255),random(255),random(255));
rect(100,200,552,100);

fill(random(255),random(255),random(255),random(255));
rect(50,50,113,257);

fill(random(255),random(255),random(255),random(255));
rect(100,200,354,500);

fill(random(255),random(255),random(255),random(255));
rect(200,200,203,200);

fill(random(255),random(255),random(255),random(255));
rect(300,300,300,350);

//border

fill(0,0,0);
rect(0,0,240,1000);

rect(0,0,1000,240);

rect(0,760,1000,240);

rect(0,0,1000,240);

rect(760,0,240,1000);

fill(random(255),0,random(255));

rect(587,360,46,46);

rect(387,360,46,46);

rect(367,610,296,46);
}


