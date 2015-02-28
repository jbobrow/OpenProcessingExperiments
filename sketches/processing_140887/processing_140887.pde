
void setup() {
  size(600,600);  
  background(0); 
  smooth();
  frameRate(10);

}
 
void draw() {
   
   
int vonal1 = round(random(50,500));
int vonal2 = round(random(50,500));
int vonal3 = round(random(50,500));
int vonal4 = round(random(50,500));
int von1 = round(random(50,500));
int von2 = round(random(50,500));
int von3 = round(random(50,500));
int von4 = round(random(50,500));

fill(0,0,0,5);
noStroke();
 
rect(50,50,800,800);

noFill();
stroke(255);
 
quad(vonal1,von1,vonal2,von2,vonal3,von3,vonal4,von4);
   
}

