
/*
*@ desc SimpleGrammar
 *
 */
import rita.*;

RiGrammar grammar;
String[] lines;

PFont font;

int yOffset;
int i;

float theta; 
float beta;

void setup() {
  size(1000, 500);
  background(255);
  frameRate(5);
  //text
  font = createFont("Dialog-24",24);
  textFont(font);
  textAlign(CENTER);
  textSize(18);
  //grammar
  grammar = new RiGrammar(this, "simple_grammar.g");
  //init grammar
  update();
  //display
  yOffset = 70;
  i=0;
  }
  
  void mouseClicked(){
    if(frameCount>40){
    update();
    }
  }  
  
  void update() {
    String result = grammar.expand();
    lines = result.split("%");
    println("lines length: " + lines.length);
  }
  
  
  void draw(){
    background(0);
    animation();
    fill(200);
    //timer
    textAlign(CENTER);
    if(frameCount<30){
      text("A Series of Fairly Beleivable Assertions",500,250);
    }
    textAlign (CENTER);
    translate (width/2.2,height/3);
    if(frameCount>40){
    if(frameCount%30==4) {
      update();
      println("frameCount calls update");
    }
    for(int i = 0; i<lines.length;i++) {
      text(lines[i],50,i*yOffset+yOffset+1);
    }
  }
  }
  
void animation (){
  fill(0);
 
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(theta));
  rect (0, 0, 50, 60);
  fill(0, 25, 0);
  popMatrix();
  
  pushMatrix();
  translate(200, 200); 
  rotate(radians(-theta));
  fill (25, 5, 0);
  rect (0,0,50,50);
  rect (50,50,50,50);
  rect (100,100,50,50);
  translate (200,200);
  fill (25, 0, 5);
  ellipse (0,0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(200,400);
  rotate(radians(theta));
  fill(0, 25, 0);
  rect (0,0,50,50);
  rect (50,50,50,50);
  rect (100,100,50,50);
  translate (200,200);
  fill (34, 0, 10);
  ellipse (0,0, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(400,400);
  rotate(radians(-theta));
  fill(0,0,25);
  rect (0,0,50,50);
  rect (50,50,50,50);
  rect (100,100,50,50);
  translate (200,200);
  fill (10, 0, 25);
  rotate(radians(beta));
  ellipse (0,0, 50, 50);
  popMatrix();
  beta+=.5;
  
  pushMatrix();
  translate(400,200);
  rotate(radians(theta));
  fill(0, 0,25);
  rect (0,0,50,50);
  rect (50,50,50,50);
  rect (100,100,50,50);
  translate (200,200);
  fill (5, 25, 0);
  ellipse (0,0, 50, 50);
  popMatrix();
  
  theta+=.7; //reset matrix for every new translation
  
  pushMatrix();
  translate(800,50);
  rotate(radians(beta));
  fill(40,3,5);
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix();
  beta+=.6;
  
  pushMatrix();
  translate(670,140);
  rotate(radians(beta));
  fill(0,4,30);
  triangle(50, 105, 78, 40, 106, 95);
  popMatrix();
  beta+=.6;
  
  pushMatrix();
  translate(1000,370);
  fill(0,0,15);
  rotate(radians(theta));
  rect(0, 0, 100,100);
  popMatrix();
  theta+=1;


}

