
float rx, rxp, ry, ryp, z = 0;

void setup(){
  size(500, 500, P3D);
  
}

void draw(){
  background(0);
  translate(width/2, height/2, z);
  float rxp = ((mouseX-(width))*0.015);
  float ryp = ((mouseY-(height))*0.015);
  rx = (rx * 0.95)+(rxp*0.1);//x rotation speed
  ry = (ry * 1.95)+(ryp*1.10); // y rotation speed
  rotateX(rx);
  
  for (int j = 0; j < 15; j++){///capacity  lines
    rotateY(50);
    for (int i = 0; i < 800; i++){
      pushMatrix();
      rotateZ(i);
      stroke(199, 255, 255, 100);
      //line( sin(i) * 30.5,0, cos(i) * 87.5,0, sin(i) * 35, cos(i) * 59.5);
      stroke(200, 255, 55, 100);
      line( sin(i) * 60,0, cos(i) * 200,0, sin(i) * 30, cos(i) * 150);//yellow line
      stroke(200, 10, 155, 100);
      line( sin(i) * 33,0, cos(i) * 110,0, sin(i) * 16.5, cos(i) * 81.5);//pink
      stroke(255, 00, 50, 100);
     //line( sin(i) * 66.4, 50, cos(i) *88, 0, sin(i) * 10, cos(i) * 52.5);//red
      stroke(255,255, 99, 180);
      line(0, sin(i)*10, cos(i)*24,0, sin(i)*50, cos(i)*95);
      
      stroke(255, 215, 0, 100); 
      line(random(0,7),random(1,7),random(1,50),random(1,50)); 
      
      stroke(255, 00, 100, 100);
      line( sin(i)*78,0, cos(i)*80,0, sin(i)*20, cos(i)*234);
      
      stroke(00, 127);
      line( sin(i)*50,0, cos(i)*150,0, sin(i)*25, cos(i)*134);
     
      popMatrix();
      
    }
  }
}

