
void setup() {
  size( 600,600);
}

void draw() {
  for( float y=0; y<600;  y=y+40){
    for( float x=0; x<600;  x=x+40){
      pushMatrix();
      translate(x,y);
//rotate(radians(frameCount)); 회전함

//rotate(radians(frameCount+x));
      scale(0.15);
      seo_draw();
      popMatrix();
    }
  }
}

void seo_draw() {
  //얼굴
strokeWeight(3);
fill(240,188,127);

ellipse(10,50,30,50);
ellipse(190,50,30,50);

ellipse(100,50,180,200);

//볼
fill(200,0,0);
ellipse(60,100,30,10);
ellipse(140,100,30,10);

//코
fill(200,0,0);
ellipse(100,80,5,5);

//입
line(100,85,100,100);
line(100,100,80,120);
line(100,100,120,120);
line(80,120,120,120);


//눈썹
noStroke();
fill(0,0,0);
rect(30,10,60,7);
rect(110,10,60,7);

//안경
noFill();
stroke(255,0,108);
strokeWeight(10);
ellipse(60,50,50,50);
ellipse(140,50,50,50);
beginShape();
vertex(85,50);
vertex(115,50);
endShape(CLOSE);


//눈알
noStroke();
fill(0,0,0);
ellipse(60,60,20,20);
ellipse(140,60,20,20);

//나비넥타이
fill(200,0,0);
ellipse(100,160,20,20);
ellipse(75,160,40,40);
ellipse(125,160,40,40);
}


                
                
