
int x = 300;
int y = 300;
int i = 95;
void setup(){
  size(600, 600);
 ellipseMode(RADIUS);
 strokeWeight(4);
  smooth();
 background(100);
    for (int t = 0; t <= height; t += 20){
      for ( int r = 0; r <= width; r += 20){
        fill(0, 0, 255); 
       rect(r, t, 10, 10);
      }
    } 
  
}

void draw(){
  //all circles react together with center circle
  float d = dist(mouseX, mouseY, x, y);
  if(d < 30){
    if (mousePressed){
      fill(255, 0, 0);
    }else if(mouseButton == RIGHT){
    fill(255, 154, 3);
  
}else{
  fill(255);
}
    
    
  
    ellipse(x, y, 30, 30);
 //I don't understand why, when I add the for loop here, the center
//circle doesn't behave according to the if statement 
     //background(100);
     // for (int t = 0; t <= height; t += 20){
      //for ( int r = 0; r <= width; r += 20){
        //fill(0, 0, 255); 
       //rect(r, t, 10, 10);
   //   }
 //   } 

      
  ellipse(300, 100, i, i);
  ellipse(500, 300, i, i);
ellipse(450, 150, i, i);
ellipse(300, 500, i, i);
ellipse(100, 300, i, i);
ellipse(150, 150, i, i);
ellipse(150, 450, i, i);
ellipse(450, 450, i, i);
    } 
  
 //each circle is to change color individually
 //when hovered over and clicked on
 
 //colors draw continuously until previous command is drawn over it
  float g = dist(mouseX, mouseY, 300, 100); 
  if(g < i){
  fill(255, 44, 150);
  if(mousePressed){
    fill(20, 124, 24);
  }
  ellipse(300, 100, i, i);
}
  float h = dist(mouseX, mouseY, 450, 150);
  if(h < i){
    fill(216, 44, 255);
    if (mousePressed){
    fill(157, 160, 39);
    }
   ellipse(450, 150, i, i);
  } 
    
      float j = dist(mouseX, mouseY, 500, 300);
  if(j < i){
    fill(71, 44, 255);
    if (mousePressed){
    fill(160, 97, 39);
    }
     ellipse(500, 300, i, i);
  }
    
      float k = dist(mouseX, mouseY, 450, 450);
  if(k < i){
    fill(44, 246, 255);
    if (mousePressed){
    fill(160, 43, 39);
    }
    ellipse(450, 450, i, i);
  }
    
      float l = dist(mouseX, mouseY, 300, 500);
  if(l < i){
    fill(44, 255, 91);
    if (mousePressed){
    fill(39, 78, 160);
    }
    ellipse(300, 500, i, i);
  }
    
      float p = dist(mouseX, mouseY, 150, 450);
  if(p < i){
    fill(191, 255, 44);
    if (mousePressed){
    fill(113, 39, 160);
    }
    ellipse(150, 450, i, i);
  }
    
      float o = dist(mouseX, mouseY, 100, 300);
  if(o < i){
    fill(240, 255, 44);
    if (mousePressed){
    fill(140, 39, 97);
    }
    ellipse(100, 300, i, i);
  }
    
      float u = dist(mouseX, mouseY, 150, 150);
  if(u < i){
    fill(255, 44, 86);
    if (mousePressed){
    fill(39, 143, 160);
    }
    ellipse(150, 150, i, i);
  }
  }

  


