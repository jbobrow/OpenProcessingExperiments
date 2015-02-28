
PImage myPic;
void setup(){
size(600,600,P3D);
lights();
}



int count = 0;

void draw (){
   background(0);
   myPic = loadImage("rainbow.jpg");
   lights();
   float rot = map(mouseX, 0, width, 0, TWO_PI);
   translate(width/2, height/2, 0);
   
int a = floor(random(0,myPic.width));    
  int b = floor(random(0,myPic.height)); 
  
for(int x=-150; x<=150; x+=20){
  pushMatrix();
  translate(x*2,-count/8, 10);
  rotateY(rot);
  
  box(20,count-230,20);
  color myColor = myPic.get(a,b);      
  fill(myColor);
  

  popMatrix();
  noStroke();
  count ++;
}
}


