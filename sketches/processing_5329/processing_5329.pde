
class Monster {
  float xFace; 
  float yFace;
  float size;
  float rotation;
  float scalar = 0.9;
  
  boolean toggle = false;
  
  

  Monster(float xpos, float ypos, float z){
    xFace = xpos;
    yFace = ypos;
    size = z;
  }

  void update(){
    if (toggle == true 
       //&& mouseX > xFace-130*size && mouseX < xFace+130*size && mouseY > yFace - 50*size && mouseY < yFace + 130*size
    ){
      // ellipse(mouseX,mouseY,10,10);
      angle += rotationSpeed;
      rotation = sin(angle)*scalar;
      scalar -= 0.005;
      scalar = constrain(scalar, 0, 1);
    }
  }

  void drawFace(){

    strokeCap(SQUARE);
    strokeWeight(10);

    translate(-240,-320);
    translate(xFace,yFace);
    pushMatrix();
    translate(240,320);
    scale(size);
    rotate(rotation);
    translate(0,-180);

    stroke(100);
    float x = 0;
    float y = 0;
    line(0,0,0,220);
    fill(255);
    ellipse(0,190,15,15);
    

    line(x+random(-5,5)-100,y,x+random(-5,5)+100,y);
    line(x+random(-5,5)-110,y+5,x+random(-5,5)+110,y+5);
    line(x+random(-5,5)-118,y+10,x+random(-5,5)+118,y+10);
    line(x+random(-5,5)-123,y+15,x+random(-5,5)+123,y+15);
    line(x+random(-5,5)-126,y+20,x+random(-5,5)+126,y+20);
    line(x+random(-5,5)-128,y+25,x+random(-5,5)+128,y+25);
    line(x+random(-5,5)-129,y+30,x+random(-5,5)+129,y+30);
    line(x+random(-5,5)-129,y+40,x+random(-5,5)+129,y+40);
    line(x+random(-5,5)-129,y+45,x+random(-5,5)+129,y+45);
    line(x+random(-5,5)-129,y+50,x+random(-5,5)+129,y+50);
    line(x+random(-5,5)-129,y+55,x+random(-5,5)+129,y+55);
    line(x+random(-5,5)-129,y+60,x+random(-5,5)+129,y+60);
    line(x+random(-5,5)-129,y+65,x+random(-5,5)+129,y+65);
    line(x+random(-5,5)-129,y+70,x+random(-5,5)+129,y+70);
    line(x+random(-5,5)-129,y+75,x+random(-5,5)+129,y+75);
    line(x+random(-5,5)-129,y+80,x+random(-5,5)+129,y+80);
    line(x+random(-5,5)-129,y+85,x+random(-5,5)+129,y+85);
    line(x+random(-5,5)-129,y+90,x+random(-5,5)+129,y+90);
    line(x+random(-5,5)-129,y+95,x+random(-5,5)+129,y+95);
    line(x+random(-5,5)-129,y+100,x+random(-5,5)+129,y+100);
    line(x+random(-5,5)-129,y+105,x+random(-5,5)+129,y+105);

    translate(0,55);
    line(x+random(-5,5)-125,y+55,x+random(-5,5)-10,y+55);
    line(x+random(-5,5)+10,y+55,x+random(-5,5)+125,y+55);
    line(x+random(-5,5)-120,y+60,x+random(-5,5)-15,y+60);
    line(x+random(-5,5)+15,y+60,x+random(-5,5)+120,y+60);
    line(x+random(-5,5)-118,y+65,x+random(-5,5)-18,y+65);
    line(x+random(-5,5)+18,y+65,x+random(-5,5)+118,y+65);
    line(x+random(-5,5)-115,y+70,x+random(-5,5)-22,y+70);
    line(x+random(-5,5)+22,y+70,x+random(-5,5)+115,y+70);
    line(x+random(-5,5)-110,y+75,x+random(-5,5)-25,y+75);
    line(x+random(-5,5)+25,y+75,x+random(-5,5)+110,y+75);
    translate(0,150);
    translate(x,y);
    image(eyes,-100 + random(-2,2),-190 + random(-2,2));
    image(jaw,-50 + random(-2,2),-125 + random(-2,2));
    fill(0);
    noStroke();
    rect(-40 + random(-2,2),-160 + random(-2,2),10,10);
    rect(36 + random(-2,2),-160 + random(-2,2),10,10);
    noFill();
    stroke(2);

    popMatrix();

  }
}


