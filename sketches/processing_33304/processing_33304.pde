
PFont bootFont;
PImage paper1;

float xPos1 = 0;
float vel1 = 8;
float a = 600;
float b = 1600;
float c = 2600;
float d = 3600;
float e = 4600;
float f = 5600;
float g = 6600;

void setup() {
  size(500, 500);
}

void draw() {
  paper1=loadImage ("paper.jpg");
  image(paper1, 0, 0);
  println(mouseX+", " + mouseY);




  bootFont = createFont("Discipuli Britannica", 21, true);

  textFont(bootFont);
  xPos1 -= vel1;
  fill(12);
  
  for (int i=94; i<350; i+=17){
  text("Dear Coffee,", xPos1+a, i);
    text("People say you hurt me.", xPos1+b, i);
  text("Yet I cannot live without you.", xPos1+c, i);
   text("...", xPos1+d, i);
     text("for now, at least.", xPos1+e, i);
     text("Most sincerely,", xPos1+f, i);
     text("The Student.", xPos1+g, i);

      
  }
}


