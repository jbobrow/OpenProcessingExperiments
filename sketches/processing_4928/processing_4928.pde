
//Eye myEye;
//Eye myOtherEye;

Eye[] eyeballs = new Eye[5];

float body_x, body_y;

void setup(){
  size(600, 600);
  smooth();

  body_x = width/2;
  body_y = height*0.8;

  //yEye = new Eye(200, 300);
  //myOtherEye = new Eye(400, 300);

  for(int i = 0; i< eyeballs.length; i++){
    color eyeColor = color(random(100, 255), 0, 0);
    eyeballs[i] = new Eye(random(0, width), random(0, height), eyeColor); 
  }

}

void draw(){



  background(100);

  body_x += random(-1, 1);
  body_y += random(-1, 1);

  //myEye.draw();
  //myOtherEye.draw();

  for(int i = 0; i< eyeballs.length; i++){
    eyeballs[i].draw();
  }
}


class Eye{
  float x;
  float y;
  color eye_color;
  float pupil_x, pupil_y;

  Eye(float init_x, float init_y, color init_color){
    x = init_x;
    y = init_y;
    eye_color = init_color;

  }

  void draw(){

    x = x +random(-1, 1);
    y = y +random(-1, 1);


    stroke(255);
    strokeWeight(20);
    line(body_x, body_y, x, y);

    float angle = atan2(mouseY -y, mouseX -x);
    pupil_x = lerp(pupil_x, 25 * cos(angle), 0.1);
    pupil_y = lerp(pupil_y, 25* sin(angle), 0.1);


    pushMatrix();
    translate(x, y);
    noStroke();
    fill(255);
    ellipse(0, 0, 100, 100);

    //pupil
    //float angle = atan2(mouseY-y, mouseX-x);
    rotate(angle);

    noStroke();

    translate(pupil_x, pupil_y);
    fill(eye_color);
    ellipse(0, 0, 50, 50);
    fill(0);
    ellipse(0, 0, 6, 14);

    popMatrix();

  }

}











