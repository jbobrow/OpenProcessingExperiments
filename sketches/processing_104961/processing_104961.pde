
int sep = 5;

void setup(){
  //scale(20); ???
  size(500, 496);
  
  background(223, 232, 229);
  
}

void draw(){

strokeWeight (sep);
//top horizontal
line(10, 50, 470, 50);
//second horizontal down
line(10, 372, 470, 372);
//third big horizontal fourth horizontal from top
line(10, 370, 120, 370);
//far right vertical
line(480, 10, 480, 500);
//tall left vertical up from red
line(120, 10, 120, 50);
//left side of yellow vertical
line(320, 10, 310, 470);
//left side of red vertical
line(50, 50, 50, 480);
//horizontal on bottom of red
line(50, 310, 470, 310);
fill(218, 48, 31);
//red top leftx, top lefty, width, height 
rect(120, 115, 525, 512);
// upper right yellow
fill(250, 203, 85);
rect(320, 1, 160, 171);
//blue box
fill(48, 9, 159);
rect(320, 310, 160, 171);

}


