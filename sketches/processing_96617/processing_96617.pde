
class circle{
  
  void draw(){
    //pushMatrix();
    if(second()<59){
      fill(random(1,255),random(1,255),random(1,255));
      ellipse(random(20,380),random(20,380),20,20);
     // popMatrix();
    
  }
}
}
 
circle mycircle1; 
circle mycircle2;  
circle mycircle3;
void setup() {
mycircle1= new circle();
mycircle2= new circle();
mycircle3= new circle();
  size(400, 400);

  smooth();

  frameRate(10);

}

 

void draw() {

  background((second()%9)*20,second()*6,(second()%7)*19);
 fill(255);
  ellipse(200, 200, 300, 300);
  noFill(); 
  strokeWeight(5);

  ellipse(200, 200, 300, 300);
  
mycircle1.draw();
mycircle2.draw();
mycircle3.draw();
 //pushMatrix();

   //  if(second()<60)

  //{

    

    //fill(random(1,255),random(1,255),random(1,255));

  //circles();

  //}

  //popMatrix();

   

  for (int i = 0; i < 12; i++) {

    float dx = cos(i * TWO_PI / 12);

    float dy = sin(i * TWO_PI / 12); 

    line(200 + 130 * dx, 200 + 130 * dy, 200 + 140 * dx, 200 + 140 * dy);

  }
strokeWeight(8);

  drawHand(80, hour(), 12);

   

  strokeWeight(5);

  drawHand(140, minute(), 60);

  }

 void drawHand(float radius, float value, float divider) {

  float x = 200 + radius * cos(value * TWO_PI / divider - PI / 2.0f);

  float y = 200 + radius * sin(value * TWO_PI / divider - PI / 2.0f); 
  stroke(random(100,200),random(100,200),random(100,200));

  line(200, 200, x, y);

}

//void circles(){

  //  ellipse(random(20,380),random(20,380),20,20);

    //ellipse(random(20,380),random(20,380),20,20);

    //ellipse(random(20,380),random(20,380),20,20);

    //ellipse(random(20,380),random(20,380),20,20);

    //ellipse(random(20,380),random(20,380),20,20);

//}
