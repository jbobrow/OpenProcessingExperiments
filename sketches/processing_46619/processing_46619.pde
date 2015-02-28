
void setup (){
 size(500,500);
 }
 
void draw (){
 
 for (int x=5; x<=550; x = x+=30 ){
 for (int y=5; y<=550; y = y+=30 ){
     fill(random(0,250),random(2,200),random(140,160));
   ellipse(x+(random(0,12)), y+0, 100,100);
   stroke(#E58BFF);
   noStroke(); 
 }
 }
saveFrame("DavidGarcía_FOR.jpg"); }


