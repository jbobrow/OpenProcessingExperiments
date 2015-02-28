
PFont myfont;

void setup() {
  size(600,520);
  myfont = createFont("Garamond",30);
  smooth();
}

void draw (){
  background(0);
  noStroke();
  
  textFont(myfont);
  float cs =80;
  textAlign(CENTER,CENTER);
  
  for (int j=0; j<height/cs+1; j++){
    for(int i=0; i<width/cs+1; i++){
      
      strokeWeight(9);
      stroke(150);
      fill(100);
      ellipse(i*cs, j*cs, cs, cs);
     
      noFill();

      strokeWeight(3);
      ellipse(i*cs-cs/2, j*cs-cs/2, cs*1.5, cs*1.5);
     
      stroke(150);
      noFill();
      strokeWeight(2);
      ellipse(i*cs-cs/2, j*cs-cs/2, cs*2, cs*2);
    
      fill(0);
      stroke(255,100);
      strokeWeight(3);
      //ellipse(i*cs, j*cs, cs/2, cs/2);
     
      stroke(0);
      strokeWeight(2); 
      line(i*cs+(cs/2),0,i*cs+(cs/2),height);
      line(0,j*cs-(cs/2),width+(cs*2),j*cs-(cs/2));

    }
  }
}

