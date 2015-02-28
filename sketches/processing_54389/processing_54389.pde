
PFont f;
String message = "Smoke Free Area.";

void setup() {
  size(600, 600);
  f = createFont("Arial",20,true);
}

void draw() { 
  background(255);
  fill(100);
  textFont(f);         
  int x =5;
  for (int i = 0; i < message.length(); i++) {
    textSize(75);
    text(message.charAt(i),x,height/2);
    x += textWidth(message.charAt(i)); 
    

    fill(random(255),random(255),random(255),random(255));
    textSize(random(10, 400));
    text("freearea",-30,600);
    
    fill(random(100),random(255),random(100),random(255));
    textSize(random(10, 400));
    text("Smoke",random(-30),random(200));

  }
  noLoop();
}



