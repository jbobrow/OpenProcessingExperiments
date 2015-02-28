
//homework 4
//copyright Emily So

void setup()
{
  size(400, 400);
  background(0);
  fill(200, 200, 0);
  textSize(24);
  textAlign(CENTER, CENTER);


background(159, 159, 170);
size (500, 500);
float x, y, wd, ht;
x = 250;
y = 230;
wd = 430;
ht = 120;
 
noFill();
stroke(0, 155, 120);
strokeWeight(20);
ellipse(x, y, wd, wd);
strokeWeight(.035*x);

stroke(0, 40, 60);
ellipse(x, y, .9*wd, .9*wd);
//"E"
stroke(100, 20, 80);
//strokeWeight(.02*wd);
beginShape();
curveVertex(x - .2*ht, y - ht);
curveVertex(x - .2*ht, y - ht);
curveVertex(x - ht, y - ht);
curveVertex(x - (ht+30), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht+30), y+.05*wd);
curveVertex(x - (ht+30), y+.1*wd);
curveVertex(x - ht, y + .12*wd);
curveVertex(x - .2*ht, y+.1*wd);
curveVertex(x - .2*ht, y+.1*wd);
endShape();
//"S"
stroke(100, 40, 140);
beginShape();
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .25*wd, y - ht);
curveVertex(x + .1*wd, y - .8*ht);
curveVertex(x + .08*wd, y - .7*ht);
curveVertex(x + .12*wd, y - .6*ht);
curveVertex(x + .4*wd, y);
curveVertex(x + .4*wd, y + .2*ht);
curveVertex(x + .2*wd, y + .4*ht);
curveVertex(x + .07*wd, y + .1*ht);
curveVertex(x + .07*wd, y + .1*ht);
endShape();

char c = 'x';


ellipse(20, 20, 20, 20);
}
//BREAAAK

//void keyPressed()
//{
//  }
//  if (key == 'c')
//  {
//    ellipse(200, 200, mouseX, mouseY);
//  }
//  if (key == 'm')
//  {
//    rect(10, 10, 10, 10);
//
//  }
//}

void draw() {
        float x, y, wd, ht;
x = 250;
y = 230;
wd = 430;
ht = 120;
  
  if(keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(0);
    }
    if (keyCode == UP) {
      fill(random(255));
      x = mouseX+50;
      y = mouseY+60;
    }
    if (keyCode == DOWN) {
      fill(random(255));
      ellipse(random(150, 200), random(220, 400), random(200), random(200));
      


      noFill();
stroke(random(255), 155, 120);

strokeWeight(20);
ellipse(x, y, wd, wd);
strokeWeight(.035*x);

stroke(0, 40, 60);
//ellipse(x, y, .9*wd, .9*wd);
ellipse(x, y, random(300), random(300));
strokeWeight(random(5));
stroke(random(200, 255), 200, 200);
ellipse(x, y, random(300), random(300));
}
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
//WOAH!!!!!!!!!
//HHHHHHAHAHAHAHAHAHAHAHAH
  if (mousePressed);

  stroke(random(255), random(255), random(255));
  noFill();
strokeWeight(random(30));
beginShape();

curveVertex(x - .2*ht, y - ht);
curveVertex(x - .2*ht, y - ht);
curveVertex(x - ht, y - ht);
curveVertex(x - (ht+30), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht+30), y+.05*wd);
curveVertex(x - (ht+30), y+.1*wd);
curveVertex(x - ht, y + .12*wd);
curveVertex(x - .2*ht, y+.1*wd);
curveVertex(x - .2*ht, y+.1*wd);
endShape();
  }
  //haaaaaaAAAAAAAAAAY
    if (key == 'e') {
      wd = wd - mouseX;
      ht = ht - mouseY;
      
//S
noFill();
      stroke(random(100), random(255), random(140));

beginShape();
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .25*wd, y - ht);
curveVertex(x + .1*wd, y - .8*ht);
curveVertex(x + .08*wd, y - .7*ht);
curveVertex(x + .12*wd, y - .6*ht);
curveVertex(x + .4*wd, y);
curveVertex(x + .4*wd, y + .2*ht);
curveVertex(x + .2*wd, y + .4*ht);
curveVertex(x + .07*wd, y + .1*ht);
curveVertex(x + .07*wd, y + .1*ht);
endShape();
//WOOOOOOOOOOOOOOOAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHH
    }

    fill(255);
  }
 
 
                
