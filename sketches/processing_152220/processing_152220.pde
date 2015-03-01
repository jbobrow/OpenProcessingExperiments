
void setup() {
  background(200);
  size(600, 600);
}
  
  void draw(){
   
    float cenX = width/2;
    float cenY = height/2;
    int i;
    int num = 6;
    float ang = (millis()*360*PI)/(180*num*1000);
    for(i = 0; i < num; i++){
    float endX = cenX + 100*sin(ang*i);
    float endY = cenY + 100*cos(ang*i);
    float X = cenX - endX;
    float Y = cenY - endY;
    float hyp_sq = pow(X, 2) + pow(Y, 2);
    float Radius = pow((hyp_sq), 0.5);
// line(cenX, cenY, endX, endY);
//strokeWeight(1);
  ellipse(endX, endY, Radius/4, Radius/4);
 
  
   for(int j = 0; j < num; j++){
    float endX2 = cenX + 180*sin(ang*j);
    float endY2 = cenY + 180*cos(ang*j);
ellipse(endX2, endY2, Radius/3, Radius/3);
}
    
      for(int k = 0; k < num; k++){
    float endX3 = cenX + 138*sin(-ang*k);
    float endY3 = cenY + 138*cos(ang*k);
    ellipse(endX3, endY3, Radius/2, Radius/2);
  }
    
    for(int l = 0; l < num; l++){
    float endX4 = cenX + 77*sin(-ang*l);
    float endY4 = cenY + 77*cos(ang*l);
 ellipse(endX4, endY4, Radius/5, Radius/5);
 ;
      }
    }}
