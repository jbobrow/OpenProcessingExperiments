
PImage[] pics = new PImage[12];
int[] checklist = new int[12];
int i, j, k, l, m, give;

void setup() {
  size(850, 650);
  background(0);
  loop();
  imageMode(CENTER);
  pics[0] = loadImage("armand.jpg");    //0-3 Smiles; 4-5 Action; 6-9 Calm; 10-11 Serious
  pics[1] = loadImage("rhythm.jpg");    //0-5 are "warmer" emotions, 6-11 are "cooler" emotions
  pics[2] = loadImage("rock.jpg");
  pics[3] = loadImage("sheila.jpg");
  pics[4] = loadImage("brassband.jpg");
  pics[5] = loadImage("standup.jpg"); 
  pics[6] = loadImage("amigos.jpg");
  pics[7] = loadImage("campus.jpg");
  pics[8] = loadImage("chalkboard.jpg");
  pics[9] = loadImage("earnest.jpg");
  pics[10] = loadImage("fandango.jpg");
  pics[11] = loadImage("fipp.jpg");

  CheckRefresh();
}

void draw() {
  //println(millis());
  m = millis() % 1000;
  if ((m >= 270) && (m <= 288)) {      //range accounts for frame rate not being able to be precise
    Collage();
    CheckRefresh();
  }
  //image(img, 0, 0);
}

void CheckRefresh() {                  //refreshes the "has this picture been used" array
  //println("RefreshRun");
  for (l = 0; l < 12; l++) {
    checklist[l] = 1;
  }
}

void Collage() {
  //println("CollageRun");
  for (i = 125; i < width; i += 200) {
    for (j = 125; j < height; j += 200) {
      k = int(random(12));
      if (checklist[k] == 1) {
        give = int(random(1, 50)) - 25;    //"give" variable shifts position and rotation of photos by some small random amount
        if (k < 6) tint(200, 150, 150);    //pictures have their tint changed based to be more red or blue based on emotion represented
        else tint(150, 150, 200);
        //pushMatrix();
        rotate(radians(give/2));
        image(pics[k], i+give, j+give);
        //popMatrix();
        rotate(-radians(give/2));
        checklist[k] = 0;
        //noTint();
      } 
      else {
        j -= 200;
      }
    }
  }
}


