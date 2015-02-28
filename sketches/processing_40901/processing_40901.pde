
Captain [] Captain = new Captain [20];//declaring arrays- sets numbers

void setup() {//drawings setup variables
  size (300, 300);

  
  for (int i=0; i<Captain.length; i++){
    Captain[i] = new Captain();
  }
}


void draw() {
  background (167,199,227,80);
  frameRate (3);
  
  for (int i=0; i<Captain.length; i++){
  
  Captain[i].update();//arrays established...definition for each to be set below
  Captain[i].display();
  }
}

class Captain {//entering float variables

  float x1 = random(0,300);//establishes ranges of application
  float y1 = random(-150, 150);
  float x2 = random(50, 150);
  float y2 = random(50, 150);
  float x3 = random(150,300);
  float y3 = random(150,300);
  float x4 = random(250,300);
  float y4 = random(0,100);
  float x5 = random(300,300);
  float y5 = random(300,300);
  color c1 = color(255,80);
  color c2 = color(47,222,106,60);
  color c3= color(126,217,232,80);
  color c4= color(110,101,216,80);
  color c5= color(123,124,15);
  
  int x= int(random(width));
  int y= int(random(height));


  Captain() {
  }

  void update() {//create the sub-command variables for above
    x1 = x1+10; 
    y1 = y1+20;
    x2 = x2+10;
    y2 = y2+12;
    x3 = x3+10;
    y3 = y3+10;
    x4 = random(x-30, width/4);
    y4 = random(y-30/4, height/6);//half moving half static

  }

  void display() {//creates objects for above
    fill (c1);
    rect (x1, y1,-10,50);//descending white-and size
    fill (c2);
    rect (x2, y2,-10,20);//small descending line-gray
    fill (c3);
    rect (x3, y3,20,2);//smaller horiz. lines
    fill (c4);
    rect (x4, y4,40,40);//largest sq.
  
  
  }
}


