
void setup(){
size(600, 600);
smooth();
strokeWeight(5);
}

void draw(){
float x = mouseX;
float y = mouseY;

//he lifts
stroke(1000);
fill(10,70,120);
beginShape();
vertex(100,230);
vertex(300,230);
vertex(300,400);
vertex(100,400);
endShape();
//legs day
fill(10,50,80);
  rectMode(CENTER);
  rect(140,450,50,100);
  rect(260,450,50,100);
  rect(140,500,80,50);
  rect(260,500,80,50);
  
//lets try variable stuff
//int x = 100;
//int y = 
println(x,y);
//Start with the head of Rob, the gay robot
stroke(1000);
fill(10,50,120);
ellipse(200,132,190,200);
//how bout a chiseled human jaw?
fill(205,183,158);
beginShape();
vertex(120, 165);
vertex(280, 165);
vertex(250, 235);
vertex(150, 235);
endShape();
//laser eyes muhfuggah
fill(255,0,0);
beginShape();
vertex(120, 135);
vertex(280, 135);
vertex(280, 120);
vertex(120, 120);
endShape();
//mouth pls
 if (x%2==0) {
    noStroke();
    fill(255,255,255);
    ellipse(200,200,90,30);
  } else if (x%2==1) {
    noStroke();
    fill(255,255,255);
    ellipse(200,200,40,40);
  }
//shooting lasers!
point (mouseX, mouseY);
  strokeWeight (20);
  stroke (random(255), random(255), random(255));
  line(mouseX, mouseY, 200,200);
}




