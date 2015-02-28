
/// mi primer sketch

float ekis = 0;
float noi = 0.01;
float noi2 = 0.01;
float noi3 = 0.01;
float colors = 100;

void setup(){
  size(1200, 700);
  smooth();
  background(255);

}

void draw(){
  
   fill(255,40); // 
  rectMode(CORNER);
  rect(0,0,width,height);

    ekis = ekis +2;
    noi = noi + 0.01;
    noi2 = noi2 + 0.05;
    noi3 = noi3 + random(-0.1,0);

    float n = noise(noi) * 800;
    float nu = noise(noi2) * 200;
    float nua = (noise(noi3) * 200)-200;

    noStroke();
    fill(colors, 210, 220, 50);
    ellipse(ekis+nua, n-25, nu, nu);

    
    if(ekis == 1400){
      ekis = 0;
      n = random(100, 400);
      colors = random(20, 220);
     
    
    }
 
}
