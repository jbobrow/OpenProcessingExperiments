
//Mies_Brick House as the foundation 
//Object_Switch all units composing this composition into random units.

void setup() {
  size (600, 300);

  background (255);
  //dominent lines 
  strokeWeight(5);
  stroke (200);
  line (230, 0, 230, 50); //1
  line (0, 75, 250, 75); //2
  line (250, 75, 250, 50); //3
  line (250, 30, 300, 30); //4
  line (275, 50, 325, 50); //5
  line (175, 100, 275, 100); //6
  line (275, 125, 275, 200); //7
  line (275, 140, 310, 140); //8
  line (300, 75, 300, 125); //9
  line (200, 190, 200, 225); //10
  line (200, 225, 280, 225); //11
  line (325, 200, 325, 300); //12
  line (300, 160, 425, 160); //13
  line (375, 125, 450, 125); //14
  line (415, 125, 415, 140); //15
  //lighter lines
  strokeWeight (2);
  smooth();
  line (480, 145, 490, 145); //16
  line (480, 175, 600, 175); //17
  line (475, 100, 525, 100); //18
  line (510, 100, 510, 130); //19
  line (510, 125, 530, 125); //20
  line (540, 125, 540, 100); //21
  line (530, 140, 530, 170); //22
  line (550, 137, 560, 137); //23
  line (560, 137, 560, 147); //24
  //Rectangual units  
  strokeWeight (3);
  stroke (255, 0, 0);
  rect (175, 150, 60, 10);
  rect (455, 145, 7, 30);
}

int numline = 0; //change the numer of the lines on the screen

float H; 
float V;

float a = random(0, 100); //define probability here



void draw() {

  stroke (0);
  H = random (width); // random lenghth
  V = random (height); // random height

    if (numline < 12) { // limited the probability 
    strokeWeight (random(5)); // random stroke weight
    line (random (H), V, H, V);

    if (a > 30) { //30% cahnce to have otrhogonal angle
      line (V, H, V, random (H));
    }
    else {
      line (H, random (V), H, random(H));
    }
  } else {
    noStroke();
    fill (255, 0, 0); // fill the ractangles with red
    rect (175, 150, 60, 10);
    rect (455, 145, 7, 30);
  }

  numline ++;
}


