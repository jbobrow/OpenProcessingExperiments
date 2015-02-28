
void setup(){
size(564,423);
background(255);
}
  
void draw(){
/*rect */
fill(255,0,0);
rect(60,60,100,100);
fill(0,0,255);
rect(300,60,160,100);
fill(255,255,0);
rect(60,240,100,60);
strokeWeight(10);
/*vertcales*/
line(60,0,60,423);
line(160,0,160,423);
line(300,0,300,423);
line(460,0,460,423);
/* horizontales */
line(0,60,564,60);
line(0,160,564,160);
line(0,300,564,300);
line(0,460,564,460);




}
