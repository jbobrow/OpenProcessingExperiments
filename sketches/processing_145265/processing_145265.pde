
// Visualizing instances of numbers in Pi by Ken Kapptie

// Keeps count of each digit
int[] rNums = new int[10];
// Keeps count of digit with lead
int[] lNums = new int[10];
// Keeps count of digits
int total = 0;
float xoff = 0.0;

void setup() {
  size(600, 600);
  background(255); 
  frameRate(500);
  line(50, 500, 550, 500);
  fill(0);
  text("1000", 20, 503);
}

void draw() {
  noStroke();

  // Default Random
  float rnum = random(11);
  
  // Gaussian Random
  //float rnum = randomGaussian() * -17.99;
  
  // Perlin Noise Random
  //xoff = xoff + .01;
  //float rnum = noise(xoff)*13.99;

  total = rNums[0]+rNums[1]+rNums[2]+rNums[3]+rNums[4]+rNums[5]+rNums[6]+rNums[7]+rNums[8]+rNums[9];
  fill(255);
  rect(370,525,200,40);
  fill(0);
  text("Number of digits:" + total,380,540);
  if (rnum > 0) {
    fill(255);
    rect(100,522,250,50);
    fill(0);
    textSize(60);
    text(rnum,100,570);
    textSize(9);
    int i = int(rnum);
    switch(i) {
    case 1:
      rNums[0]++;
      if (rNums[0]>rNums[1] && 
          rNums[0]>rNums[2] && 
          rNums[0]>rNums[3] && 
          rNums[0]>rNums[4] && 
          rNums[0]>rNums[5] && 
          rNums[0]>rNums[6] && 
          rNums[0]>rNums[7] && 
          rNums[0]>rNums[8] && 
          rNums[0]>rNums[9]) {
        fill(250, 50, 50);
        rect(50, 0, 50, rNums[0]/2,0,0,10,10);
        if(lNums[0]>=lNums[1] && 
            lNums[0]>=lNums[2] && 
            lNums[0]>=lNums[3] && 
            lNums[0]>=lNums[4] && 
            lNums[0]>=lNums[5] && 
            lNums[0]>=lNums[6] && 
            lNums[0]>=lNums[7] && 
            lNums[0]>=lNums[8] && 
            lNums[0]>=lNums[9]) {
          lNums[0]++;
        }
      } 
      else {
        fill(100, 100, 100);
        rect(50, 0, 50, rNums[0]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #1\n" + lNums[0] + "/" + rNums[0], 55, rNums[0]/2-20);
      if (rNums[0] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #1 after " + total + " digits, by " + numSort(rNums[0]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 2:
      rNums[1]++;
      if (rNums[1]>rNums[0] && 
          rNums[1]>rNums[2] && 
          rNums[1]>rNums[3] && 
          rNums[1]>rNums[4] && 
          rNums[1]>rNums[5] && 
          rNums[1]>rNums[6] && 
          rNums[1]>rNums[7] && 
          rNums[1]>rNums[8] && 
          rNums[1]>rNums[9]) {
        fill(250, 50, 50);
        rect(100, 0, 50, rNums[1]/2,0,0,10,10);
        if(lNums[1]>=lNums[0] && 
            lNums[1]>=lNums[2] && 
            lNums[1]>=lNums[3] && 
            lNums[1]>=lNums[4] && 
            lNums[1]>=lNums[5] && 
            lNums[1]>=lNums[6] && 
            lNums[1]>=lNums[7] && 
            lNums[1]>=lNums[8] && 
            lNums[1]>=lNums[9]) {
          //lNums[1]++;
        }
      } 
      else {
        fill(150, 150, 150);
        rect(100, 0, 50, rNums[1]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #2\n" + lNums[1] + "/" + rNums[1], 105, rNums[1]/2-20);
      if (rNums[1] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #2 after " + total + " digits, by " + numSort(rNums[1]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 3:
      rNums[2]++;
      if (rNums[2]>rNums[0] && 
          rNums[2]>rNums[1] && 
          rNums[2]>rNums[3] && 
          rNums[2]>rNums[4] && 
          rNums[2]>rNums[5] && 
          rNums[2]>rNums[6] && 
          rNums[2]>rNums[7] && 
          rNums[2]>rNums[8] && 
          rNums[2]>rNums[9]) {
        fill(250, 50, 50);
        rect(150, 0, 50, rNums[2]/2,0,0,10,10);
        if(lNums[2]>=lNums[0] && 
            lNums[2]>=lNums[1] && 
            lNums[2]>=lNums[3] && 
            lNums[2]>=lNums[4] && 
            lNums[2]>=lNums[5] && 
            lNums[2]>=lNums[6] && 
            lNums[2]>=lNums[7] && 
            lNums[2]>=lNums[8] && 
            lNums[2]>=lNums[9]) {
          //lNums[2]++;
        }
      } 
      else {
        fill(100, 100, 100);
        rect(150, 0, 50, rNums[2]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #3\n" + lNums[2] + "/" + rNums[2], 155, rNums[2]/2-20);
      if (rNums[2] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #3 after " + total + " digits, by " + numSort(rNums[2]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 4: 
      rNums[3]++;
      if (rNums[3]>rNums[0] && 
          rNums[3]>rNums[1] && 
          rNums[3]>rNums[2] && 
          rNums[3]>rNums[4] && 
          rNums[3]>rNums[5] && 
          rNums[3]>rNums[6] && 
          rNums[3]>rNums[7] && 
          rNums[3]>rNums[8] && 
          rNums[3]>rNums[9]) {
        fill(250, 50, 50);
        rect(200, 0, 50, rNums[3]/2,0,0,10,10);
        if(lNums[3]>=lNums[0] && 
            lNums[3]>=lNums[1] && 
            lNums[3]>=lNums[2] && 
            lNums[3]>=lNums[4] && 
            lNums[3]>=lNums[5] && 
            lNums[3]>=lNums[6] && 
            lNums[3]>=lNums[7] && 
            lNums[3]>=lNums[8] && 
            lNums[3]>=lNums[9]) {
          //lNums[3]++;
        } 
      }
      else {
        fill(150, 150, 150);
        rect(200, 0, 50, rNums[3]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #4\n" + lNums[3] + "/" + rNums[3], 205, rNums[3]/2-20);
      if (rNums[3] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #4 after " + total + " digits, by " + numSort(rNums[3]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 5: 
      rNums[4]++;
      if (rNums[4]>rNums[0] && 
          rNums[4]>rNums[1] && 
          rNums[4]>rNums[2] && 
          rNums[4]>rNums[3] && 
          rNums[4]>rNums[5] && 
          rNums[4]>rNums[6] && 
          rNums[4]>rNums[7] && 
          rNums[4]>rNums[8] && 
          rNums[4]>rNums[9]) {
        fill(250, 50, 50);
        rect(250, 0, 50, rNums[4]/2,0,0,10,10);
        if(lNums[4]>=lNums[0] && 
            lNums[4]>=lNums[1] && 
            lNums[4]>=lNums[2] && 
            lNums[4]>=lNums[3] && 
            lNums[4]>=lNums[5] && 
            lNums[4]>=lNums[6] && 
            lNums[4]>=lNums[7] && 
            lNums[4]>=lNums[8] && 
            lNums[4]>=lNums[9]) {
          //lNums[4]++;
        }
      } 
      else {
        fill(100, 100, 100);
        rect(250, 0, 50, rNums[4]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #5\n" + lNums[4] + "/" + rNums[4], 255, rNums[4]/2-20);
      if (rNums[4] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #5 after " + total + " digits, by " + numSort(rNums[4]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 6: 
      rNums[5]++;
      if (rNums[5]>rNums[0] && 
          rNums[5]>rNums[1] && 
          rNums[5]>rNums[2] && 
          rNums[5]>rNums[3] && 
          rNums[5]>rNums[4] && 
          rNums[5]>rNums[6] && 
          rNums[5]>rNums[7] && 
          rNums[5]>rNums[8] && 
          rNums[5]>rNums[9]) {
        fill(250, 50, 50);
        rect(300, 0, 50, rNums[5]/2,0,0,10,10);
        if(lNums[5]>=lNums[0] && 
            lNums[5]>=lNums[1] && 
            lNums[5]>=lNums[2] && 
            lNums[5]>=lNums[3] && 
            lNums[5]>=lNums[4] && 
            lNums[5]>=lNums[6] && 
            lNums[5]>=lNums[7] && 
            lNums[5]>=lNums[8] && 
            lNums[5]>=lNums[9]) {
          //lNums[5]++;
        }
      } 
      else {
        fill(150, 150, 150);
        rect(300, 0, 50, rNums[5]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #6\n" + lNums[5] + "/" + rNums[5], 305, rNums[5]/2-20);
      if (rNums[5] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #6 after " + total + " digits, by " + numSort(rNums[5]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 7: 
      rNums[6]++;
      if (rNums[6]>rNums[0] && 
          rNums[6]>rNums[1] && 
          rNums[6]>rNums[2] && 
          rNums[6]>rNums[3] && 
          rNums[6]>rNums[4] && 
          rNums[6]>rNums[5] && 
          rNums[6]>rNums[7] && 
          rNums[6]>rNums[8] && 
          rNums[6]>rNums[9]) {
        fill(250, 50, 50);
        rect(350, 0, 50, rNums[6]/2,0,0,10,10);
        if(lNums[6]>=lNums[0] && 
            lNums[6]>=lNums[1] && 
            lNums[6]>=lNums[2] && 
            lNums[6]>=lNums[3] && 
            lNums[6]>=lNums[4] && 
            lNums[6]>=lNums[5] && 
            lNums[6]>=lNums[7] && 
            lNums[6]>=lNums[8] && 
            lNums[6]>=lNums[9]) {
          //lNums[6]++;
        }
      } 
      else {
        fill(100, 100, 100);
        rect(350, 0, 50, rNums[6]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #7\n" + lNums[6] + "/" + rNums[6], 355, rNums[6]/2-20);
      if (rNums[6] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #7 after " + total + " digits, by " + numSort(rNums[6]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 8: 
      rNums[7]++;
      if (rNums[7]>rNums[0] && 
          rNums[7]>rNums[1] && 
          rNums[7]>rNums[2] && 
          rNums[7]>rNums[3] && 
          rNums[7]>rNums[4] && 
          rNums[7]>rNums[5] && 
          rNums[7]>rNums[6] && 
          rNums[7]>rNums[8] && 
          rNums[7]>rNums[9]) {
        fill(250, 50, 50);
        rect(400, 0, 50, rNums[7]/2,0,0,10,10);
        if(lNums[7]>=lNums[0] && 
            lNums[7]>=lNums[1] && 
            lNums[7]>=lNums[2] && 
            lNums[7]>=lNums[3] && 
            lNums[7]>=lNums[4] && 
            lNums[7]>=lNums[5] && 
            lNums[7]>=lNums[6] && 
            lNums[7]>=lNums[8] && 
            lNums[7]>=lNums[9]) {
          //lNums[7]++;
        }
      } 
      else {
        fill(150, 150, 150);
        rect(400, 0, 50, rNums[7]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #8\n" + lNums[7] + "/" + rNums[7], 405, rNums[7]/2-20);
      if (rNums[7] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #8 after " + total + " digits, by " + numSort(rNums[7]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 9: 
      rNums[8]++;
      if (rNums[8]>rNums[0] && 
          rNums[8]>rNums[1] && 
          rNums[8]>rNums[2] && 
          rNums[8]>rNums[3] && 
          rNums[8]>rNums[4] && 
          rNums[8]>rNums[5] && 
          rNums[8]>rNums[6] && 
          rNums[8]>rNums[7] && 
          rNums[8]>rNums[9]) {
        fill(250, 50, 50);
        rect(450, 0, 50, rNums[8]/2,0,0,10,10);
        if(lNums[8]>=lNums[0] && 
            lNums[8]>=lNums[1] && 
            lNums[8]>=lNums[2] && 
            lNums[8]>=lNums[3] && 
            lNums[8]>=lNums[4] && 
            lNums[8]>=lNums[5] && 
            lNums[8]>=lNums[6] && 
            lNums[8]>=lNums[7] && 
            lNums[8]>=lNums[9]) {
          //lNums[8]++;
        }
        
      } 
      else {
        fill(100, 100, 100);
        rect(450, 0, 50, rNums[8]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #9\n" + lNums[8] + "/" + rNums[8], 455, rNums[8]/2-20);
      if (rNums[8] == 1000) {
        fill(0);
        textSize(20);
        text("And the winner is #9 after " + total + " digits, by " + numSort(rNums[8]) + " points!", 50, 520);
        noLoop();
      }
      break;
    case 10: 
      rNums[9] = rNums[9] + 1;
      if (rNums[9]>rNums[0] && 
          rNums[9]>rNums[1] && 
          rNums[9]>rNums[2] && 
          rNums[9]>rNums[3] && 
          rNums[9]>rNums[4] && 
          rNums[9]>rNums[5] && 
          rNums[9]>rNums[6] && 
          rNums[9]>rNums[7] && 
          rNums[9]>rNums[8]) {
        fill(250, 50, 50);
        rect(500, 0, 50, rNums[9]/2,0,0,10,10);
        if(lNums[9]>=lNums[0] && 
            lNums[9]>=lNums[1] && 
            lNums[9]>=lNums[2] && 
            lNums[9]>=lNums[3] && 
            lNums[9]>=lNums[4] && 
            lNums[9]>=lNums[5] && 
            lNums[9]>=lNums[6] && 
            lNums[9]>=lNums[7] && 
            lNums[9]>=lNums[8]) {
          //lNums[9]++;
        }
      } 
      else {
        fill(150, 150, 150);
        rect(500, 0, 50, rNums[9]/2,0,0,10,10);
      }
      fill(255, 255, 255);
      text("   #10\n" + lNums[9] + "/" + rNums[9], 504, rNums[9]/2-20);
      if (rNums[9] == 1000) {
        fill(0);
        textSize(20);
        text("The first number to appear 1000 times in pi is 0 by " + numSort(rNums[9]), 50, 520);
        noLoop();
      }
      break;
    }
  }
}

int numSort(int leadBy) {
  rNums = sort(rNums);
  leadBy = leadBy - rNums[8];
  return leadBy;
}


