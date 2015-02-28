
Worker workers[] = new Worker[6];
int timer;

void setup() {
size(800,800);
smooth();
workers[0] = new Worker(250, height/2, 0.1, 0.5, 0.7, 1.0, 1.4);
workers[1] = new Worker(290, height/2, 0.2, 0.6, 0.8, 1.2, 1.6);
workers[2] = new Worker(330, height/2, 0.3, 0.7, 0.9, 1.4, 1.8);
workers[3] = new Worker(370, height/2, 0.4, 0.8, 1.0, 1.8, 2.0);
workers[4] = new Worker(410, height/2, 0.5, 0.9, 1.6, 2.4, 3.0);
workers[5] = new Worker(450, height/2, 0.6, 1.0, 2.2, 2.8, 3.4);
timer = 0; 

}

void draw() {
  
  line(230,height/2,570,height/2);
  timer++;
  if (timer % 100 == 0) {
    for (int i=0;i<workers.length;i++) {
      workers[i].changeAmount();
    }
  }
  for (int j=0;j<workers.length;j++) {
    workers[j].display();
  
  fill(0,102,153,51);
  rect(380,20,20,100); // Number 1
  rect(350,20,30,20);
  rect(340,120,90,20);
  
  rect(440,120,20,20); // Point
  
  rect(470,20,60,20); // Number 2
  rect(520,20,20,60);
  rect(470,60,70,20);
  rect(470,60,20,80);
  rect(470,120,70,20);
  
  rect(570,20,20,120); // Second number 1
  
  textSize(70);
  fill(0,102,153,51);
  text("Giga",140,60);
  text("Watts",140,130);
  textSize(15);
  fill(0);
  text("1.21",510,270);
  
  noFill();
  rect(230,180,340,290); // Time Frame
  
  line(470,265,500,265); // Counter
  
  line(600,330,700,330); // Antenna
  line(700,330,700,100);
  line(700,100,650,50);
  line(700,100,750,50);
  line(700,100,725,60);
  line(700,100,675,70);
  line(700,100,690,60);
  
  line(200,200,200,450); // Watch frame
  line(600,200,600,450);
  line(200,200,250,150);
  line(600,200,550,150);
  line(250,150,550,150);
  line(200,450,250,500);
  line(600,450,550,500);
  line(250,500,550,500);
  line(210,200,210,450); //Inside frame
  line(210,200,250,160);
  line(210,450,250,490);
  line(250,160,550,160);
  line(250,490,550,490);
  line(550,490,590,450);
  line(550,160,590,200);
  line(590,200,590,450);
  line(210,190,210,160); //Doodads on ends
  line(240,160,210,160);
  line(210,460,210,490);
  line(240,490,210,490);
  line(560,160,590,160);
  line(590,190,590,160);
  line(560,490,590,490);
  line(590,460,590,490);
  
  noFill();
  line(100,600,300,550); //Delorean Top
  line(300,550,450,550);
  line(450,550,525,575);
  line(525,575,700,600);
  line(700,600,750,625);
  line(750,625,725,700);
  line(725,700,675,700); // Delorean Bottom
  line(675,700,660,650);
  line(660,650,590,650);
  line(590,650,575,700);
  line(575,700,300,700);
  line(300,700,275,650);
  line(275,650,220,650);
  line(220,650,190,700);
  line(190,700,100,670);
  line(100,670,100,600);
  line(340,560,450,560); // Window
  line(340,600,530,600);
  line(530,600,450,560);
  line(340,560,340,600);
  ellipse(625,690,75,75); // Tire 2
  ellipse(625,690,10,10);
  ellipse(245,690,75,75); // Tire 1
  ellipse(245,690,10,10);
  line(140,600,290,560); // Thing in back
  line(140,600,290,600);
  line(290,600,290,560);
  line(100,650,740,650); // Line across car
  line(100,645,742,645);
  line(100,647,741,647);
  line(120,595,120,530); // Engine to go across time
  line(120,530,200,573);
  line(123,593,123,530);
  line(123,555,170,582);
  line(123,560,165,584);
  line(40,540,80,540); // Fumes
  line(65,560,110,560);
  line(20,580,70,580);
  line(320,550,320,650); // Door left side
  line(320,650,340,700);
  line(540,578,540,650); // Door right side
  line(540,650,520,700);
  line(340,640,370,640); // Door Handle
  line(340,630,370,630);
  line(340,630,340,640);
  line(370,630,370,640);
  line(340,636,370,636);
  line(440,600,430,593); // Doc Brown, Neck
  ellipse(430,584,18,18); // head
  ellipse(427,584,2,2); // left eye
  ellipse(434,584,2,2); // right eye
  line(425,576,400,576); // hair so much hair
  line(424,577,400,580);
  line(423,578,400,584);
  line(422,581,400,590);
  line(426,576,395,570);
  line(426,576,405,568);
  line(426,576,410,565);
  line(426,576,415,563);
  line(427,576,420,564);
  line(428,576,430,562);
  line(428,576,435,563);
  line(432,576,443,564);
  line(438,577,450,566);
  line(438,577,460,570);
  line(438,577,460,575);
  line(438,577,460,575);
  line(438,577,460,580);
  line(440,579,460,585);
  line(440,582,460,590);
  rect(475,590,5,5); // Small monitor
  line(475,592,480,592);
  line(482,593,482,587);
  line(480,593,482,593);
  line(478,595,478,600);
  line(482,587,480,585);
  line(482,587,484,585);
 
  
  }
  
}
class Worker {
  int x;
  int y;
  float amount[] = new float[5];
  int currentIndex = 0;
  Worker(int _x, int _y, float _0, float _1, float _2, float _3, float _4) {
    x = _x;
    y = _y;
    amount[0] = _0;
    amount[1] = _1;
    amount[2] = _2;
    amount[3] = _3;
    amount[4] = _4;

  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { 
      currentIndex = 0;
    }
  }
  void display() {
    float tall = int(amount[currentIndex]* 40); 
    color fillColor = color(255, 300, 30); 
    
    fill(fillColor);
    rect(x-15, y-tall, 30, tall);
  }
}


