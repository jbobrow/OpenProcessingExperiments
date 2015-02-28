
int shapeWidth = 60;
int shapeHeight = 60;
int mBoxWidth = 100;
int mBoxHeight = 100;

void setup() {
  size(700, 700); 
  background(150);
}

void draw() {
  //where 250,250 is cup start. Magic numbers ahoy!
  //major update call
  //Cup Handle
  
  ellipse(350, 300, 50, 50);//negative handle space
  fill(150);
  ellipse(340, 300, 50, 30);
  fill(255);
  //Cup body
  rect(250, 250, mBoxWidth, mBoxHeight);
  //plunger
  rect(275,25,50,125);//plunger body
  quad(275,150,325,150,350,200,250,200);//plunger bottom
  ellipse(300, 20, mBoxWidth + 10, 10);//plungerTop
  //Aeropress Cylinder
  noFill();
  line(250,50,250,250);
  line(350,50,350,250);
  ellipse(300, 50, mBoxWidth, 10); //cylinder top
  fill(255);
  //filter
  rect(250,230,100,20); //filter body
  rect(240,240,120,10); //filter top
  //the coffee
  fill(0);
  rect(250,210,100,30);
  fill(255);
}

void mouseClicked() {
  print("MouseX is: " + mouseX);
  print("MouseY is: " + mouseY);
}



