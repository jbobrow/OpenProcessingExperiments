
int a;
int b;
int c;
void setup() {
size (500,500);
background (255); 
}
void draw () {
for (int a=0;a<500;a+=1) {

b = int(random(width));
//background(255);//
stroke(mouseX*random(1,10),mouseY*random(1,10),mouseY*random(1,10));
strokeWeight(random(5));
line(b,a,b,a+10); 
}
}



