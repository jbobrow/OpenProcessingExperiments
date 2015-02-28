
PImage b;
void setup(){
  size(400,306);
  b = loadImage("dattable.jpg");
  smooth();
  frameRate(1);
}
boolean question=true;
String[] answers={"outlook not/nso good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it, most possibly ummmm no", "not likely", "eribgerfbipbvfgubugbapbrbg no", "feeling lazy come back later", "your future is bright, good for you my friend.", "yes answer is, one lucky is."};
void draw(){
  if(question==true){
    background(b);
    eight();
  } else if(question==false){
    int x=int(random(13));
    background(b);
    answer();
    textAlign(CENTER);
    fill(255,0,0);
    textSize(10);
    text(answers[x],170,70);
  }
}
void mouseClicked(){
    question=!question;
    redraw();
    noLoop();
    
  }
void eight(){
  fill(0);
  ellipse(170,70,130,130);
  fill(255);
  ellipse(170,60,80,80);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(170,55,20,18);
  ellipse(171,70,23,17);
  fill(0,255,0);
  textSize(20);
  text("Ask a Yes/No Question and Click",70,170);
  text("To restart, click again",100,190);
}
void answer(){
    fill(0);
  ellipse(170,70,130,130);
  fill(255);
  ellipse(170,60,80,80);
  noFill();
  strokeWeight(2);
  stroke(0);
  fill(0,0,255);
  triangle(145,48,195,48,170,88);
  }



