
int num_of_eyes = 20;
int num_of_noses = 20; 
int num_of_mouths = 20;
int eye_place = int(random(num_of_eyes) ); 
int nose_place = int(random(num_of_noses) ); 
int mouth_place = int(random (num_of_mouths) ); 
int current_hour = -1;
int current_minute = -1; 
int current_second = -1; 

PImage [] noses = new PImage [num_of_noses];
PImage[] eyes = new PImage [num_of_eyes]; 
PImage [] mouths = new PImage [num_of_mouths]; 

void setup () {
  size (1224, 1008);
  for (int i = 0; i<eyes.length; i += 1) {
    int img_num = i + 1;
    eyes[i] = loadImage("eye_" + img_num + "_03.jpg");
  }
  for (int i = 0; i<noses.length; i += 1) {
    int img_num = i + 1; 
    noses [i] = loadImage ("nose_" + img_num + "_05.jpg");
  }
   for (int i = 0; i<mouths.length; i += 1) {
    int img_num = i + 1; 
    mouths [i] = loadImage ("mouth_" + img_num + "_07.jpg");
  }
}

void draw () {
  
  background(0);
  if (current_hour != hour() ) {
    eye_place = int(random(num_of_eyes) );
    current_hour = hour ();
  }
  
   if (current_minute != minute() ) {
    nose_place = int(random(num_of_noses) );
    current_minute = minute ();
  }
   if (current_second != second() ) {
    mouth_place = int(random(num_of_mouths) );
    current_second = second ();
  }

  image(eyes[eye_place], 420, 284);
  image (noses[nose_place], 420, 434);
  image (mouths[mouth_place], 420, 566, 438, 242); 
}



