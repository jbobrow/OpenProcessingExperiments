
/* @pjs preload="foggy_cavern640.JPG,Canopy_h.jpg,train.JPG"; crisp="true"; */

PImage cavern;
PImage train;
int y=1;
int x=1;
int timer=0;
int lineInterval;
byte trigger = 1;
void setup() {
  size(640, 480);
  int y = 1;
  int x = 1;
  lineInterval = 32;
  background(0);
  cavern = loadImage("foggy_cavern640.JPG");
  train = loadImage("train.JPG");
}
void mouseClicked() {
  //  if (trigger==-1) {
  println("ellipse("+mouseX+","+mouseY+","+48+","+48+");");
  println("You pooped a magical cloud fairy!");
  image(cavern, 0, 0);
  //  }
}
void draw() {
  int i = 0;
  if (trigger==1) {
    if(timer>=1){
      timer++;
    }
    if(timer=1){
    image(train,0,0,x,y);
    }
    if (timer==60) {
    image(train, width-x, height-y, x, y, 0, 0, width, height);
    }
    if (timer==120) {
    imag(train, width-x, height-y, x, y, 0, 0, width, height);
    }
    if(timer==300){
    image(train, width-x, height-y, x, y, 0, 0, width, height);
    }
    if (x<width) { 
      x=x+2;
    }
    if (y<height) {
      y=y+2;
    }
    if (y>=height&&x>=width) {
      filter(BLUR, 10);
      timer=1;
      trigger=2;
    }
  }
  if (trigger==2) {    
    //print("trigger1Done");
    for (i=0;i<height;i+=lineInterval) {

      stroke(255);
      line(0, i, width, i);
      fill(0, 15);
      rect(0, 0, width, height);
    }
    for (i=0;i<width;i+=lineInterval) {
      stroke(255);
      line(i, 0, i, height);
    }
    trigger=byte(random(3, 4));
  }
  if (trigger==3) {
    println("trigger3");

    if (timer>=120) {
      timer=0;
      trigger=4;
    }
    if (timer<120) {
      timer++;
    }
    if (timer>60 && timer < 120) {
      noStroke();
      image(train, 0, 0);
      fill(0, 255-(timer*2));
      rect(0, 0, width, height);
    }
  }
  if (trigger==4) {
    if (timer>=100) {
      timer=1;
      trigger=2;
    }
    if (timer<100) {
      timer++;
    }
    if (timer==25) {
      image(train, 0, 0);
      fill(0, 100);
      rect(0, 0, width, height);
      filter(THRESHOLD);
    }
    if (timer==40) {
      background(0);
      stroke(255);
      point(22, 338);
      point(32, 249);
      point(20, 218);
      point(8, 214);
      point(1, 193);
      point(12, 168);
      point(20, 165);
      point(29, 172);
      point(41, 137);
      point(49, 102);
      point(59, 89);
      point(100, 60);
      point(127, 52);
      point(149, 56);
      point(187, 79);
      point(202, 107);
      point(212, 138);
      point(212, 181);
      point(212, 204);
      point(204, 216);
      point(194, 238);
      point(182, 266);
      point(176, 276);
      point(171, 298);
      point(170, 312);
      point(170, 320);
      point(182, 317);
      point(198, 312);
      point(210, 312);
      point(245, 332);
      point(257, 326);
      point(274, 323);
      point(293, 325);
      point(308, 324);
      point(329, 319);
      point(347, 328);
      point(361, 340);
      point(447, 465);
      point(434, 475);
      point(479, 440);
      point(481, 429);
      point(474, 337);
      point(479, 167);
      point(497, 67);
      point(507, 30);
      point(513, 10);
      point(182, 99);
      point(143, 96);
      point(125, 100);
      point(87, 102);
      point(71, 109);
      point(104, 141);
      point(134, 105);
      point(127, 190);
      point(89, 220);
      point(65, 249);
      point(56, 115);
    }
    if (timer==60) {
      ellipseMode(CENTER);
      noStroke();
      fill(255, 180);
      ellipse(3, 418, 24, 24);
      ellipse(22, 385, 24, 24);
      ellipse(53, 358, 24, 24);
      ellipse(59, 338, 24, 24);
      ellipse(59, 326, 24, 24);
      ellipse(86, 361, 24, 24);
      ellipse(113, 367, 24, 24);
      ellipse(155, 365, 24, 24);
      ellipse(144, 388, 24, 24);
      ellipse(86, 453, 24, 24);
      ellipse(71, 478, 24, 24);
      ellipse(89, 411, 24, 24);
      ellipse(48, 397, 24, 24);
      ellipse(67, 378, 24, 24);
      ellipse(34, 428, 24, 24);
      ellipse(304, 331, 24, 24);
      ellipse(304, 356, 24, 24);
      ellipse(305, 391, 24, 24);
      ellipse(293, 466, 24, 24);
      ellipse(293, 466, 24, 24);
      ellipse(239, 427, 24, 24);
      ellipse(270, 390, 24, 24);
      ellipse(265, 323, 24, 24);
      ellipse(332, 340, 24, 24);
      ellipse(360, 367, 24, 24);
      ellipse(385, 399, 24, 24);
      ellipse(437, 469, 24, 24);
      ellipse(420, 473, 24, 24);
      ellipse(392, 479, 24, 24);
      ellipse(380, 478, 24, 24);
      ellipse(400, 458, 24, 24);
      ellipse(354, 436, 24, 24);
      ellipse(82, 170, 24, 24);
      ellipse(89, 77, 24, 24);
      ellipse(123, 137, 24, 24);
      ellipse(57, 322, 24, 24);
      ellipse(101, 408, 24, 24);
      ellipse(76, 427, 24, 24);
      ellipse(42, 412, 24, 24);
      ellipse(54, 379, 24, 24);
      ellipse(95, 407, 24, 24);
      ellipse(125, 379, 24, 24);
      ellipse(389, 429, 24, 24);
      ellipse(356, 464, 24, 24);
      ellipse(388, 474, 24, 24);
      ellipse(364, 436, 24, 24);
      ellipse(317, 349, 24, 24);
      ellipse(297, 467, 24, 24);
      ellipse(229, 430, 24, 24);
      ellipse(257, 384, 24, 24);
    }
    if (timer==70) {
      noStroke();
      fill(255, 180);
      rect(109, 88, 16, 16);
      rect(133, 76, 16, 16);
      rect(157, 79, 16, 16);
      rect(124, 67, 16, 16);
      rect(87, 75, 16, 16);
      rect(106, 67, 16, 16);
      rect(132, 62, 16, 16);
      rect(155, 73, 16, 16);
      rect(158, 90, 16, 16);
      rect(117, 89, 16, 16);
      rect(97, 89, 16, 16);
      rect(83, 95, 16, 16);
      rect(68, 98, 16, 16);
      rect(67, 92, 16, 16);
      rect(55, 117, 16, 16);
      rect(48, 140, 16, 16);
      rect(40, 156, 16, 16);
      rect(53, 115, 16, 16);
      rect(61, 102, 16, 16);
      rect(59, 149, 16, 16);
      rect(73, 148, 16, 16);
      rect(97, 148, 16, 16);
      rect(108, 145, 16, 16);
      rect(131, 133, 16, 16);
      rect(137, 109, 16, 16);
      rect(95, 148, 16, 16);
      rect(94, 169, 16, 16);
      rect(75, 192, 16, 16);
      rect(124, 180, 16, 16);
      rect(109, 175, 16, 16);
      rect(107, 239, 16, 16);
      rect(94, 206, 16, 16);
      rect(36, 203, 16, 16);
      rect(37, 169, 16, 16);
      rect(36, 194, 16, 16);
      rect(32, 187, 16, 16);
      rect(94, 170, 16, 16);
      rect(36, 166, 16, 16);
      rect(43, 181, 16, 16);
      rect(49, 294, 16, 16);
      rect(1, 399, 16, 16);
      rect(1, 399, 16, 16);
      rect(3, 401, 16, 16);
      rect(98, 389, 16, 16);
      rect(115, 378, 16, 16);
      rect(132, 375, 16, 16);
      rect(24, 385, 16, 16);
      rect(70, 346, 16, 16);
      rect(104, 368, 16, 16);
      rect(140, 395, 16, 16);
      rect(105, 390, 16, 16);
      rect(287, 337, 16, 16);
      rect(238, 435, 16, 16);
      rect(249, 328, 16, 16);
      rect(238, 331, 16, 16);
      rect(407, 455, 16, 16);
      rect(390, 448, 16, 16);
      rect(313, 408, 16, 16);
      rect(282, 451, 16, 16);
      rect(252, 420, 16, 16);
      rect(282, 337, 16, 16);
      rect(266, 323, 16, 16);
      rect(129, 375, 16, 16);
      rect(130, 131, 16, 16);
      rect(111, 149, 16, 16);
      rect(44, 158, 16, 16);
      rect(40, 195, 16, 16);
      rect(122, 235, 16, 16);
    }
    if (timer>80) {
      noStroke();
      fill(255, 100);
      ellipse(168, 121, 32, 32);
      ellipse(163, 82, 32, 32);
      ellipse(137, 72, 32, 32);
      ellipse(111, 76, 32, 32);
      ellipse(89, 87, 32, 32);
      ellipse(99, 75, 32, 32);
      ellipse(85, 82, 32, 32);
      ellipse(65, 99, 32, 32);
      ellipse(97, 153, 32, 32);
      ellipse(83, 145, 32, 32);
      ellipse(53, 150, 32, 32);
      ellipse(51, 182, 32, 32);
      ellipse(35, 190, 32, 32);
      ellipse(32, 224, 32, 32);
      ellipse(50, 227, 32, 32);
      ellipse(61, 238, 32, 32);
      ellipse(44, 241, 32, 32);
      ellipse(73, 239, 32, 32);
      ellipse(77, 223, 32, 32);
      ellipse(68, 190, 32, 32);
      ellipse(76, 180, 32, 32);
      ellipse(92, 164, 32, 32);
      ellipse(112, 388, 32, 32);
      ellipse(1, 474, 32, 32);
      ellipse(50, 437, 32, 32);
      ellipse(76, 414, 32, 32);
      ellipse(86, 408, 32, 32);
      ellipse(103, 386, 32, 32);
      ellipse(131, 378, 32, 32);
      ellipse(413, 477, 32, 32);
      ellipse(406, 463, 32, 32);
      ellipse(396, 450, 32, 32);
      ellipse(382, 431, 32, 32);
      ellipse(372, 417, 32, 32);
      ellipse(363, 401, 32, 32);
      ellipse(350, 370, 32, 32);
      ellipse(376, 469, 32, 32);
      ellipse(362, 440, 32, 32);
      ellipse(359, 409, 32, 32);
      ellipse(287, 461, 32, 32);
      ellipse(305, 442, 32, 32);
      ellipse(313, 415, 32, 32);
      ellipse(311, 389, 32, 32);
      ellipse(323, 347, 32, 32);
      ellipse(335, 340, 32, 32);
      ellipse(317, 332, 32, 32);
      ellipse(232, 346, 32, 32);
      ellipse(90, 366, 32, 32);
      ellipse(104, 373, 32, 32);
      ellipse(68, 349, 32, 32);
      ellipse(65, 329, 32, 32);
      ellipse(8, 373, 32, 32);
      ellipse(35, 352, 32, 32);
      ellipse(42, 307, 32, 32);
      ellipse(41, 292, 32, 32);
      ellipse(42, 279, 32, 32);
      ellipse(38, 229, 32, 32);
      ellipse(308, 442, 32, 32);
      ellipse(107, 463, 32, 32);
    }
  }
}



