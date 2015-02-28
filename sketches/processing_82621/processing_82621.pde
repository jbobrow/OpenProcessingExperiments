
//Cari Hume 
//Creative Computing Fall 2012 
//Final: Michigan Presidential Votes 


PFont f;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  ellipseMode(RADIUS);
  noStroke();  
  fill(224, 26, 39);  
  ellipse(200, 200, 100, 100);  
  noStroke();
  fill(68, 156, 202);
  float degree = map(54.3, 0, 100, 0, 360);
  arc(200, 200, 100, 100, radians(0), radians(degree));
  noStroke();
  
  ellipseMode(CENTER);  
  noStroke();
  fill(255);  
  ellipse(200, 200, 100, 100);
 

 textAlign(CENTER, TOP);
   fill(68, 156, 202);
 text("MICHIGAN PRESIDENTIAL VOTERS DATA", 200, 5); 

 if(mouseX >80 && mouseX < 280 && mouseY > 80 && mouseY <280) {
        
   fill(68, 156, 202);
 text("Obama: 54.3%", 50, 250);
 

    fill(68, 156, 202);
 text("Romney: 44.8%", 310, 100);
        }

  }
