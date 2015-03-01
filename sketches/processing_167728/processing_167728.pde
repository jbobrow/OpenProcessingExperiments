
int counter;

void setup() {
background(#3E0603);
size (500,500);
frameRate(7); 
}


void draw() {  
  counter++;
  rectMode(CENTER);
  noStroke();
   fill(random(255),random(30),0,50);
   if (mousePressed && (mouseButton == LEFT)) { 
   
    ellipse(mouseX, mouseY, random(50), random(50));
 //noFill();
strokeWeight (1); 
   stroke(0);
    ellipse(mouseX, mouseY, random(50), random(50));
    ellipse(mouseX, mouseY, random(50), random(50));
    ellipse(mouseX, mouseY, random(50), random(50));
   }
   
   else if (mousePressed && (mouseButton == RIGHT)) { 
   fill(0,random(30),random(255),50);
    ellipse(mouseX, mouseY, random(50), random(50));
 //noFill();
strokeWeight (1); 
   stroke(0);
    rect(mouseX, mouseY, random(50), random(50));
    rect(mouseX, mouseY, random(50), random(50));
    rect(mouseX, mouseY, random(50), random(50));
   }
  
else 
 {
   noStroke();
  fill(random(255),random(30),random(10),50);
    ellipse(random(500), random(500), random(250)+200, random(250)+200);
    ellipse(random(500), random(500), random(200)+150, random(200)+150);
    ellipse(random(500), random(500), random(150)+100, random(150)+100);
    ellipse(random(500), random(500), random(100)+50, random(100)+50);
    ellipse(random(500), random(500), random(50), random(50));
    
    noFill(); 
   stroke(0,random(30),random(255),50); //???
   strokeWeight(10);
   rect(width/2, height/2, random(250)+200, random(250)+200);
   rect(width/2, height/2, random(200)+150, random(200)+150);
    rect(width/2, height/2, random(150)+100, random(150)+100);
    rect(width/2, height/2, random(100)+50, random(100)+50);
    rect(width/2, height/2, random(50), random(50));
    //ellipse(width/2, height/2, 250, 250);
    //ellipse(width/2, height/2, 200, 200);
    //ellipse(width/2, height/2, 150, 150);
   // ellipse(width/2, height/2, 100, 100);
    //ellipse(width/2, height/2, 50, 50);
    }
   if(keyPressed) {
     if (key=='b'|| key == 'B');
    save("bild.png");
   }
    println(key);

    
} 
