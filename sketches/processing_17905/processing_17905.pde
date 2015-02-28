

int counter=20;
boolean Day=true;
int reaction=0;
int br=196;
int bg=233;
int bb=251;
int or=241;
int og=90;
int ob=41;
int tr=252;
int tg=240;
int tb=155;
int gr=141;
int gg=198;
int gb=63;

int blueColor = color(br,bg,bb);
int orangeColor = color(or,og,ob);
int tanColor = color(tr,tg,tb);
int greenColor = color(gr,gg,gb);
int darkorangeColor = color(187, 70, 29);
int blackColor = color(0);
int whiteColor = color(255);

void setup() {
  size(200,200);
  smooth();
}

//setup fox
void fox() {
  noStroke();
  fill(blueColor);
  rect(50, 50, 100,100);
//body
  fill(orangeColor);
  triangle(89.36, 38.78, 53.23, 182.9, 124, 182.9);
//tail 
  ellipse(159,138, 72, 150);
  fill(blueColor);
  ellipse(175,196, 80, 141);
//face  
  fill(orangeColor);
  rect(53, 38, 72, 47.91);
  triangle(68.68, 5.65, 53.23, 38.78, 85.6, 38.78);
  fill(blackColor);
  triangle(68.68, 5.65, 63.77, 16.18, 74.05, 16.18);
//ears  
  fill(orangeColor);
  triangle(108, 5.65, 92.55, 38.78, 124.92, 38.78);
  fill(blackColor);
  triangle(108, 5.65, 103.09, 16.18, 113.37, 16.18);  
//cheeks  
  fill(orangeColor);
  triangle(53.23, 38.78, 34.93, 62.74, 53.23, 86.69);
  triangle(124.78, 38.78, 143.08, 62.74, 124.78, 86.69);
  fill(tanColor);
  triangle(34.93, 62.74, 71.21, 67.04, 53.23, 86.69);
  triangle(71.21, 67.04, 53.23, 86.69, 82.5, 87.58);
  triangle(143.08, 62.74, 106.8, 67.04, 124.78, 86.69);
  triangle(95.51, 87.58, 106.8, 67.04, 124.78, 86.69);
//legs  
  fill(orangeColor);
  ellipse(118.23, 200, 52.32, 90);
  ellipse(59.57, 200, 52.32, 90);
//belly  
  fill(tanColor);
  ellipse(89.01, 182.84, 35.24, 115.66); 
  fill(orangeColor);
  rect(68.25, 151.25, 5.86, 23.5);
  rect(103.35, 151.25, 5.86, 23.5);
//feets
  fill(blackColor);
  triangle(74.14, 149.25, 73.9, 173.09, 82.96, 173.09);
  triangle(103.56, 149.25, 94.74, 173.09, 103.56, 173.09);
  rect(73.9, 173.09, 9, 9);
  rect(94.74, 173.09, 9, 9);
  ellipse(71.4, 181.43, 23.12, 13.35);
  ellipse(106.3, 181.43, 23.12, 13.35);
//nose 
  fill(blackColor);
  triangle(85.49, 92.41, 89.06, 98.51, 92.56, 92.38); 
//ground  
  fill(greenColor);
  rect(0, 182.84, 200, 100); 
//eyes  
  if (Day == true){ // for the day time
    fill(blackColor);
    ellipse(66.25, 55.23, 11.25, 11.25);
    ellipse(109.48, 55.23, 11.25, 11.25);
    fill(whiteColor);
    ellipse(64.88, 52.48, 4.5, 3.75);
    ellipse(69.38, 57.89, 2.73, 2.28);
    ellipse(108.11, 52.48, 4.5, 3.75);
    ellipse(112.61, 57.89, 2.73, 2.28);
  } 
  if (Day == false){ // for the night time
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(64.84, 51.14, 10.54, 18.1);
  ellipse(113.38, 51.14, 10.54, 18.1);
  noStroke();
  fill(orangeColor);
  rect(53.23, 40.95, 71.55, 8.06);
  }
}

void ears() { // eye folded over
  noStroke();
  fill(blueColor);
  triangle(108.06, 3.77, 100.48, 16.21, 116.24, 16.21);
  fill(darkorangeColor);
  triangle(103.09, 15.95, 108.43, 26.48, 113.38, 15.95);
}

void whiskers() {
  strokeWeight(1);
  stroke(0);
  line(64.84, ((mouseY-150)/30)+92.38, 82.5, 82.77);
  line(71.39, ((mouseY-150)/30)+95.44, 82.5, 85);
  line(95.72, 82.77, 113.38, ((mouseY-150)/30)+92.38);
  line(95.72, 85, 106.83, ((mouseY-150)/30)+95.44);
}

void time() { // time of day

/* my lines for the sun are so complicated because I had them set up to run in a loop; however, I don't know
how to maintain them while the background is being re-drawn*/

   line(8*cos(1)+168, 8*sin(1)+12, 168, 12);
   line(8*cos(2)+168, 8*sin(2)+12, 168, 12);
   line(8*cos(3)+168, 8*sin(3)+12, 168, 12);
   line(8*cos(4)+168, 8*sin(4)+12, 168, 12);
   line(8*cos(5)+168, 8*sin(5)+12, 168, 12);
   line(8*cos(6)+168, 8*sin(6)+12, 168, 12);
   
   stroke(blueColor);
   fill(blackColor);
   ellipse(168, 12,8, 8);
   noStroke();
   ellipse(187, 12, 8, 8);
   fill(blueColor);
   ellipse(191, 12, 8, 8);
   
   if (mouseX > 160 && mouseX < 175 && mouseY > 6 && mouseY < 19 && counter < 20) {
     br = br+10;
     bg = bg+10;
     bb = bb+10;
     or++;
     og++;
     ob++;
     tr++;
     tg++;
     tb++;
     gr++;
     gg++;
     gb++;
     blueColor= color(br,bg,bb);
     orangeColor= color(or,og,ob);
     tanColor = color(tr,tg,tb);
     greenColor = color(gr,gg,gb);
     counter++;
     if (counter == 20 ){
       Day = true;
       println("Morning already?");
       }
     }
     if (mouseX > 180 && mouseX < 190 && mouseY > 6 && mouseY < 19 && counter > 1) {
       br = br-10;
       bg = bg-10;
       bb = bb-10;
       or--;
       og--;
       ob--;
       tr--;
       tg--;
       tb--;
       gr--;
       gg--;
       gb--;
       blueColor= color(br,bg,bb);
       orangeColor= color(or, og, ob);
       tanColor = color(tr,tg,tb);
       greenColor = color(gr,gg,gb);
       counter--;
       if (counter == 1) {
         Day = false;
         println("Good Night!");
       }
     }
   }
    
void draw() {
  frameRate(60);
  background(blueColor);
  fox();
  whiskers();
  time(); 
  }
  
void mousePressed() {
  if (mouseY < 50 && mouseX > 100 && mouseX < 130) {
    frameRate(3);
    if(Day==true){
      ears();
    }
    if(Day==false){
      stroke(0);
      line(59.33, 37.33, 75.33, 47);
      line(119.35, 37.33, 103.35, 47);
      reaction++;
      if (reaction >=3) {
        println("Seriously. You can stop doing that now.");
      }

    }
  }
}

