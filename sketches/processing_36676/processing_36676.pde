
void setup() {
  size(300, 600);
  background(255); //the sky
  fill(0, 0, 255);
  rect(0, 0, 300, 600);
  fill(232, 199, 115); //body of the hosue
  rect(130, 50, 250, 550);
}

int num =400;
float count=200;


void draw() {
  if ((num>50) && (num<200) ) {  //controls the upper half of the house's shingles, which count down from 200.
    fill(10, random(width), 115);

    rect(130, random(0, 300), random(0, 180), 1000/num);
  }
  //else {
  if ((num>=200) && (num<=400)) {  //controls the lower half of the house's shingles, which count down from 400.
    fill(232, 199, random(width));

    rect(130, random(300, 600), random(0, 180), 2000/num);
  }

  //roof structure
  noStroke();
  fill(0, 0, 255);
  triangle(0, 0, 300, 0, 50, 50);
  //Decorative trim
  fill(65);
  stroke(1);
  triangle(50, 50, 300, 50, 300, 0);
  fill(232, 199, 115);
  rect(80, 50, 250, 7);
  rect(85, 57, 250, 10);
  rect(88, 67, 250, 4);

  //facade origin
  line(130, 71, 130, 600);
  num--;
}   




