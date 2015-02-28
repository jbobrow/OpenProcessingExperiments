



void setup(){
 size(500,500);
 background(70); 
 fill(0);
 rect(0,400,500,100);
 fill(10);
 rect(80,120,320,280);

 strokeWeight(5);
 stroke(10);
 line(250,120,150,20); 
 strokeWeight(5);
 stroke(10);
 line(250,120,350,40);
  fill(160,0,0);
// translate(20,30);
//rotate(45);
 quad(220, 390, 230, 380, 250, 380, 250, 395);
 colorMode (HSB, 600);//declare range
 frameRate (20);
 noStroke();
  
}

void draw () {

  for (int i=100;i<380;i=i+5) {
    for (int j=140;j<370;j=j+5) {
      fill(random(0, 600), random(0, 600), random(0, 600));
      rect(i, j, 5, 5);
    }
  }
}

