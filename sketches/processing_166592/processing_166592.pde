
int progress = 0; //progress variable for progressbar();

Circle c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18;

void setup(){
  size(700,700);
  c1 = new Circle(30,0,2,30);
  c2 = new Circle(100,0,3,30);
  c3 = new Circle(130,0,4,30);
  c4 = new Circle(160,0,5,30);
  c5 = new Circle(220,0,6,30);
  c6 = new Circle(250,0,7,30);
  c7 = new Circle(280,0,2,30);
  c8 = new Circle(310,0,3,30);
  c9 = new Circle(340,0,4,30);
  c10 = new Circle(370,0,5,30);
  c11 = new Circle(400,0,6,30);
  c12 = new Circle(430,0,7,30);
  c13 = new Circle(460,0,2,30);
  c14 = new Circle(490,0,3,30);
  c15 = new Circle(520,0,4,30);
  c16 = new Circle(550,0,5,30);
  c17 = new Circle(580,0,6,30);
  c18 = new Circle(610,0,7,30);
}

void draw(){
  if(key == 'q' || key == 'Q')
    cascade();
  else if (key == 'w' || key == 'W')
    progressbar();
  else if (key == 'e' || key == 'E')
    falling();
}

void cascade(){
  PFont font;
  font = loadFont("Courier-48.vlw");
  textFont(font,22);
  background(0);
  
  PImage img;
  img = loadImage("screenshot.jpg");
  image(img, 0, 0);
  
  //top menu
  fill(250);
  rect(0,0,700,30);
  rect(0,0,80,30);     //box for file
  rect(80,0,80,30);   //box for edit
  rect(160,0,105,30); //box for object
  fill(1);
  text("File",14,21);
  text("Edit",94,21);
  text("Object",174,21);
  
  //cascading menus
  if((mouseX<=80)&&(mouseY<=30)){
    fill(250);
    rect(0,30,200,130);
    fill(1);
    text("New     cmd+N",14,55);
    text("Open    cmd+O",14,86);
    text("Save    cmd+S",14,117);
    text("Save As",14,148); 
  }
  else if((mouseX>80)&&(mouseX<160)&&(mouseY<=30)){ 
    fill(250);
    rect(80,30,266,163);
    fill(1);
    text("Undo         cmd+Z",94,55);
    text("Redo   shift+cmd+Z",94,86);
    text("Cut          cmd+X",94,117);
    text("Copy         cmd+C",94,148);
    text("Paste        cmd+V",94,179);
  }
    else if((mouseX>=160)&&(mouseX<240)&&(mouseY<=30)){ 
    fill(250);
    rect(160,30,292,132);
    fill(1);
    text("Transform           ",174,55);
    text("Arrange             ",174,86);
    text("Group          cmd+G",174,117);
    text("Ungroup  shift+cmd+G",174,148);
    }
}

void progressbar(){
  PFont font;
  font = loadFont("Courier-48.vlw");
  textFont(font,22);
  background(0);
  
  stroke(1);
  fill(230);
  rect(100,100,500,200);      //box
  fill(210);
  rect(100,100,500,30);      //header
  fill(240);
  rect(200,220,300,40);     //progress bar background
  
  fill(1);
  text("Downloading",276,122);
  text("Please wait.",200,180);
  
  if(progress<300)
    progress++;
  else
    progress = 0;
  
  fill(56,170,240);
  noStroke();
  rect(200,220,progress,40);
  
}

void falling(){
  background(255);

  c1.fall();
  c2.fall();
  c3.fall();
  c4.fall();
  c5.fall();
  c6.fall();
  c7.fall();
  c8.fall();
  c9.fall();
  c10.fall();
  c11.fall();
  c12.fall();
  c13.fall();
  c14.fall();
  c15.fall();
  c16.fall();
  c17.fall();
  c18.fall();
  
  c1.display();
  c2.display();
  c3.display();
  c4.display();
  c5.display();
  c6.display();
  c7.display();
  c8.display();
  c9.display();
  c10.display();
  c11.display();
  c12.display();
  c13.display();
  c14.display();
  c15.display();
  c16.display();
  c17.display();
  c18.display();
}
class Circle{
  float xpos;
  float ypos;
  float size;
  float speed;
  
  Circle(float x, float y, float s, float si){
    xpos = x;
    ypos = y;
    speed = s;
    size = si;
  }
  
  void display(){
    noStroke();
    fill(143,196,217);
      
    ellipse(xpos,ypos,20,20);
  }
  
  void fall(){
    ypos = ypos+speed;
    if(ypos>width)
      ypos = 0;
    size = size+speed;
  }
}


