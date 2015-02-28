
int i = 0;
int j = 0;
int ispeed = 5;
int jspeed = 6;
int spacing = 5;
color c;
boolean hitedge = false;

void setup() {
size(400,400);
background(255);

}

void draw() {
  moveRect();
  bounceRect();
  colorRect();
  drawRect();
  
  
  if(mousePressed == true) {
    noStroke();
    if (mouseButton == LEFT) {
      background(255);
      strokeWeight(5);
      rect(80, i, 80, j);
      rect(i, 80, j, 80);
      rect(i, 60, j, 60);
      rect(60, i, 60, j);
      rect(20, j, 20, i);
      rect(i, 20, j, 20);
      rect(j, i, 5, 5);
      rect(j,10, 10, 10);
      rect(10,i, 10, 10);
      rect(random(pmouseY - 5, pmouseY + 5), random(pmouseX - 5, pmouseX + 5), mouseX, mouseY); 
    } else if (mouseButton == RIGHT) {
      background(0);
      ellipse(random(height), random(width), 50, 50);
      rect(i,j, random(height), random(width));    
    }
  }
  
   
}


/*void mouseDragged() {
  stroke(random(255));
  line(0, 0, random(height), random(width));
  line(0, 400, random(height), random(width));
  line(400, 0, random(height), random(width));
  line(400, 400, random(height), random(width));
}
*/
void moveRect() {
  i = i + ispeed;
  j = j + jspeed;
}

void bounceRect() {
  if(i > width || i < 0) {
    ispeed = ispeed * -1;
    hitedge = true;
  }
  
  if(j > height || j < 0) {
    jspeed = jspeed * -1;
    hitedge = true;
  }
}

void drawRect() {
  background(255);
  fill(c);
  rect(i, j, 50, 50);
}

void colorRect() {
  if (hitedge) {
    hitedge = false;
    c = color(random(255), random(255), random(255));
  }
}


    

