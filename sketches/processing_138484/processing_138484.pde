
class DancingFred{


int i;
float s = 0.5;


//constructor
DancingFred(int tempi, float temps){
  i = tempi;
  s = temps;
}


void crazyDance(){
  for(int i = 20; i < width; i += 100){
  fred(i, random(50, 100), random(0.5, 1.2));
  }
}

void fred(){
  pushMatrix();
 scale(s);
//body structure
fill(8, 160, 32); //green
rect(360, 180, 50, 260);
arc(385, 440, 50, 40, 0, PI); //botton arc
arc(385, 180, 50, 70, PI, TWO_PI); //top arc

strokeWeight(3);
ellipse(375, 220, 10, 15); //left eye
ellipse(390, 220, 10, 15); //right eye
ellipse(374, 222, 4, 4); //inner left eye
ellipse(389, 222, 4, 4); //inner right eye 

point(375, 237); //freckles
point(367, 245);
point(365, 238);
point(397, 238);
point(404, 237);
point(399, 245);

fill(255); //mouth
ellipse(383, 250, 4, 4); 

strokeWeight(1); //left arm
fill(8, 160, 32);
beginShape();
vertex(365, 274);
vertex(317, 285);
vertex(313, 315);
vertex(317, 315);
vertex(321, 289);
vertex(365, 278);
endShape();

beginShape(); //right arm
vertex(405, 274);
vertex(463, 285);
vertex(469, 255);
vertex(465, 255);
vertex(459, 281);
vertex(405, 270);
endShape();
//fred ends
popMatrix();
}
}


DancingFred pickle;

void setup(){
 size(480, 480);
smooth();
pickle = new DancingFred(20, 0.5);
}

void draw(){
 pickle.crazyDance();
 pickle.fred(); 
}


