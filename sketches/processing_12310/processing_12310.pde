
// Assignment # 2
// Name: Natalie Kato
// E-mail: nkato@brynmawr.edu   
// Date: 9/16/10 

float x = 250;
float xLine;
float y = 250;
float w = 100;
float h = 230; 
int countBuild = 0;
int window = 0;
int spacing = 10;
int cloudX = 0;
float cloudY = 135;
int cloudW = 50;
int cloudH = 100;
int countStar = 0;
float starXAxis = 5;
float starYAxis = 6;
int mouseP = 1;
int moon = 80;
int sun = 90;

void setup() {
  size(500,500);
  background(184, 235, 240);
  smooth();
}
void draw() {
  if (mouseP == 1) {
    //colors the buildings different shades of grey.  
    while (countBuild < 50) {
      if (countBuild % 5 == 0) {
        fill(149, 149, 149);
      } else if (countBuild % 7 == 0) {
          fill(206, 191, 191);
      } else if (countBuild % 3 == 0) {
          fill(227, 224, 224);
      } else {
          fill(180, 175, 175);
      }
      
    //makes building have black edges.
    stroke(0);

    //buildings.
    rect(x, y, w, h);
    xLine = x;
  
    //makes inside filler for buildings black. 
    fill(0);
    rect(x + 10, y + 10, w - 20, h - 10);
  
    //colors lines for buildings.
    strokeWeight(2);
    if (countBuild % 5 == 0) {
      stroke(149, 149, 149);
    } else if (countBuild % 7 == 0) {
        stroke(206, 191, 191);
    } else if (countBuild % 3 == 0) {
        stroke(227, 224, 224);
    } else {
        stroke(180, 175, 175);
    }
    
    //makes lines for buildings.       
    while (xLine <= (x + w)) { 
      line (xLine, y + 10, xLine, y + 400);
      xLine = xLine + spacing;
     } 
       
     //counts number of buldings built.
     countBuild = countBuild + 1;
        
     //creates new numbers to make random buildings.
     x = random (0, 500);
     y = random(125, 500);
     w = random (80, 150);
     h = random (365, 400);
    }
  
    //makes clouds for day.
    if (cloudX < width) {
       //clouds
       noStroke();
       fill(240, 240, 240, 10);
       beginShape();
       curveVertex(cloudX,cloudY);
       curveVertex(cloudX,cloudY);
       curveVertex(cloudX + 250, cloudY - 40);
       curveVertex(cloudX + (4*cloudW), cloudY - cloudH);
       curveVertex(cloudX + 100, cloudY - 30);
       curveVertex(cloudX + (0.7*cloudW), cloudY - (0.5*cloudH));
       curveVertex(cloudX + 390, cloudY);
       curveVertex(cloudX, cloudY);
       endShape(CLOSE);  	
         
       cloudX = cloudX + 1;
    } else {
       cloudX = -5;
       cloudY = random(50, 100); 
    }
    
    //makes clouds for night.
  } else if (mouseP == -1) {
      if (cloudX < width) { 
        fill(252, 254, 255, 5);
        noStroke();
        beginShape();
        curveVertex(cloudX,cloudY);
        curveVertex(cloudX,cloudY);
        curveVertex(cloudX + 250, cloudY - 40);
        curveVertex(cloudX + (4*cloudW), cloudY - cloudH);
        curveVertex(cloudX + 430, cloudY + 100);
        curveVertex(cloudX + 100, cloudY - 30);
        curveVertex(cloudX + (0.7*cloudW), cloudY - (0.5*cloudH));
        curveVertex(cloudX + 390, cloudY);
        curveVertex(cloudX, cloudY);
        endShape(CLOSE);  	
         
        cloudX = cloudX + 1;
      } else {
          cloudX = -200;
          cloudY = random(50, 120);
      }
  }
}  


void mousePressed() {
  //makes day.
  if (mouseP == -1) {
    countBuild  = 0;
    background(184, 235, 240);
  
    //colors the buildings different shades of grey.  
    while (countBuild < 50) {
      if (countBuild % 5 == 0) {
        fill(149, 149, 149);
      } else if (countBuild % 7 == 0) {
          fill(206, 191, 191);
      } else if (countBuild % 3 == 0) {
          fill(227, 224, 224);
      } else {
          fill(180, 175, 175);
      }
          
      //makes building have black edges.
      stroke(0);
      
      //buildings.
      rect(x, y, w, h);
      xLine = x;
      
      //makes inside filler for buildings black. 
      fill(0);
      rect(x + 10, y + 10, w - 20, h - 10);
      
      //colors lines for buildings.
      strokeWeight(2);
      if (countBuild % 5 == 0) {
        stroke(149, 149, 149);
      } else if (countBuild % 7 == 0) {
          stroke(206, 191, 191);
      } else if (countBuild % 3 == 0) {
          stroke(227, 224, 224);
      } else {
          stroke(180, 175, 175);
      }
      
     //makes lines for buildings.       
     while (xLine <= (x + w)) { 
        line (xLine, y + 10, xLine, y + 400);
        xLine = xLine + spacing;
     } 
     
      //counts number of buldings built.
      countBuild = countBuild + 1;
      
      //creates new numbers to make random buildings.
      x = random (0, 500);
      y = random(125, 500);
      w = random (80, 150);
      h = random (365, 400);
    }
  } else if (mouseP == 1) {
      //change background to night time.
      background(28, 32, 121);
      countBuild = 0;
      countStar = 0;
      
      //makes yellow random stars.
      noStroke();
      fill(255, 255, 90);
      while (countStar < 30) {
        starXAxis = random(0, 500);
        starYAxis = random(0, 150);
        ellipse(starXAxis, starYAxis, 2, 8);
        ellipse(starXAxis, starYAxis, 8, 2);
        countStar = countStar + 1;
      }
      
      //colors the buildings different shades of grey.  
      while (countBuild < 50) {
        if (countBuild % 5 == 0) {
          fill(49, 49, 41);
        } else if (countBuild % 7 == 0) {
            fill(108, 108, 108);
        } else if (countBuild % 3 == 0) {
            fill(155, 155, 155);
        } else {
            fill(3, 3, 2);
        }
            
        //makes building have black edges.
        stroke(0);
        
        //buildings.
        rect(x, y, w, h);
        xLine = x;
        
        //makes inside filler for buildings white. 
        fill(255);
        rect(x + 10, y + 10, w - 20, h - 10);
        
        //colors lines for buildings.
        strokeWeight(2);
        if (countBuild % 5 == 0) {
          stroke(49, 49, 41);
        } else if (countBuild % 7 == 0) {
            stroke(108, 108, 108);
        } else if (countBuild % 3 == 0) {
            stroke(155, 155, 155);
        } else {
            stroke(3, 3, 2);
        }
        
       //makes lines for buildings.       
       while (xLine <= (x + w)) { 
          line (xLine, y + 10, xLine, y + 400);
          xLine = xLine + spacing;
       } 
       
        //counts number of buldings built.
        countBuild = countBuild + 1;
        
        //creates new numbers to make random buildings.
        x = random (0, 500);
        y = random(125, 500);
        w = random (80, 150);
        h = random (365, 400);
      }
  }    
  //converts from day to night.
  mouseP = mouseP * -1;
}

void keyPressed() {
 //make sun appear if during day and moon appear if during night.
 if (mouseP == -1) {
   strokeWeight(8);
   stroke(104, 137, 87, 100);
   fill(226, 255, 134);
   ellipse(width - 65, height - 435, moon, moon);
 } else if (mouseP == 1) {
     strokeWeight(15);
     stroke(234, 200, 26, 100);
     fill(255, 240, 72);
     ellipse(width - 435, height - 420, sun, sun);
     
 }
}


