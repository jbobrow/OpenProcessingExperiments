


void setup(){
  size(500,500);
  smooth();
  }

void draw() {
  
background(0);

stroke (255);
randomSeed(mouseX);

int count = 100;


for(float j=0; j<count+1; j=j+ random(10)) {
  
for(float i=0; i<count+1; i=i+random (10)) {
 
  strokeWeight(1);
  ellipse2(width/count*j,height/count*i,random(5, 35),(100),j*25,0);
}

}



}


void ellipse2(float x, float y, float r, float rot, float gruen, float blau) {
  
  
  
fill(255);
rect (x,y,10,10);


fill(255);
ellipse(x,y,r-10,r-10);


fill(random(255),random(255),random(255));
ellipse(x,y,10,10);  
}  

