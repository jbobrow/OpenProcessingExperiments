
void setup() {
  size(600, 600);
  smooth();
  background(205, 236, 241);
};

int face_width = 300;
int face_height = 400;
int eye_size = 50;
int pupil_size = 20;
int reflection_size = 5;
int number_of_hairs = 150;

void draw() {  
  
  fill(205, 236, 241, 60);
  rect(0, 0, width, height);
  //background(255);
  
  for (int i = 0; i < number_of_hairs; i+=5) {
    stroke(125, 61, 0);
    line(i + random(230, 240), random(5, 30), i + 230, 140);
  };
  
  // face
  noStroke();
  fill(244, 218, 203);
  ellipse(300, 300, face_width, face_height);
  // eyes
  fill(255);
  ellipse(250, 250, eye_size, eye_size);
  ellipse(350, 250, eye_size, eye_size);
  // pupils
  fill(0);
  ellipse(250, 240, pupil_size, pupil_size);
  ellipse(350, 240, pupil_size, pupil_size);
  // eyes reflections
  fill(255);
  ellipse(252, 235, reflection_size, reflection_size);
  ellipse(352, 235, reflection_size, reflection_size);
  // eyebrows
  stroke(125, 61, 0);
  line(230, 210, 270, 200);
  line(330, 200, 370, 210);
  // mouth
  noStroke();
  fill(205, 22, 62);
  ellipse(300, 380, 30, 60);
  // nose
  fill(226, 190, 174);
  ellipse(290, 320, 10, 5);
  ellipse(310, 320, 10, 5);
  // ears
  fill(244, 218, 203);
  ellipse(150, 300, 30, 100);
  ellipse(450, 300, 30, 100);
  // ears holes
  fill(226, 190, 174);
  ellipse(145, 310, 10, 20);
  ellipse(455, 310, 10, 20);
}; 

