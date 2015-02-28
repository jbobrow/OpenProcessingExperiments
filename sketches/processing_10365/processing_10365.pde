
float angle = 0.0; // Current angle
float speed = 4.01; // Speed of motion
float radius = 180.0; // Range of motion
float sx = 8.0;
float sy = 2.0;
float hh = 0;
 color col;
void setup() {
  size(800, 600);
  noStroke();
  background(0);
  smooth();
}

void draw() {
  // EVENTOS
  if(keyPressed){
    if(key == '1') {
       float sx4 = 6.0;
      float sy4 = 0.05;
      float x6 =  width/1.5 + sin(angle) * radius;
      float y6 = height/1.5 + cos(angle) * radius;
        ellipse(x6, y6, 1, 1);
    }
 if(key == '2') {
      limpia();
       sx = random(1);
       sy = 2.0;
        println("key 1 : sx:   "+sx +"  sy:" + sy);
      
    }
    if(key == '3') {
       float sx4 = 6.0;
      float sy4 = 6.0;
      float x =  width/2 + sin(angle) * radius;
      float y = height/2 + cos(angle) * radius;
      //parametros circulo principal
      ellipse(x, y, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x + cos(angle * sx) * radius;
      float y3 = y + sin(angle * sy) * radius;
      fill(0,0);
      ellipse(x3, y3, 30, 30); // Draw larger circle
      println("key 1 : sx:   "+sx +"  sy:" + sy);

      
    }
  }
  
 /* fill(0, 15);
  rect(0, 0, width, height);*/
  angle += speed; // Update the 
  println("angle:;"+angle);
 
  float x =  width/2 + sin(angle) * radius;
  float y = height/2 + cos(angle) * radius;
  
 
  fill(255);
  ellipse(x, y, 2, 2); // Draw smaller circle
  

  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = x + cos(angle * sx) * radius ;
  float y2 = y + sin(angle * sy) * radius ;
  ellipse(x2, y2, 1, 1); // Draw larger circle
  
  //line 
   if(hh<100){
      hh+=1;
    } else{
      hh--;
    }
    
    col = color(255,255,100+hh,15);
  stroke(255,hh);
  line(x,y,x2,y2);

}
void limpia(){
  background(0);
  }

