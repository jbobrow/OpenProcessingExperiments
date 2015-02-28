
float p=1;
float o=1;
float b=1;
float g=1;
float r=1;
float n=1;
float f=1;
float i;

void setup()
{
size(250,250);
smooth();

 
}
void draw()
{
  background(0,12);
for (int i=0; i<300; i++);
frameRate(20);
strokeWeight(random(5));
stroke(255,200);
point(i+random(250),i+random(250));

strokeWeight(0.3);
stroke(#fffc01,50);
noFill();
frameRate(15);
ellipse(125,125,random(300),random(300));

//pink
noStroke();
p = p-0.95;
fill(#fa0bd5,150);
rectMode(CENTER);
rect(p+220,190,15,15);

fill(#fa0bd5,100);
rectMode(CENTER);
rect(p+220,190,30,30);

fill(#fa0bd5,50);
rectMode(CENTER);
rect(p+220,190,50,50);

//orange
noStroke();
o = o + 1;
fill(#fab735,200);
rectMode(CENTER);
rect(o+20,70,20,20);

fill(#fab735,150);
rectMode(CENTER);
rect(o+20,70,45,45);

fill(#fab735,100);
rectMode(CENTER);
rect(o+20,70,70,70);

//blue
noStroke();
b = b+1.1;
fill(#3000fe,150);
rectMode(CENTER);
rect(b+10,150,10,10);

fill(#3000fe,100);
rectMode(CENTER);
rect(b+10,150,20,20);

fill(#3000fe,50);
rectMode(CENTER);
rect(b+10,150,30,30);

//green
noStroke();
g = g - 1.3;
fill(#66fa04,150);
rectMode(CENTER);
rect(g+220,220,25,25);

fill(#66fa04,100);
rectMode(CENTER);
rect(g+220,220,45,45);

fill(#66fa04,50);
rectMode(CENTER);
rect(g+220,220,75,75);

//red
noStroke();
r = r + 0.4;
fill(#fe2c02,150);
rectMode(CENTER);
rect(g+250,g+250,40,40);

fill(#fe2c02,100);
rectMode(CENTER);
rect(g+250,g+250,90,90);

fill(#fe2c02,50);
rectMode(CENTER);
rect(g+250,g+250,120,120);

//random small ones
noStroke();
n = n + 1.5;
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,5,2,2);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,5,5,5);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,5,8,8);

fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,55,2,2);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,55,5,5);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,55,8,8);

fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,155,2,2);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,155,5,5);
fill(#03fef5,150);
rectMode(CENTER);
rect(n+0,155,8,8);



noStroke();
f = f - 1.5;
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,225,2,2);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,225,5,5);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,225,8,8);

fill(#feef03,150);
rectMode(CENTER);
rect(f+250,175,2,2);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,175,5,5);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,175,8,8);

fill(#feef03,150);
rectMode(CENTER);
rect(f+250,155,2,2);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,155,5,5);
fill(#feef03,150);
rectMode(CENTER);
rect(f+250,155,8,8);

}                               
