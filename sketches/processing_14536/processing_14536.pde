
void setup() {
size(300,300);
}
  
void draw() {
  background(#ff22ee);
  for(int x=0; x<300; x=x+60){
   for(int y=0; y<300; y=y+60){
     pushMatrix();
     translate(x,y);
     scale(0.5);
     rotate(radians(frameCount/2));
     jungmin_draw();
     popMatrix();
      
   }
  }
 }
   
void jungmin_draw() {
//머리카락
stroke(0);
fill(0);
beginShape();
vertex(30,110);
vertex(40,40);
vertex(50,60);
vertex(60,30);
vertex(70,40);
vertex(80,20);
vertex(90,40);
vertex(100,10);
vertex(110,30);
vertex(120,10);
vertex(130,40);
vertex(140,20);
vertex(150,50);
vertex(160,30);
vertex(170,100);
endShape(CLOSE);
 
 
//귀
fill(240,200,140);
strokeWeight(3);
ellipse(30,110,30,30);
ellipse(170,110,30,30);
 
 
//얼굴
strokeWeight(3);
fill(240,200,140);
ellipse(100,120,140,130);
 
 
//코
strokeWeight(3);
beginShape();
vertex(75,100);
vertex(75+50,100);
vertex(75+50,150);
vertex(75,150);
endShape(CLOSE);
 
 
//콧구멍
strokeWeight(3);
rect(88,145,2,2);
rect(110,145,2,2);
 
 
//안경
strokeWeight(5);
beginShape();
vertex(50,90);
vertex(90,90);
vertex(90,130);
vertex(50,130);
endShape(CLOSE);
 
beginShape();
vertex(50+60,90);
vertex(90+60,90);
vertex(90+60,130);
vertex(50+60,130);
endShape(CLOSE);
 
 
//안경알
strokeWeight(3);
line(75,100,60,115);
line(75,110,65,120);
line(75+60,100,60+60,115);
line(75+60,110,65+60,120);
 
 
//눈썹
strokeWeight(3);
fill(0);
beginShape();
vertex(53,85);
vertex(65,78);
vertex(88,85);
endShape(CLOSE);
 
beginShape();
vertex(53+60,85);
vertex(65+68,78);
vertex(88+60,85);
endShape(CLOSE);
 
 
//입
strokeWeight(4);
stroke(255,0,0);
line(85,165,110,165);
line(110,165,115,160);
}

