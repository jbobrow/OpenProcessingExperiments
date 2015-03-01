
int s = 20;
float x = 350;
float y = 200;

void setup()
{
  noStroke();
  size(700,700);
  background(255);
  smooth();
  fill(0,120);
}
 
void draw()
{
float d = dist(mouseX, mouseY, 350, 350);
    if (d<30){
      background(230,0,0,180);
      fill(#FFF1C6,230);
    noStroke();
    ellipse(350,350,600,600);
    stroke(0);
      strokeWeight(8);
    strokeCap(ROUND);
      line(520,170,460,200);
      line(520,230,460,200);
      line(240,200,180,230);
      line(240,200,180,170);
      noFill();
      strokeWeight(5);
      ellipse(350,500,50,50);
    }
    else{
      background(255);
      int g=constrain (mouseX,180,210);
    int h=constrain (mouseX,490,520);
    fill(#FFF1C6,230);
    noStroke();
    ellipse(350,350,600,600);
    fill(0);
    ellipseMode(CENTER);
    ellipse(g,200,40,40);
    ellipse(h,200,40,40);
    noFill();
    stroke(0);
      strokeWeight(5);
      line(300,500,400,500);
    }
    if (d>300){
      background(0,200,0,180);
      fill(#FFF1C6,230);
    noStroke();
    ellipse(350,350,600,600);
    stroke(0);
      strokeWeight(6);
    strokeCap(ROUND);
      line(490,180,520,220);
      line(490,180,460,220);
      line(210,180,180,220);
      line(210,180,240,220);
      noFill();
      strokeWeight(5);
      arc(350,500,200,80,radians(10),radians(170));
    }
    noFill();
    stroke(0);
    strokeWeight(7);
    strokeCap(ROUND);
    arc(200,160-1200/d,110,50,radians(200),radians(340));
    arc(500,160-1200/d,110,50,radians(200),radians(340));
    noStroke();
    fill(220,0,0);
    ellipse(x, y, s, s);
    x = mouseX;
    y = mouseY;
    noFill();
    stroke(0);
    strokeWeight(5);
    strokeCap(PROJECT);
    arc(350,350,70,60,radians(-10),radians(190));
    
}
