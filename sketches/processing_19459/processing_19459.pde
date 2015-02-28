
float x=160.0;

void setup(){
  size(250,250);
  smooth();
  background(0);
}
  
  void draw(){
    fill(0,0.99999999);
        rect(-20,-20,250,250);
     rect(-20,-20,230,230);
     rect(-20,-20,210,210);
     rect(-20,-20,190,190);
     rect(-20,-20,170,170);
     rect(-20,-20,150,150);
rect(20,20,250,250);
rect(40,40,250,250);
rect(60,60,250,250);
rect(80,80,250,250);
rect(100,100,250,250);
rect(120,120,250,250);


       // squares you can see when you move around mouse
  }
    
    
void mouseMoved(){
      x+=25;
      noStroke();
        fill(253,237,33, random(50,250));
  ellipse(mouseX-5,mouseY,70,70);
  //yellow circle
  fill(240,236,194, random(30,250));
  ellipse(mouseX+30,mouseY-15,75,75);
  //white circle
  fill(193,222,132, random(20,250));
  ellipse(mouseX+50, mouseY+30,100,100);
  //green circle
  if (x>150){
    x=100;}

    }


