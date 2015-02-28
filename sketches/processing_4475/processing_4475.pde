
int x = 0;
int y = width;
int o = width;
int n = width;
int w = width; 
int j = width;
int speed = 1;
int speedj = 2;

void setup() {
  smooth();

  size(400, 400);
}

void draw() {

  background(255);
noFill();
x = x + speed;   
o = o + speed;
w = w + speedj;
y = y - speed;  
n = n - speedj;  

  for (int i = - 19; i < width; i = i + 10) {
strokeWeight(0.5);
      ellipse(x+i, 20, x+i, 200);
ellipse(x+i, 20, x+i, 80);
      if (x > 10) {
        x = 0;
      }
  }
      
       for (int q = 500; q > 0; q = q - 10) {
         strokeWeight(2);
              line(y-q, 135, y-q, 160);
              
      if (y < 490) {
        y = 500;
      }
       }
       
              for (int q = 500; q > 0; q = q - 10) {
         strokeWeight(0.5);
              ellipse(y-q, 400, y-q, 250);

      if (y < 490) {
        y = 500;
      }
       }
        for (int j = 450; j > 0; j = j - 10) {
         strokeWeight(1);
              rect(n - j, 250, 5, 5);
              
      if (n < 420) {
        n = 450;
      }
        }
       for (int f = - 65; f < 500; f = f + 65) {
         strokeWeight(1);
              rect(o+f, 205, 50, 50);
              
      if (o > 65) {
        o = 0;
      }
    }
    
    
           for (int f = - 65; f < 500; f = f + 65) {
         strokeWeight(1);
         rectMode(CENTER);
              rect(o+f, 205, 20, 20);
              
      if (o > 65) {
        o = 0;
      }
    }
    
    
   for (int f = - 65; f < 500; f = f + 20) {
         strokeWeight(6);

              point(w+f, 275);

              
      if (w > 40) {
        w = 0;
      }
    }
       
}


