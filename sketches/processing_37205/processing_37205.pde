
int a= 50;
int b= 100;

void setup() {
size(500,500);
background(0);
}
void draw () {
  if(mousePressed){  
fill(101,40,131);
noStroke();
smooth();
rect(a-40,a-40,b,pmouseY);
  }
else {
  fill(213);
 noStroke();
smooth();
rect(a-40,a-40,b,pmouseY); 
}
fill(137);
noStroke();
rect(b+10,b+10,pmouseX,b);
fill(80);
noStroke();
rect(b+110,b+110,b,pmouseY);
fill(30);
noStroke();
rect(b+210,b+210,pmouseX,b);
}



