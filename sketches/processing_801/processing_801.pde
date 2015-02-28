

void setup() {
  size(300, 300);
  background(int(random(255)),int(random(255)),int(random(255)));
  frameRate(600);
//smooth();
}
int arrowL = 300;
int arrowW = int(random(40)+1);
int xa = width+arrowL;
int ya = int(random(height));
Arrow A1 = new Arrow();
int bac1 = int(random(255));  
int bac2 = int(random(255));  
int bac3 = int(random(255));  
   
void draw() {
  noStroke();
  
 if(xa>=-arrowL-arrowW){
    xa-=1;
    A1.update(xa);
 }
 else{
    xa = width+arrowL;
    ya = int(random(height));
    arrowW = int(random(40)+1);
    bac1 = int(random(255));  
    bac2 = int(random(255));  
    bac3 = int(random(255)); 
 }
arrowL = 300-mouseY;
}
class Arrow{
     void update(int xa){
     line(xa, ya, xa+arrowL, ya+arrowL);
     line(xa, ya, xa+arrowL, ya-arrowL); 
       stroke(bac1,bac2,bac3);
         strokeWeight(2);
     line(xa+arrowW, ya, xa+arrowL+arrowW, ya+arrowL);
     line(xa+arrowW, ya, xa+arrowL+arrowW, ya-arrowL); 
     }
}

