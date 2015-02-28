

void setup(){
//size(1300,700);
size(500,500);
frameRate(10);
}

void draw(){
for (int y = 0; y < height+45; y += 40) {   //draws grid pattern
  for (int x = 0; x < width+45; x += 40) {
    fill (0);
    rect(x, y, 40, 40);
    strokeWeight(random(0,5));
    stroke(150,85,75,150);
   
    
    //variable that randomly assigns each triangle a number, also variables for color.
    int choice = round(random(1)); //selects either 0 or 1 as a random number. rounds to nearest integer.
        int R = round(random(100,200));
          int G = round(random(75,125));
            int B = round(random(50,100));
            
            if (mousePressed){
            R = 175;
            G = 10 + round(random(2,10) * 10);
            B = 20 + round(random(2,10) * 10);
    }
            
            float funk = mouseX + mouseY * random(-2,2);
            
   if (funk < width || funk < height) {
    pushMatrix(); //lets the program know that 0, 0 is about to be reset
    translate(x, y); //translates 0, 0 to x, y
    fill(R,G,B,R);
    noStroke();
    if (choice == 1) { //if choice is set to 0 for this triangle
      triangle(funk, funk, 20, 40, 40, 20); //draw a triangle facing up
    } else { 
      triangle(funk,0, 20, 0, 40, random(25,200)); //draw a triangle facing down
    }
    popMatrix(); //resets coordinates so that 0, 0 is once again 0, 0
   }
  }   
}
}


