
float colisio = -7;

float AlienX = 470;
float AlienY = 450;
float UllsY = 450;
float UlldX = 440;
float UlleX = 505;

String s = "CUIDAOOOOO!!";

void cylon () {
    fill(98, 93, 94);
    stroke(131, 121, 131);
    strokeWeight(2);
    ellipse(AlienX, AlienY, 110, 60);
    strokeWeight(5);
    stroke(223, 28, 28);
    fill(223, 28, 28);
    line(UlldX, UllsY, UlleX, UllsY);
}


void setup () {
  size(510, 510);
  stroke(137, 19, 41);
  noCursor();
}

void draw () {
  background(mouseX/3, mouseX/3, mouseX);



  //trets viper______________________________________
  
  noStroke();
  {
    if (mousePressed)
    {
      fill(247, 237, 40);
      ellipse(mouseX-2+random(30), mouseY-43+random(30), random(20, 30), random(20, 30));
      ellipse(mouseX-2+random(30), mouseY+20+random(30), random(20, 30), random(20, 30));
    }
  }

  //viper_______________________________________________
  
  stroke(95, 20, 38);
  strokeWeight(3);
  fill(200);
  triangle(mouseX-30, mouseY+40, mouseX-30, mouseY-40, mouseX+50, mouseY);
  ellipse(mouseX-5, mouseY-40, 30, 30);
  ellipse(mouseX-5, mouseY+40, 30, 30);

  //terra________________________________________________
  
  fill(21, 85, 46);
  noStroke();
  rect(0, 510, 510, mouseY/colisio*0.5);

  //text__________________________________________________
  
 float mov = 500-mouseY*0.4;
  textSize(32);
    if  (mouseY>=380) {    
      fill(random(80,250),random(80,250),0);
      text(s, mouseX+40,mov);
    } else {
      text(s, 600,600,0,0);
    }

  //cylon________________________________________
  translate(mouseX/-2, mouseY/-0.6);
  cylon();
  
  
}

