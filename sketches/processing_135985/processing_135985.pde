
int x = 1;
   
void setup(){
  
 size (400, 400);
  background (255);
}
void draw (){
strokeWeight (5);
stroke(random(255), random(255), random(255));

line(0, x, 400, x);
x = x*2;


}


