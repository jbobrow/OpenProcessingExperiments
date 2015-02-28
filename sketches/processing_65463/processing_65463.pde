
PImage b;
PFont f, mf;
String[] s = new String[12];

void setup() {
  size(800, 800);

  b = loadImage("background.jpeg");
  f = createFont("Didot", 20);
  mf = createFont("Didot", 16);
  rectMode(CENTER);

  stroke(255);
  smooth();

  //seasons
  s[0] = "jan";
  s[1] = "feb";
  s[2] = "mar";
  s[3] = "apr";
  s[4] = "may";
  s[5] = "jun";
  s[6] = "jul";
  s[7] = "aug";
  s[8] = "sep";
  s[9] = "oct";
  s[10] = "nov";
  s[11] = "dec";
}

//spacing
int m = 60;
int n = 55;

void draw() {
  image(b, 0, 0);
  fill(255);
  textFont(f);

  //display months
  for (int i = 0; i < 12; i ++) {
    strokeWeight(1);
    text(s[i], 50, 70+(i*m));
  }

  //display veggie lines
  strokeWeight(30);
  //year round
  stroke(58, 61, 68);
  line(3*n, 0, 3*n, height);
  //artichokes
  stroke(83, 128, 59);
  line(4*n, 110+(3*m), 4*n, 55+(9*m));
  //broccoli, cauliflower, cabbage, and kale
  stroke(52, 91, 44);
  line(4*n, 85+(9*m), 4*n, height);
  line(4*n, 0, 4*n, 80+(3*m));
  //daikon and parsnip
  stroke(216, 214, 157);
  line(5*n, 0, 5*n, 80+(3*m));
  line(5*n, 85+(9*m), 5*n, height);
  //asparagus
  stroke(137, 166, 60);
  line(5*n, 110+(3*m), 5*n, 90+(5*m));
  //corn
  stroke(225, 208, 32);
  line(5*n, 120+(5*m), 5*n, 80+(8*m));
  //carrots and celery root
  stroke(234, 136, 35);
  line(6*n, 0, 6*n, 90+(5*m));
  line(6*n, 110+(8*m), 6*n, height);
  //eggplant
  stroke(57, 17, 70);
  line(6*n, 120+(5*m), 6*n, 80+(8*m));
  //chives and ramps
  stroke(142, 195, 63);
  line(7*n, 110+(2*m), 7*n, 80+(10*m));
  //chicory
  stroke(134, 47, 28);
  line(7*n, 110+(10*m), 7*n, height);
  line(7*n, 0, 7*n, 80+(2*m));
  //squash
  stroke(203, 164, 47);
  line(8*n, 110+(8*m), 8*n, height);
  line(8*n, 0, 8*n, 80+(2*m));
  //cucumber and zucchini
  stroke(20, 109, 55);
  line(8*n, 110+(2*m), 8*n, 80+(8*m));
  //rutabaga and turnip
  stroke(161, 160, 139);
  line(9*n, 0, 9*n, 80+(2*m));
  line(9*n, 80+(10*m), 9*n, height);
  //snap peas
  stroke(102, 167, 65);
  line(9*n, 110+(2*m), 9*n, 90+(5*m));
  //bell peppers
  stroke(205, 53, 40);
  line(9*n, 120+(5*m), 9*n, 50+(10*m));
  //leeks
  stroke(130, 196, 64);
  line(10*n, 80+(10*m), 10*n, height);
  line(10*n, 0, 10*n, 45+(5*m));
  //green beans and peas
  stroke(40, 129, 65);
  line(10*n, 75+(5*m), 10*n, 50+(10*m));
  //mushrooms
  stroke(93, 70, 61);
  line(11*n, 70+(4*m), 11*n, 110+(11*m));
  //new potatoes
  stroke(130, 126, 65);
  line(12*n, 110+(2*m), 12*n, 80+(8*m));
  //pumpkin
  stroke(211, 129, 43);
  line(12*n, 110+(8*m), 12*n, 110+(11*m));
  //okra
  stroke(89, 155, 67);
  line(13*n, 130+(5*m), 13*n, 100+(10*m));
  //sweet potatoes
  stroke(191, 78, 38);
  line(13*n, 130+(10*m), 13*n, height);
  line(13*n, 0, 13*n, 50+(2*m));

  //display mouseover text (veggies)
  //col 1
  if (mouseX >= (3*n)-15 && mouseX <= (3*n)+15) {
    text("beets, \ncelery, \nfennel, \nginger, \nonions, \nspinach, \nbroccolini, \nchard, \ngarlic, \ngreens, \npotatoes, \nsprouts", (3*n)+25, 20+(mouseY/2));
  }
  //col 2
  else if (mouseX >= (4*n)-15 && mouseX <= (4*n)+15) {
    if (mouseY <= 275) {
      text("broccoli, \ncauliflower, \ncabbage, \nkale", (4*n)+25, 20+(mouseY/2));
    }
    else if (mouseY >= 615) {
      text("broccoli, \ncauliflower, \ncabbage, \nkale", (4*n)+25, (mouseY/2)+300);
    }
    else { 
      text("artichokes", (4*n)+25, (mouseY/2)+230);
    }
  }
  //col 3
  else if (mouseX >= (5*n)-15 && mouseX <= (5*n)+15) {
    if (mouseY <= 275) {
      text("daikon, \nparsnip", (5*n)+25, 60+(mouseY/2));
    }
    else if (mouseY >275 && mouseY <= 405) {
      text("asparagus", (5*n)+25, 180+(mouseY/2));
    }
    else if (mouseY > 405 && mouseY <= 575) {
      text("corn", (5*n)+25, 250+(mouseY/2));
    }
    else if (mouseY >= 613) {
      text("daikon, \nparsnips", (5*n)+25, 350+(mouseY/2));
    }
  }
  //col 4
  else if (mouseX >= (6*n)-15 && mouseX <= (6*n)+15) {
    if (mouseY<=405) {
      text("carrots, \ncelery root", (6*n)+25, 100+(mouseY/2));
    }
    else if (mouseY>405 && mouseY<=575) {
      text("eggplant", (6*n)+25, 250+(mouseY/2));
    }
    else {
      text("carrots, \ncelery root", (6*n)+25, 350+(mouseY/2));
    }
  }
  //col 5
  else if (mouseX >= (7*n)-15 && mouseX <= (7*n)+15) {
    if (mouseY >= 218 && mouseY <= 695) {
      text("chives, \nramps", (7*n)+25, 225+(mouseY/2));
    }
    else if (mouseY < 218) { 
      text("chicory", (7*n)+25, 60+(mouseY/2));
    }
    else {
      text("chicory", (7*n)+25, 375+(mouseY/2));
    }
  }
  //col 6
  else if (mouseX >= (8*n)-15 && mouseX <= (8*n)+15) {
    if (mouseY >= 218 && mouseY <= 575) {
      text("cucumber, \nzucchini", (8*n)+25, 190+(mouseY/2));
    }
    else if (mouseY < 218) {
      text("squash", (8*n)+25, 60+(mouseY/2));
    }
    else {
      text("squash", (8*n)+25, 350+(mouseY/2));
    }
  }
  //col 7
  else if (mouseX >= (9*n)-15 && mouseX <= (9*n)+15) {
    if (mouseY<218) {
      text("rutabaga, \nturnip", (9*n)+25, 40+(mouseY/2));
    }
    else if (mouseY >= 218 && mouseY <= 405) {
      text("snap peas", (9*n)+25, 160+(mouseY/2));
    }
    else if (mouseY > 405 && mouseY <= 665) {
      text("bell peppers", (9*n)+25, 270+(mouseY/2));
    }
    else {
      text("rutabaga, \nturnip", (9*n)+25, 360+(mouseY/2));
    }
  }
  //col 8
  else if (mouseX>= (10*n)-15 && mouseX <= (10*n)+15) {
    if (mouseY<=362) {
      text("leeks", (10*n)+25, 90+(mouseY/2));
    }
    else if (mouseY >= 666) {
      text("leeks", (10*n)+25, 370+(mouseY/2));
    }
    else {
      text("green beans, \npeas", (10*n)+25, 250+(mouseY/2));
    }
  }
  //col 9
  else if(mouseX >= (11*n)-15 && mouseX <= (11*n)+15){
    if(mouseY>=298 && mouseY <= 787){
      text("mushrooms", (11*n)+25, 285+(mouseY/2));
    }
  }
  //col 10
  else if(mouseX >= (12*n)-15 && mouseX <= (12*n)+15){
    if(mouseY >= 218 && mouseY <= 575){
      text("new potatoes", (12*n)-145, 200+(mouseY/2));
    }
    if(mouseY >575 && mouseY <= 787){
      text("pumpkin", (12*n)+25, 345+(mouseY/2));
    }
  }
  //col 11
  else if(mouseX >=(13*n)-15 && mouseX <= (13*n)+15){
    if(mouseY >= 418 && mouseY <= 717){
      text("okra", (13*n)+25, 300+(mouseY/2));
    }
    if(mouseY > 717){
      text("sweet potatoes", (13*n)-150, 385+(mouseY/2));
    }
    if(mouseY <= 187){
      text("sweet potatoes", (13*n)-150, 50+(mouseY/2));
    }
  }
  //months
  //jan
  textFont(mf);
  if(dist(mouseX, mouseY, 62, 66) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 66, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 50); 
    text("sprouts, broccoli, cauliflower, cabbage, kale, daikon, parsnip, carrots, celery root, chicory", 115, 70); 
    text("squash, rutabaga, turnip, leeks, sweet potatoes", 115, 90);
}
  //feb
  if(dist(mouseX, mouseY, 62, 126) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 126, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 110); 
    text("sprouts, broccoli, cauliflower, cabbage, kale, daikon, parsnip, carrots, celery root, chicory", 115, 130); 
    text("squash, rutabaga, turnip, leeks, sweet potatoes", 115, 150);
  }
  //mar
  if(dist(mouseX, mouseY, 62, 187) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 187, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 170); 
    text("sprouts, broccoli, cauliflower, cabbage, kale, daikon, parsnip, carrots, celery root, chicory", 115, 190); 
    text("squash, rutabaga, turnip, leeks, sweet potatoes", 115, 210);
  }
  //apr
  if(dist(mouseX, mouseY, 62, 247) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 247, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 230); 
    text("sprouts, broccoli, cauliflower, cabbage, kale, daikon, parsnip, carrots, celery root, chives", 115, 250); 
    text("ramp, cucumber, zucchini, leeks, snap peas, new potatoes", 115, 270);
  }
  //may
  if(dist(mouseX, mouseY, 62, 305) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 305, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 287); 
    text("sprouts, artichokes, asparagus, carrots, celery root, chives, ramp, cucumber, zucchini", 115, 307); 
    text("snap peas, leeks, mushrooms, new potatoes", 115, 327);
  }
  //jun
  if(dist(mouseX, mouseY, 62, 365) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 365, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 347); 
    text("sprouts, artichokes, asparagus, carrots, celery root, chives, ramp, cucumber, zucchini", 115, 367); 
    text("green beans, peas, snap peas, leeks, mushrooms, new potatoes", 115, 387);
  }
  //jul
  if(dist(mouseX, mouseY, 62, 428) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 428, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 413); 
    text("sprouts, artichokes, corn, eggplant, bell peppers, chives, ramp, cucumber, zucchini", 115, 433); 
    text("green beans, peas, okra, mushrooms, new potatoes", 115, 453);
  }
  //aug
  if(dist(mouseX, mouseY, 62, 488) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 488, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 473); 
    text("sprouts, artichokes, corn, eggplant, bell peppers, chives, ramp, cucumber, zucchini", 115, 493); 
    text("green beans, peas, okra, mushrooms, new potatoes", 115, 513);
  }
  //sep
  if(dist(mouseX, mouseY, 62, 547) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 547, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 533); 
    text("sprouts, artichokes, corn, eggplant, bell peppers, chives, ramp, cucumber, zucchini", 115, 553); 
    text("green beans, peas, okra, mushrooms, new potatoes", 115, 573);
  }
  //oct
  if(dist(mouseX, mouseY, 62, 606) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 606, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 591); 
    text("sprouts, artichokes, pumpkin, carrots, bell peppers, chives, ramp, cucumber, zucchini", 115, 611); 
    text("green beans, peas, okra, mushrooms, celery root", 115, 631);
  }
  //nov
  if(dist(mouseX, mouseY, 62, 665) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 665, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 651); 
    text("sprouts, artichokes, pumpkin, daikon, chives, ramp, cucumber, zucchini, carrots, celery root", 115, 671); 
    text("green beans, peas, okra, mushrooms, parsnips, leeks, rutabaga, turnip, sweet potatoes", 115, 691);
  }
  //dec
  if(dist(mouseX, mouseY, 62, 725) <=40){
    fill(0, 150);
    noStroke();
    rect(width/2, 725, width, 60);
    fill(255);
    text("beets, celery, fennel, ginger, onions, spinach, broccolini, chard, garlic, greens, potatoes", 115, 711); 
    text("sprouts, artichokes, pumpkin, daikon, chives, ramp, cucumber, zucchini, carrots, celery root", 115, 731); 
    text("green beans, peas, okra, mushrooms, parsnips, leeks, rutabaga, turnip, sweet potatoes, chicory", 115, 751);
  }
}


