
void setup (){

 size(500,500);
 background(color(#207F89));
 
 
}

void draw (){

 for (int x=1; x<=480; x = x+=40 ){
 for (int y=1; y<=480; y = y+=50 ){
     fill(random(140,255),random(140,255),random(140,255));
   rect(x+(random(-1,12)), y+0, width-5, height+10);
   stroke(color(#122D52));
 }
 }
saveFrame("dobleforyoyicastillo.jpg"); }
