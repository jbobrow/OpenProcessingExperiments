
void gameOne(){
  
  win= false;
  background(225); 

if (millis()<currentTime+1000){
  
  textSize (30);
  fill (255);
  text ("Hit!", 212,162);
  fill (0);
  text ("Hit!", 210,160);
  fill(255);
  textSize(24);

  
}
  
  if (millis()>currentTime+1500){
  circleY+=speed2 * direction;
 // println(circleY);
  
  }
 

strokeWeight(0);
  ellipse(circleX, circleY, circleRadius, circleRadius);
 strokeWeight (10); 
  line(lineX1, lineY1, lineX2, lineY2); 
  
  
  if (mouseX>= 130){
    if (mouseX<= 230){
      if (mouseY>=250){
        if (mouseY<=320){
          if (lineX2 <=298.597){
            if (lineY2 >=225){
            if (mousePressed){

  lineX2 = offset + cos(angle) * scalar;
  lineY2 = offset+80 + sin(angle) * scalar;
  angle -= speed1;
            
          }
        }
      }
    }
  }
    }
  }
 
 //if (lineX2<=290){
   //if (lineY2>=260){
     //float angle = 30;
     //float speed = 0.0;
   //}
 //}
  

  if (circleLineIntersect(lineX1, lineY1, lineX2, lineY2, circleX, circleY, circleRadius) == true) { 
    hit = true;
    fill(0);  
  }  
  else { 
    fill(255); 
  } 
  
  if (hit == true){
    direction = -4;
  }


  
  if (circleY <- 50){
    fill(0);
    text("WIN", 210, 160);
  }
  
  if (circleY< -350){
    win= true;
    page = 0;
    pctmain= 0.0;
    xmain = startXmain;    
    x2main= startX2main; 
    pct2main = 0.0;
    closed = false;
    currentTime= millis();
    w +=1;
    g +=1;

  }
  
  if (circleY>440){
    fill(0);
    text("LOSE",210,160);
   
  }
  
  if (circleY>750){
    lose= true;
    page = 0;
    pctmain= 0.0;
    xmain = startXmain;    
    x2main= startX2main; 
    pct2main = 0.0;
    closed = false;
    currentTime= millis();
    l +=1;
    g +=1;
    
  }
  

  
  
} 
 
// Code adapted from Paul Bourke: 
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c 
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) { 
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float a = dx * dx + dy * dy; 
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy)); 
  float c = cx * cx + cy * cy; 
  c += x1 * x1 + y1 * y1; 
  c -= 2 * (cx * x1 + cy * y1); 
  c -= cr * cr; 
  float bb4ac = b * b - 4 * a * c; 
 
  //println(bb4ac); 
 
  if (bb4ac < 0) {  // Not intersecting 
    return false; 
  }  
  else { 
     
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a); 
    float ix1 = x1 + mu*(dx); 
    float iy1 = y1 + mu*(dy); 
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a); 
    float ix2 = x1 + mu*(dx); 
    float iy2 = y1 + mu*(dy); 
 
    // The intersection points 
    //ellipse(ix1, iy1, 10, 10); 
    //ellipse(ix2, iy2, 10, 10); 
     
    float testX; 
    float testY; 
    // Figure out which point is closer to the circle 
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) { 
      testX = x2; 
      testY = y2;  
    } else { 
      testX = x1; 
      testY = y1;  
    } 
     
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) { 
      return true; 
    } else { 
      return false; 
    } 
  }
} 

