
void setup () {
size(800,600);
background(0);
smooth();
}
 
void draw () {
background (255);

int a = mouseY+10;
int b = width/10;
 
for(int j = 0; j<=b;j++){
for(int i = 0; i<=b;i++) {
 
rect(a*i,a*j,a,a);
 
if(keyPressed) {
if(key=='1')
stroke (255); 
fill(random(1,255),random(1,255),random(1,255));
}
 

if(keyPressed) {
if(key=='2')
fill(random(1,255));
stroke (mouseY+random(1,50),0+mouseX/2+random(1,50),mouseY/2+random(1,50));
}
 
if(keyPressed) {
if(key=='3')
fill(mouseY+random(1,30),0+mouseX/2+random(1,30),mouseY/2+random(1,30));

if(mousePressed) {
ellipse(a*i,a*j,a,a);
}
 
}
}
}
}


