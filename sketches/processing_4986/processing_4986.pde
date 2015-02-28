
float x1 = 360.00;
float y1 = 150.00;
float x2 = 380.00;
float y2 = 100.00;
float x3 = 310.00;
float y3 = 175.00;
float radius1 = 50.00;
float radius2 = 40.00;
int num = 10;


void setup() {
  size(480,320);
  smooth();
  frameRate(24);
}

void draw()
{
  background(255);
  stroke(0);
  fill(0,240);

  if(key == ENTER || key == RETURN){
    radius1 += 25;
    radius2 += 15;
  }else{
    radius1 = 50;
    radius2 = 40;
  }

  float xEye = x2 + mouseX / 10;
  float yEye = y2 + mouseY / 2;
  
  fill(0, 245 - mouseX / 10 - mouseY / 10);
  strokeWeight(3);
  line (x1, y1, xEye, yEye);
  strokeWeight(1);
  ellipse(xEye, yEye, radius1 - 35, radius1 - 35);
  

  
  for (int i = 0;i <= num;i++)
  {
    fill(0, 245 - mouseX / 10 - mouseY / 10);
    if (i < 2){
      ellipse(x1 - i * 25, y1 + i * 15, radius1 * (1 - i * 0.4), radius1 *(1 - i *0.4));
    }
    else if(i >= 2 && i <= 6){
      ellipse(x3 - (i - 2) * 25, y3, radius2, radius2);
    }
    else if(i >= 7){      
      ellipse(x3 - 100 - (i - 6) * 14, y3 +(i - 6) * 3, radius2 * (1 - (i - 6) * 0.15), radius2 * (1 - (i - 6) * 0.15));
    }
    
  }
  
  
}

