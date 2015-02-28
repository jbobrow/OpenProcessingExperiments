

class Robot {

  float speed2;
  int direction = 1;
  float inc = 0.0; //mustache
  PImage eyes, mouth, body, b, mouth2, mouth3, eyes2, eyes3, rb2_body, rb2_body_2, flying, flying_2;
  boolean isGirl;

  //constructor
  Robot(boolean b) {

    isGirl = b;

    
    noCursor(); 

    eyes = loadImage("eyes_layer_final.png");// eyes
    eyes3 = loadImage ("eyes3.png");//normal eyes
    eyes2 = loadImage("eyes2.png"); //winking eye
    mouth = loadImage("lips_layer_final.png"); // mouth
    body = loadImage("rb_body.png"); // body
    mouth2 = loadImage("mouth2.png");//mouth2
    mouth3 = loadImage("mouth3.png");//mouth3
    rb2_body = loadImage("rb2_final.png");//rb2_original
    rb2_body_2 = loadImage("head_mustache_rb2.png");//rb2_mustache
    flying = loadImage("flying.png");// little robot flying  float angle = 0.0;
    flying_2 = loadImage("flying_mustache.png"); 
    stroke(0);//mustache
  }

  void display() {
    

    background (img);//background
    
    
    if (isGirl == false){
      imageMode(CENTER);
    }


    if (mouseY <= 150 && mouseX <= 300) {
      image(flying, mouseX, mouseY);
    }    
    else if (mouseX > 300 && mouseY > 150) {
      image(rb2_body_2, mouseX, mouseY);
    }
    else if (mouseX <= 300 && mouseY > 150) {
      image(rb2_body, mouseX, mouseY);
    }

    else if (mouseX > 300 && mouseY <= 150) {
      image(flying_2, mouseX, mouseY);
    }

    if (isGirl == false){
      imageMode(CORNER);
    }

    image(body, 75,115);//body
    image(eyes, 90, 170); //eyes
    image(mouth, 140, 255); //mouth 
    float speed = mouseX/2000.0; //mustache
    int units = (int) mouseY/10; //mustache
    mustache(speed, units);  //mustache


  }

  void mustache (float speed, int units) {

    inc += speed;
    float angle = sin(inc) / mouseY*10 + sin(inc*1.2) / mouseY*20;
    //float angle = sin(inc) / 10.0 + sin(inc*1.2) / 20.0;
    tail(150, 240, mouseX/20, angle, 1);
    tail(150, 240, mouseX/20, angle, -1);

    tail(150, 240, mouseY/20, angle, 1);
    tail(150, 240, mouseY/20, angle, -1);
  }
  void tail(int x, int y, int units, float angle, int d) {
    pushMatrix();
    translate(x,y);
    for (int i = units; i > 0; i--) {
      strokeWeight(i);
      line(5,3,0,-8);
      translate(-8*d,0);
      rotate(angle*d);  
    }  
    popMatrix();
  }

}


