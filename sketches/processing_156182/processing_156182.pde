
void setup(){
  size(1000,1000);
}
  
  void draw(){
float r1 = random(255);
float r2 = random(255);
float r3 = random(255);
float b1 = random(255);
float b2 = random(255);
float b3 = random(255);
background(b1,b2,b3);
fill(r1,r2,r3);
rect(70,60,70,70);
fill(r1,r2,r3);
rect(750,60,70,70);
fill(r1,r2,r3);
rect(200,200,500,500);
fill(0);
rect(100,50,50,50);
rect(730,40,50,50);
fill(r1,r2,r3);
fill(r1,r2,r3);
//rect(425,700,30,30);line(425,425,50,50);
rect(500,700,30,90);
rect(500,720,60,30);
rect(479,720,60,30);
rect(476,790,80,30);
rect(456,790,30,60);
rect(540,790,30,60);
rect(400,100,65,100);
fill(r1,r2,r3);
rect(398,65,70,70);
fill(r1,r2,r3);
rect(70,120,800,30);

  if (keyPressed) {
    if(key == 'q' ||  key == ' '){
      fill(255);
    }
  } else {
    fill(r1,r2,r3);
  }
triangle(388,550,460,550,430,600);

fill(0);
rect(404,50,58,58);
  }

