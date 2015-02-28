
void setup() {
  size(200, 200);
   background(255);}

int x;
int y;
boolean A=true;
 


void draw() {
  
strokeWeight(1);
for(x=10;x<200;x=x+20){
  for(y=10;y<200;y=y+20){
    if(A=!A){
        fill(0);}
          else{
               fill(255);}
                  ellipse(x,y,10,10);
      }
    A=!A;
    }
}


