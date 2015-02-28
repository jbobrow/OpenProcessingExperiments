
int a1 = 0; //x top left
int a2 = 0; //y top left
int a3 = 0; //x top right
int a4 = 0; //y top right
int a5 = 0; //x bottom left
int a6 = 0; //y bottom left
int a7 = 0; //x bottom right
int a8 = 0; //y bottom right
float i = 0; //R value
float j = 0; //B value
float k = 0; //B value
float m = 0; //color changer

void setup() {
  size (400,400);
  a1 = width/2 - int(random(0,width/2)); //x top left start pos
  a2 = height/2 - int(random(0,width/2)); //y top left start pos
  a3 = width/2 + int(random(0,width/2)); //x top right start pos
  a4 = height/2 - int(random(0,width/2)); //y top right start pos
  a5 = width/2 - int(random(0,width/2)); //x bottom left start pos
  a6 = height/2 + int(random(0,width/2)); //y bottom left start pos
  a7 = width/2 + int(random(0,width/2)); //x bottom right start pos
  a8 = height/2 + int(random(0,width/2)); //y bottom right start pos
  background(255);
}

void draw() {
  i = 127+127*sin(m+(2*PI*1/3));
  j = 127+127*sin(m+(2*PI*2/3));
  k = 127+127*sin(m+(2*PI*3/3));
  a1 += int(random(-3,3));
  a2 += int(random(-3,3));
  a3 += int(random(-3,3));
  a4 += int(random(-3,3));
  a5 += int(random(-3,3));
  a6 += int(random(-3,3));
  a7 += int(random(-3,3));
  a8 += int(random(-3,3));
  
  
  fill(255,0);
  stroke(i,j,k);
 quad(a1,a2,a3,a4,a7,a8,a5,a6); 
 //stroke(255);
 //for (float c = 0; c < width; c++) {
 // point(c, 127+127*sin((c/50)+(2*PI*1/3))); 
 // point(c, 127+127*sin((c/50)+(2*PI*2/3)));
 // point(c, 127+127*sin((c/50)+(2*PI*3/3)));
 //}
 m = m+0.02;
 noStroke();
 //fill(i,j,k);
 //rect(0,0,50,50);
 fill(255,12);
 rect(0,0,width,height);
}
                
void mouseClicked(){
setup();
}
