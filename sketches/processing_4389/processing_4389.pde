
void setup(){ 
size(1920,1440);} 
void draw(){background(255);
for (int b=6;b<1446;b +=60)
{for (int a=6;a<1926;a +=60)
{rect(a,b,48,48);fill(0,0,((random(3)-1)*(abs(255-((8*second()+30))))));
}}}

