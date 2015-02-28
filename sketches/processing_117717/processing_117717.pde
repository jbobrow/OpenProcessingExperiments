
String[] month={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
float[] humidity00={58,59,68,76,73,78,76,76,78,79,72,64,59,61,68,76,74,79,78,77,79,79,73,65,60,61,67,76,74,81,78,78,80,80,74,66,60,61,69,76,76,81,80,79,80,81,75,66,61,61,68,77,77,81,80,80,81,81,77,67,60,61,70,77,76,78,76,78,81,81,77,67};
float[] humidity06={60,61,70,75,74,72,73,73,77,79,76,68,60,60,67,71,72,69,68,67,71,74,74,67,58,61,64,69,68,66,64,62,66,68,69,65,56,59,59,67,65,62,61,59,62,65,66,64,54,57,57,66,64,60,59,55,58,61,63,61,52,56,55,66,63,60,58,54,55,58,60,58};
float[] humidity12={50,56,53,64,63,59,58,52,54,57,60,55,50,55,52,61,61,60,57,52,56,54,59,54,50,55,54,62,61,61,59,53,55,53,59,55,51,54,56,62,61,60,60,54,57,56,61,57,52,56,59,64,62,63,60,56,60,60,63,58,52,56,62,67,65,66,64,61,65,64,65,60};
float[] humidity18={54,56,63,70,67,68,69,64,68,66,66,61,55,57,65,72,69,72,70,67,72,68,66,61,56,57,65,73,70,73,71,69,74,70,67,62,56,58,65,73,71,75,72,69,75,72,69,62,57,60,64,75,73,77,75,72,77,74,70,63,57,60,66,75,74,79,75,74,78,75,72,63};
float[] wholeDay= concat(concat(humidity00,humidity06),concat(humidity12,humidity18));
void setup(){
  size (1200,600);
  background(0);
  smooth();
  strokeWeight(0.1);
  textSize(22);
  text("Average Hourly Relative Humidity of Boston",400,570);
  for (int i=0; i<=11; i++){
    textSize(18);
    text(month[i],width*0.05+i*width*0.9/month.length,530);
  }
  
}

void draw(){
  float x = width*0.05;
  float y = height*0.05;
  float deltaX = width*0.9/month.length;
  float w = deltaX*0.2;
  float deltaY = height*0.8/6;
  float v = deltaY*0.25;
  
  float min = min(wholeDay);
  float max = max(wholeDay);
  for (float value : wholeDay){
    float a = map(value, min, max, 0, 85);
    float aT = map(value, min/2, max, 0, 255);
    fill(255, 0, 0, aT);
    rect(x,y,a,w);
    fill(255, 0, 0, aT/2);
    rect(x+a,y,85-a,w);
    x = x + deltaX; 
    if (x > width*0.9){
     x = width*0.05;
     y = y +v;
    }
  
  } 
  noLoop(); 
}


