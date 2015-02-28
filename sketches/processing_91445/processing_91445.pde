
void setup() {
  size(800 , 600);
  background(0, 0, 0);
}
void draw(){
 ellipseMode(CENTER);
 if(mousePressed){
   int x = mouseX;
   int y = mouseY;
   int currentY = mouseY;
   int n = int(random(5, 100));
   int randomRed, randomBlue, randomGreen;
   int direction = int(random(1, 9));
   
   
   if(direction == 1){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX, mouseY - n, n, n);
       n = n-1;
     }
   }
   if(direction == 2){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX, mouseY + n, n, n);
       n = n-1;
     }
   }
   if(direction == 3){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX - n, mouseY, n, n);
       n = n-1;    
     }
   }
   if(direction == 4){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX + n, mouseY, n, n);
       n = n-1;       
       }
   }
   if(direction == 5){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX - n, mouseY - n, n, n);
       n = n-1;
     }
   }
   if(direction == 6){ 
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX + n, mouseY - n, n, n);
       n = n-1;
     }
   }
   if(direction == 7){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX + n, mouseY + n, n, n);
       n = n-1;    
     }
   }
   if(direction == 8){
     randomRed = int(random(1, 255));
     randomBlue = int(random(1, 255));
     randomGreen = int(random(1, 255));
     while (n > 0){
       //randomRed = int(random(1, 255));
       //randomBlue = int(random(1, 255));
       //randomGreen = int(random(1, 255));
       stroke(randomRed, randomBlue, randomGreen);
       fill(randomRed, randomBlue, randomGreen);
       ellipse(mouseX - n, mouseY + n, n, n);
       n = n-3;       
       }
   }
 }
} 


