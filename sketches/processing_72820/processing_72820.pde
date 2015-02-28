


Seahorse[] seahorse = new Seahorse[12];





 





void setup() {





  size(800,800);





  





   for (int i = 0; i < seahorse.length; i++ ) {





      seahorse[i] = new Seahorse(random(width), random(height), random(1,3));





   } 





}





 





void draw() {





  background(255,255,255);


if (mousePressed == true){
  PFont font;
  font = loadFont("Andalus-48.vlw");
  textFont(font);
  fill(255, 0, 0);
  text("It's a me!", 400, 400);
  text("Mario!", 400, 430);
}

for (int x = 0; x <= 2000; x += 5){
  line(0, x, 2000, x);
}
for (int y = 0; y <= 2000; y += 5){
  line(y, 0, y, 2000);
}

noFill();
for (int d = 2000; d > 0; d -= 10){
  ellipse(400, 400, d, d);
}
for (int x = -16; x < 2000; x += 10){ 
  line(x, 0, x+15, 2000);
}


for (int y = 750; y <= 2000; y += 5){
  for (int x = 750; x <= 2000; x += 5){
    if((x % 10) == 0){
      line(x, y, x+3, y-3);
    } else{
      line(x, y, x+3, y+3); }
  }
}
for(int y = 20; y <= 2000; y += 10){
  for(int x = 20; x <= y; x += 5){
    line(x, y, x-3, y-3);
  }
}

 if (mousePressed == true)





 for (int i = 0; i < seahorse.length; i++ ) { 





    seahorse[i].swimfast();





    seahorse[i].killerfish();





    seahorse[i].display();





  





 } else {      





    for (int i = 0; i < seahorse.length; i++ ) { 





      seahorse[i].swim();





      seahorse[i].display();





  }





}





}



class Seahorse {   





   





  float xpos;





  float ypos;





  float xspeed; 





  





  Seahorse(float tempx, float tempy, float tempspeed) { 





    





   println("a seahorse has been created");





    





   xpos = tempx;  





   ypos = tempy;





   xspeed = tempspeed;





  }





 





  void display() {





   PImage seahorse;





   seahorse = loadImage("smushroom.png");





   image(seahorse, xpos, ypos);   





  }





 





  void swim() {             





    xpos = xpos + xspeed;





    if (xpos > width) {





      xpos = 0;





    }





  }





   





  void swimfast() {             





    xpos = xpos + 35*xspeed;





    if (xpos > width) {





      xpos = 0;





    }





  }





   





  void killerfish() {





   PImage killerfish;





   killerfish = loadImage("smario.png");





   imageMode(CENTER);





   image(killerfish, mouseX, mouseY);   





    





   if ((xpos < mouseX + 70) && (xpos > mouseX - 70)) {





     if ((ypos < mouseY + 70) && (ypos > mouseY - 70)) {





       xpos+=70;





       ypos+=70;





        





       if ((xpos > 600) && (ypos > 600)) {





         xpos=random(0,300);





         ypos = random(0,300);



 


       }





        





     }





   }





  }





    





}



