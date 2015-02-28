
void setup () {
  
  size(400,480);
  smooth();
}

void draw (){
  strokeWeight(8);
line (100,0,100,480);
line(1,350,400,350);

strokeWeight(12);
line(1,100,100,100);

fill(200,78,43);
noStroke();
rect(103,1,300,347);

fill(157,157,255);
noStroke();
rect(1,355,95,150);

stroke(0);
strokeWeight(6);
line(350,350,350,480);

strokeWeight(12);
line(355,420,400,420);

fill(217,217,0);
noStroke();
rect(352,424,54,60);

}

