
boolean doIt;
void setup() {
  size (500, 500);
  doIt = true;
}

void draw () {

  if (doIt) { 
    background(255, 255, 255);
    smooth ();
    noStroke ();
 
 float by;
 
    for (int i=0; i<10; i++) {
      by= random (0,1);
      if(by<=0.5) {
        
      float col = random(0, 50);
      float rred1 = random(250, 255);
      float rgreen1 = random(215, 220);
      float rblue1 = random(0, 0);
      float opac1= random (100, 255);

      fill (rred1, rgreen1, rblue1, opac1);  
      }
      else{
      float col3 = random(0, 50);
      float rred3 = random(0, 0);
      float rgreen3 = random(50, 58);
      float rblue3 = random(200, 255);
      float opac3= random (70, 180);
     
     
     fill (rred3, rgreen3, rblue3, opac3);
      
      
      
      }
      
      float rx= random( 0, width);
      float ry= random (0, height);
      float rx1= random (0, width);
      float ry1= random (0, height);
      float rx2=random(0, width);
      float ry2=random(0, height);
      float rx3=random(0, width);
      float ry3=random(0, height);


      strokeWeight (random (0, 2));


      noStroke();
      triangle(rx, ry, rx1, ry1, rx2, rx2);
      
      for (int k=0; k<=2; k++) {


        float rred = random(0, 65);
        float rgreen = random(0, 65);
        float rblue = random(0, 65);
        float opac= random (50, 255);



        stroke (rred, rgreen, rblue, opac); 
        line (rx1, ry1, rx2, rx2);
        line (rx3, rx3, width/2, height/4);
        doIt=false;

        for (int t=0; k<=2; k++) {
          float rx4= random (width/2, height/ 7);
          float ry4= random (0, 500);
          float rx5= random (0, height);
          float ry5= random (width/5, height);
          float rx6= random (100, 400);
          float ry6= random (0, height);
          float rx7= random (50, 300);
          float ry7= random (0, height);

          stroke (0, 0, 0);
          noFill();
          quad (rx4, ry4, rx5, ry5, rx6, ry6, rx7, ry7);
        }
      }
    }
  }
}

void mousePressed () {
  doIt=true;
}

                
                                
