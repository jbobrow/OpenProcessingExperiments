
void setup() {
  size(600,400);
  background(240,235,195);
  smooth();
}
  
void draw() {
  noStroke();
  frameRate(100);

  
  if (mousePressed && (mouseButton == LEFT)) {
    fill(62,38,9);
    ellipse(mouseX,mouseY,3,6);
    fill(62,38,9,100);
    ellipse(mouseX+1,mouseY-3,2,4);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(240,235,195);
    ellipse(mouseX,mouseY,20,20);
  } else {
    noFill();
  }
  fill(50,30,9);
  rect(0,0,50,height);
  rect(0,0,width,50);
  rect(0,height-50,width,50);
  rect(width-50,0,50,height);
  stroke(50,30,9);
  line(width/2,0,width/2,height);
  stroke(62,38,9);
  line(65,100,width/2-15,100);
  line(65,120,width/2-15,120);
  line(65,140,width/2-15,140);
  line(65,160,width/2-15,160);
  line(65,180,width/2-15,180);
  line(65,200,width/2-15,200);
  line(65,220,width/2-15,220);
  line(65,240,width/2-15,240);
  line(65,260,width/2-15,260);
  line(65,280,width/2-15,280);
  line(65,300,width/2-15,300);
  line(65,320,width/2-15,320);
  //pagdestra
  line(width/2+15,100,width-65,100);
  line(width/2+15,120,width-65,120);
  line(width/2+15,140,width-65,140);
  line(width/2+15,160,width-65,160);
  line(width/2+15,180,width-65,180);
  line(width/2+15,200,width-65,200);
  line(width/2+15,220,width-65,220);
  line(width/2+15,240,width-65,240);
  line(width/2+15,260,width-65,260);
  line(width/2+15,280,width-65,280);
  line(width/2+15,300,width-65,300);
  line(width/2+15,320,width-65,320);
}

