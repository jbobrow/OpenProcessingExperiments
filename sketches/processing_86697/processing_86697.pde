
int r1,r2,r3,r4;
int rp1,rp2,rp3,rp4;


void setup() {
  size(450, 350);
  background(255);
r1=random(3);
r2=random(3);
r3=random(3);
r4=random(3);
rp1=0;
rp2=0;
rp3=0;
rp4=0;

println("A random number between 0 and 10 happens to be "+int(random(11)));
println("A random number between 1 and 6 happens to be "+int(random(6)+1));

}

void draw() { 
background(0);
stroke(255);
line(400,0,400,350);
noStroke();
fill(100,100,100);
rect(rp1,50,25,25);
fill(150,150,100);
rect(rp2,100,25,25);
fill(150,100,100);
rect(rp3,150,25,25);
fill(100,150,100);
rect(rp4,200,25,25);
rp1=constrain(rp1+r1+random(4)-1.5,0,400);
rp2=constrain(rp2+r2+random(4)-1.5,0,400);
rp3=constrain(rp3+r3+random(4)-1.5,0,400);
rp4=constrain(rp4+r4+random(4)-1.5,0,400);

}
