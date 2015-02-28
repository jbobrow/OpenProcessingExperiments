
//Pinocchio
int nosesize = 10;
int nosesizegrowth = 3;
float Osize = 50;
float Osizegrowth = -0.4;
float XX1 = 230;
float XY1 = 30;
float XX2 = 230;
float XY2 = 30;
float XX3 = 230;
float XY3 = 30;
float XX4 = 230;
float XY4 = 30;
float Xgrowthrate1 = -0.2;
float Xgrowthrate2 = 0.2;
void setup() {
  size(400, 400);
  strokeWeight(10);
}
void draw() {
//background
  background(141,27,221);
//fill the face color  
  fill(167, 125, 87);
//head  
  ellipse(0, 200, 300, 300);
//suture on the face
  ellipse(0, 200, 150, 300);
//fill color of the suture 
  fill(205, 198, 188);
//suture  on the eye rim
  arc(70, 150, 150, 150, HALF_PI, PI);
  line(70, 200, 70, 225);
  line(0, 150, 20, 150);
//the white of the eye  
  fill(0);
  ellipse(70, 150, 100, 100);
  fill(255);
//iris  
  ellipse(70, 150, 70, 70);
  fill(255, 8, 8);
//pupil  
  ellipse(70-(70-mouseY)/15, 150-(150-mouseX)/15, 20, 20);
  fill(167, 125, 87);
//nose  
  rect(150, 200, nosesize, 20);
  nosesize = nosesize + nosesizegrowth;
  if(nosesize >= width){
    nosesizegrowth = -3;
  }else if(nosesize <= 10){
    nosesizegrowth = 3;
  }
//mouth
  fill(255,0,0);
  quad(124, 270, 84, 270, 94, 300-(180-mouseY)/ 15, 112, 300-(180-mouseY) /15);
  //speech bubble  
  noFill();
  arc(230, 30, 200, 150, HALF_PI+QUARTER_PI, TWO_PI+HALF_PI);
  line(230, 105, 160, 130);
  line(160, 130, 160, 85);
//speech
 ellipse(230,30, Osize, Osize);
 line(XX1, XY1, XX2, XY2);
 line(XX3, XY3, XX4, XY4);
 Osize = Osize + Osizegrowth;
 XX1 = XX1 + Xgrowthrate1;
 XY1 = XY1 + Xgrowthrate1;
 XX2 = XX2 + Xgrowthrate2;
 XY2 = XY2 + Xgrowthrate2;
 XX3 = XX3 + Xgrowthrate1;
 XY3 = XY3 + Xgrowthrate2;
 XX4 = XX4 + Xgrowthrate2;
 XY4 = XY4 + Xgrowthrate1;
   if(nosesize >= width){
    Osizegrowth = 0.4;
    Xgrowthrate1 = 0.2;
    Xgrowthrate2 = -0.2;
   }else if(nosesize <= 11){
    Osizegrowth = -0.4;
    Xgrowthrate1 = -0.2;
    Xgrowthrate2 = 0.2;  
  }
}
