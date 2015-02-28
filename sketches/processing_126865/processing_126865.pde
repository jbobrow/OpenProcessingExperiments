
int monstertjeX;
int monstertjeY;

int richting;
int teller;

boolean test;
int y;
int x;
int spatie;
int stop;


void setup() {
  size(200, 200);
  monstertjeX = 100;
  monstertjeY = 100;
  richting = 10;
  teller = 0;
  test=true;
  y=0;
  x=0;
  spatie = 20; 
  stop = 200;
}

void draw() {
  background(255);
  stroke(0);

 while (y < stop) {
   noStroke();
   println("test");
      fill(0, 212, 255);
      rect(x, y, 20, 10);
      y=y+spatie;
      x=x+spatie;
      }
     y=0;
     x=0;
    

    
      //lijf
      stroke(0);
      if (test == true) {
        fill(255, 0, 0);
      }
      if (test == false) {
        fill(0, 0, 255);
      }
      ellipseMode(CENTER);
      ellipse(monstertjeX, monstertjeY, 100, 100);
    
      //binnenkant lijf
      fill(255, 255, 255);
      ellipseMode(CENTER);
      ellipse(monstertjeX, monstertjeY, 40, 40);
    
      //oog links
      fill(255, 255, 255);
      ellipse(monstertjeX-15, monstertjeY-33, 20, 20);
      fill(0);
      ellipse(monstertjeX-15, monstertjeY-30, 10, 10);
    
      //oog rechts
      fill(255, 255, 255);
      ellipse(monstertjeX+15, monstertjeY-33, 20, 20);
      fill(0);
      ellipse(monstertjeX+15, monstertjeY-30, 10, 10);
    
      //benen
      line(monstertjeX-20, monstertjeY+45, monstertjeX-20, monstertjeY+65);
      line(monstertjeX+20, monstertjeY+45, monstertjeX+20, monstertjeY+65);
      strokeWeight(3);
    
      //armen
      line(monstertjeX-70, monstertjeY-10, monstertjeX-40, monstertjeY);
      line(monstertjeX+40, monstertjeY, monstertjeX+70, monstertjeY-10);
    
      //voeten
      fill(0, 0, 255, 150);
      rect(monstertjeX-35, monstertjeY+65, 15, 10);
      fill(0, 0, 255, 150);
      rect(monstertjeX+20, monstertjeY+65, 15, 10);
    
      //tanden
      fill(255);
      rect(monstertjeX, monstertjeY-17, 7, 10);
      rect(monstertjeX-10, monstertjeY-17, 7, 10);
      rect(monstertjeX, monstertjeY+7, 7, 10);
      rect(monstertjeX-10, monstertjeY+7, 7, 10);
    
      //strik
    
      fill(35, 180, 40);
      ellipse(monstertjeX-20, monstertjeY+33, 30, 30);
      ellipse(monstertjeX+20, monstertjeY+33, 30, 30);
      ellipse(monstertjeX, monstertjeY+35, 25, 25);
    
      monstertjeX = monstertjeX + richting;
    
      if (monstertjeX > width ||  monstertjeX < 0) {
        richting = -richting;
        if (teller==10) {
          teller=0;
          test=!test;
        }
        println(teller);
        teller = teller +1;
      }
}

