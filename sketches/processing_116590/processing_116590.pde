
int listposition =0;

int xpos = 10; //position of square.
int ypos = 20; //position of square.

String[] textarray = {"Processing Workshop 2","Is","Abit","Confusing!"};

//Courier-14.vlw

void setup() {
  frameRate(15);
  size(800,450);
  background(231,174,83); 
  stroke(98,43,0);
  PFont headerfont;
  headerfont = loadFont("Courier-14.vlw");
  textFont(headerfont);
  text("Processing Workshop 2",10,20);
}

void draw() {
  background(231,174,83); //redraw background each time.
  
  noFill();
  stroke(214,0,0);
//  rect(mouseX,mouseY,20,20); //(position then size)
//  rect(xpos,ypos,20,20); //(position then size)
  xpos +=5; //add 5 pixels to position of square each time.
 
  if (xpos > width) {
    xpos=0; 
    ypos +=40;
  }
  
  int xposloop =10;
  int yposloop =20;
  
//  int redvalue = int(random(200,255));
  int greenvalue = int(random(0,255));
//  int bluevalue = int(random(0,255));
  
  int redvalue = mouseX/3;
  int bluevalue = mouseY/2;
  
  
  if(mousePressed){
    
  for(int i=0; i<405; i++){ //counter(+1 each time and run this)
    noStroke();
    fill(redvalue-(0.2*i),greenvalue-(0.3*i),bluevalue*(0.1*i)); //generating random colour fill
    ellipse(xposloop,yposloop,20,20);
    xposloop+=30;
      if (xposloop > width) {
    xposloop=10; 
    yposloop +=30;
  }
  }
  }
  
  fill(255,255,255, xpos); 
  text(textarray[listposition],10,20);
}

void mouseClicked (){
  
  listposition+=1;
  if(listposition >3){
    listposition=0;
  }
}
