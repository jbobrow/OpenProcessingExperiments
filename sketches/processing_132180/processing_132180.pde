
/* new */

//define variables

int i = 20; //eye height
int j = 55; //eye width
int k = width/2;

//This runs once
void setup() {
  size(500, 500);
  background(230);
  //noStroke();
}

void draw() {
  fill(193,189,184);
  triangle(170, 100, 250, 180, 180, 200); //left ear
  triangle(330, 100, 250, 180, 320, 180); // right ear
  quad(190, 360, 215, 360, 210, 400, 200, 400); //left leg
  quad(310, 360, 285, 360, 290, 400, 300, 400); //right leg
  triangle(210, 402, 200, 402, 205, 425); //left calf
  triangle(290, 402, 300, 402, 295, 425); //right calf
  triangle(206, 423, 195, 433, 206, 433);
  triangle(296, 423, 285, 433, 296, 433); // right foot
  //noStroke();
  ellipse(205, 400, 12, 12); //left knee
  ellipse(295, 400, 12, 12); //right knee
  //stroke(0,0,0);
  quad(220, 220, 280, 220, 320, 370, 180, 370); //torso
  ellipse(250, 200, 200, 150); //head
  fill(250, 240, 0);
  ellipse(200, 190, j, i); //left eye
  ellipse(300, 190, j, i); //right eye
  fill(0, 0, 0);
  /*for(int j = 188; j < width/2; //need to figure out how to move the eyes
  for(mouseX < (width/2)){
    for(mouseX > 188){
      int j = mouseX;
    }
  }
  */
  if (mouseX <= k - 25) {
    ellipse(190, 190, 6, i-2); //left pupil originall
    ellipse(290, 190, 6, i-2); //right pupil
  }
  else if (mouseX >= k + 25) {
    ellipse(215, 190, 6, i-3); //left pupil originall
    ellipse(315, 190, 6, i-3); 
  }
  else if(mouseX > k - 25) {
    if(mouseX < k +25){
    ellipse(205, 190, 6, i-2);
    ellipse(305, 190, 6, i-2);
  }
  }
     
  strokeWeight(2);
  stroke(254, 170, 170);
  triangle(246, 202, 254, 202, 250, 206);
  strokeWeight(1.2);
  stroke(0,0,0);
  line(250, 206, 236, 220); //mouthleft
  line(250, 206, 264, 220); //mouthright
  line(170, 210, 130, 205); //whisker upper left
  line(170, 215, 131, 220); //whisker lower left
  line(330, 210, 370, 205); //whisker upper right
  line(330, 215, 370, 220); //whisker lower right

  

  
  //line(
}

//This repeats over and over



