

void setup() {
  size(450, 750, P2D);
  smooth();
}

void draw() {
  if (key == 'q' || key == 'Q')
    calculator(); 
  else if (key =='w' || key =='W')
    thoughtcycle();
  else if(key=='e' || key =='E')
    icons();
}

//tried to make this functional but ran out of time
void calculator() {
  PFont numFont;                          //creates PFont object
  PShape screen;                        //creates PShape object 
  PShape[] button = new PShape[20];    //creates an array of 20 PShape objects
  
  background(29);
  numFont = loadFont("Courier-48.vlw"); //loads font Courier
  textFont(numFont, 40);                //sets the font and point size
  screen = createShape(RECT, 0, 0, 430, 150);
  
  int index = 0;
  float xpos = 10;
  float ypos = 170;
  String display = " ";

  //fills array with rectangles
  for (int x = 0; x<=19; x++) {
    button[x] = createShape(RECT, 0, 0, 100, 100); 
  }

  //prints the screen
  screen.setFill(#D8F3FF);
  shape(screen, 10, 10);
 
  //prints three rows of buttons
  for (int row=0; row<=4; row++) {
    for(int obj = 0; obj<=3; obj++){

      if(index == 0){
        button[index].setFill(#46CDD7);
      }
      else if((row == 0)&&(index!=0)){
        button[index].setFill(#878686);
        
      }
      else if(obj == 3)
        button[index].setFill(#878686);
      else
        button[index].setFill(#FFAF87);
    
      shape(button[index],xpos,ypos);
      
      xpos = xpos+110;
      index++;
      
    }
    xpos = 10;
    ypos = ypos+110;
  }
}

void thoughtcycle(){
  background(0);
  PFont myFont;
  PShape box1, box2, box3;
  PShape circle1, circle2, circle3;
  
  myFont = loadFont("Helvetica-48.vlw"); //loads font Helvetica
  textFont(myFont, 40);                //sets the font and point size
  
  box1 = createShape(RECT,0,0,700,233);
  box2 = createShape(RECT,0,0,700,233);
  box3 = createShape(RECT,0,0,700,233);
  
  box1.setFill(#88913C);
  box2.setFill(#535925);
  box3.setFill(#3B4019);
  
  circle1 = createShape(ELLIPSE,0,0,60,60);
  circle2 = createShape(ELLIPSE,0,0,60,60);
  circle3 = createShape(ELLIPSE,0,0,60,60);
  
  circle1.setFill(#FFFFFF);
  circle2.setFill(#FFFFFF);
  circle3.setFill(#FFFFFF);
 
  circle1.setStroke(false);
  circle2.setStroke(false);
  circle3.setStroke(false);
  
  shape(box1,0,0);
  shape(box2,0,233);
  shape(box3,0,466);
  
  if(mouseY<233){
    shape(circle1,25,50);
    fill(136,145,60);
    text("1",43,95);
    fill(255);
    text("Go to travel site",20,170);  
  }
  else if (mouseY>=233 && mouseY<466){
    shape(circle2,25,290);//+240
    fill(83,89,37);
    text("2",43,335);
    fill(255);
    text("Find a flight",20,410); 
  }
  else if (mouseY>=466){
    shape(circle2,25,530);//+240
    fill(59,64,25);
    text("3",43,575);
    fill(255);
    text("Buy tickets",20,650); 
  }
  
}

void icons(){
  PImage icon1, icon2, icon3;
  PFont icoFont;
  
  icoFont = loadFont("Helvetica-48.vlw"); //loads font Helvetica
  textFont(icoFont, 30);                //sets the font and point size
  
  icon1 = loadImage("camera.png");
  icon2 = loadImage("gear.png");
  icon3 = loadImage("message.png");
  
  background(117,209,217);
  fill(0);
  
  image(icon1,20,20);  
  text("Camera",100,65);  

  image(icon2,20,110);
  text("Settings",100,155);
  
  image(icon3,20,200);
  text("Messages",100,245);
}


