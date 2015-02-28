
//Draw diagnol lines

void setup(){
  size(600,200);
  smooth();
  background(0);
}



/*hard coded lines
void draw(){
  strokeWeight(8);
  line(20,40,80,80);
  line(80,40,140,80);
  line(140,40,200,80);
  line(200,40,260,80);
}
*/

void draw(){
  for(int i = 20; i < 400; i+=16){
    strokeWeight(8);
    stroke(random(0,255),random(0,255),random(0,255));
    line(i,40, i+i/2, 80);
    line(i+i/2,80,i,120);

  }
}
