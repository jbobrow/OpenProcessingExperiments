
int n = 10;
float angle = 0;
float rad = 0;
float[] xTop = new float [n];
float [] xBottom = new float [n];
//Object shape1;


void setup(){
  size(600,600);
  background(0,162,78);
  smooth();
  angle = 0;
 // shape1 = new Object(10,20);

}

void draw(){
  pushMatrix();
    noStroke();
    translate(-300,-300);
    fill(255,255,255, 2);
    rect(300,300,600,600);
  popMatrix();
  
  pushMatrix();
    translate(300,300);
    rotate(radians(frameCount));
    myShape(0,0);
  popMatrix();
  
  if (mousePressed){
    pushMatrix();
    translate(300,300);
    rotate(radians(frameCount/2));
    largeShape(0,0);
   popMatrix();
   }

//TOP button
  noStroke();
  fill(247,0,124,90);
  rect(0,0,600,21);
    if(mouseX > 0 && mouseX < 600 && mouseY > 0 && mouseY < 21){
            if(mousePressed){
                   colorMode(RGB,100);
            } else { 
                   colorMode(HSB,255);
                    }
            } else { 
                   colorMode(RGB,255);
                    }
               
               
//RIGHT button
  noStroke();
  fill(163,35,125,90);
  rect(579,0,21,600);
    if(mouseX > 579 && mouseX < 600 && mouseY > 0 && mouseY < 600){
            if(mousePressed){
                float x = 200*cos(radians(angle));
                float y = 200*sin(radians(angle));
                ellipse(x+width/2,y+height/2,20,20);
                angle--;
              
                  } else { 
                    float x = 150*cos(radians(angle));
                    float y = 149*sin(radians(angle));
                    ellipse(x+width/2,y+height/2,20,20);
                    angle++;
                }
               }
               
               
//BOTTOM button
  noStroke();
  fill(83,38,112,90);
  rect(0,579,600,21);
    if(mouseX > 0 && mouseX < 600 && mouseY > 579 && mouseY < 600){
            if(mousePressed){
              //elements borrowed form "Manual Arrays" Linda tutorial
              stroke(245,235,19);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,600);
                  xBottom[i] = random(0,600);
                  line (xTop[i], 0, xBottom[i],800);
              }  
                  } else { 
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,600);
                  xBottom[i] = random(0,600);
                  line (xTop[i], 0, xBottom[i],800);
                }
              }
              } else { 
                 fill(0, 80, 188);
                 ellipse(30,660,25,40);
               }

//LEFT button
  noStroke();
  fill(3,80,159,90);
  rect(0,0,21,600);
    if(mouseX > 0 && mouseX < 21 && mouseY > 0 && mouseY < 600){
            if(mousePressed){
              //elements borrowed form "Manual Arrays" Linda tutorial
              stroke(21,0,208);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,800);
                  xBottom[i] = random(0,800);
                  line (xTop[i], 0, xBottom[i],800);
              }  
                  } else { 
                      fill(21,0,208);
                      ellipse(30,660,25,40);
                }
              } else { 
                 fill(0, 80, 188);
                 ellipse(30,660,25,40);
               }

//if(mouseReleased){
//
//
//
//}


//  bike1.moveB(); //move first
//  bike1.display();//display second


}

//
   void myShape(int x, int y){
   stroke(0,114,162);
   fill(0,162,78,70);
      beginShape();
      vertex(0,0);
      vertex(63,121);
      vertex(-31,93);
      vertex(-126,116);
      vertex(-69,42);
      vertex(-111,-40);
      vertex(0,0);
      endShape();
}


void smallShape(int x, int y){
   stroke(255);
      beginShape();
      vertex(0,0);
      vertex(-72,-26);
      vertex(-44,27);
      vertex(-82,75);
      vertex(-20,60);
      vertex(40,79);
      vertex(0,0);
      endShape();
}  
      

void largeShape(int x, int y){
   //  stroke(0, 120, random(255));
    stroke(random(255), 0, 120);
    fill(0,0,0,1);
      beginShape();
      vertex(0,0);
      vertex(-235,86);
      vertex(-148,87);
      vertex(-167,241);
      vertex(-68, 193);
      vertex(129,252);
      vertex(0,0);
      endShape();
}

//// when I try to run this it said its lacking "}" but I can't figure out where//
    //class Object{
    //  int x,y,speedx,speedy;
    //  Object(int _x, int _y){  
    //    x = _x;
    //    y = _y;
    //    speedx = 1;
    //    speedy = 1;
    //}
    // void moveB(){
    //    x+=speedx;
    //    y+=speedy;
    // }
    // 
    //  void display(){ 
    //  
    //  ellipse(x,y,x,y);
    //  }                            
                                //void mousePressed(){
                                //    pushMatrix();
                                //      translate(300,300);
                                //      rotate(radians(frameCount));
                                //      largeShape(0,0);
                                //    popMatrix();
                                
                                //}







