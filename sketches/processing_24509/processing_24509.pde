
void setup() {
  size(500,1000);
}

void draw () {
  stroke(255);
  background(51);
  int x = 0;

  while(x < 200)
  {
    
    line (5*x,0,5*x,height);
    x = x + 1;
    
  }
  //noStroke();
  ellipse(10,10,10,10);
  ellipse(25,20,10,10);
  ellipse(40,30,15,15);
  ellipse(50,50,10,10);
  ellipse(65,40,15,15);
  ellipse(80,70,20,20);
  ellipse(75,100,25,25);
  ellipse(100,90,10,10);
  ellipse(100,140,30,30);
  ellipse(135,130,25,25);
  ellipse(125,155,15,15);
  ellipse(160,170,30,30);
  ellipse(200,200,35,35);
  ellipse(180,225,20,20);
  ellipse(250,225,35,35);
  ellipse(245,280,40,40);
  ellipse(215,300,15,15);
  ellipse(280,300,25,25);
  ellipse(260,340,45,45);
  ellipse(280,400,50,50);
  ellipse(310,340,20,20);
  ellipse(340,400,10,10);
  ellipse(335,440,50,50);
  ellipse(290,460,30,30);
  ellipse(370,500,70,70);
  ellipse(500,500,100,100);
  ellipse(425,470,40,40);
}


