
void setup() 
{ 
  size(512, 508);
} 


float sw = 7;
int clicktimes;
float hue;
float blu = 180;
float yelo = 46;

void draw() 
{ 
  colorMode (HSB, 255);
  smooth(); 
if (clicktimes == 0){
  background(0,0,255);
} else {
  background(hue,125,200);
}


  fill(yelo,211,255);                        //yellow
if (sw == 17){
  yelo = random(20,40);
}
  noStroke();
  rect(317, 0, 492-317, 188);
  rect(0, 384, 58, 508-384);

  strokeWeight(sw);
  strokeCap(SQUARE);
  stroke(0);
  line(9, 189, 488, 189);

  fill(10,225,255);                        //red
  noStroke();
  rect(58, 58, 262, 260);
  rect(485, 388, 512-485, 508-388);

  fill(0);
  rect(58, 320, 188-58, 446-320);
  rect(188, 446, 317-188, 481-446);

  fill(blu,232,200);                        //blue
  if (sw == 17){
  blu = blu + random(30,70);
  if ( blu > 255){
    blu = random(0,255);
  }
}
  rect(317, 385, 485-317, 483-385);

  strokeWeight(sw);
  strokeCap(SQUARE);
  stroke(0);
  line(9, 60, 488, 60);
  line(58, 319, 488, 319);
  line(9, 387, 512, 387);
  line(55, 60, 55, 493);
  line(58, 446, 314, 446);
  line(192, 480, 483, 480);
  line(121, 10, 121, 56);
  line(191, 322, 191, 500);
  line(320, 10, 320, 480);
  line(404, 189, 404, 318);
  line(489, 15, 489, 500);
if (clicktimes == 4){
  beat();
}
}



void mouseClicked() {
  hue = random(0,255);
  if (clicktimes < 4){
  clicktimes = clicktimes + 1;
//  println(clicktimes);
  }

}



void beat() {
  if (hue < 100){
    hue = hue + random(5,20);
  }
  else {
    hue = 0;
  }

  if (sw > 2) {
    sw = sw-0.5;
  } 
  else {
    sw = 17;
  }
}



