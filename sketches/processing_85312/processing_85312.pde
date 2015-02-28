
float rs;
void setup() {
      size(400, 400);
      smooth();
}
void draw() {
  fill(100);
  rect(0, 0, width, height);
  strokeWeight(5);
  fill(100);
  //an alternate method
  //triangle(100+sin(rs+180)*100, 100+cos(rs+180) *100, 100+sin(rs+90)*100, 100+cos(rs+90)*100, 100+sin(rs) * 100, 100+cos(rs) * 100);
  beginShape();
    line(100+sin(rs) * 100, 100+cos(rs) * 100,100+ sin(rs+90) * 100,100+ cos(rs+90)*100);
    line(100+sin(rs+90)*100, 100+cos(rs+90)*100,100+ sin(rs+180)*100,100+ cos(rs+180)*100);
    line(100+sin(rs+180)*100, 100+cos(rs+180) *100, 100+sin(rs)*100,100+ cos(rs)*100);
    endShape();
      beginShape();
    line(300+sin(rs) * 100, 300+cos(rs) * 100,300+ sin(rs+90) * 100,300+ cos(rs+90)*100);
    line(300+sin(rs+90)*100, 300+cos(rs+90)*100,300+ sin(rs+180)*100,300+ cos(rs+180)*100);
    line(300+sin(rs+180)*100, 300+cos(rs+180) *100, 300+sin(rs)*100,300+ cos(rs)*100);
    endShape();
    line(300+sin(rs) * 100, 300+cos(rs) * 100,100+ sin(rs+90) * 100,100+ cos(rs+90)*100);
    line(300+sin(rs+90)*100, 300+cos(rs+90)*100,100+ sin(rs+180)*100,100+ cos(rs+180)*100);
    line(300+sin(rs+180)*100, 300+cos(rs+180) *100, 100+sin(rs)*100,100+ cos(rs)*100);
    rs+=0.05;
    if (mouseX < width/2) {
      noFill();
      ellipse(100, 100, 200, 200);
      ellipse(300, 300, 200, 200);
    }
}
