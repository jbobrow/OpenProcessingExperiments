
float gap=10.0;
PImage bild;

void setup (){
  size (800,800);
  bild = loadImage ("Silva.jpg");
  smooth ();
  }

void draw (){
  background(0);
  noStroke();

   gap=10+mouseX/200.0;
   strokeWeight(2);
  
    for (int i=0; i< width/gap; i++){
      for (int j=0; j< height/gap; j++){
        
        float val= brightness (bild.get(int(gap*i),int(gap*j)))/205;
  
        if(i%2==0) {
        noStroke();
        fill (val*255);     
        rect (gap*i,gap*j,7,1.1+val*10);
        }
        
        pushMatrix();
        
        if(i%1==0) {
        fill(200,mouseX+200);
        noStroke ();
        translate (0,-1);
        drawStar(gap*i+val*3,gap*j+val*10, 10);
        }
        
        translate (0,5);
        translate (5,0);
        strokeWeight(5);
        stroke (206,132,62,mouseX/4);
        line (gap*i,gap*j,gap*i+val*5,gap*j+val*5);
        popMatrix();
      }
    } 
 
 if (keyPressed){
    if(key=='1') {
    background(0);
    noStroke();

     gap=10+mouseX/200.0;
     strokeWeight(2);
    
        for (int i=0; i< width/gap; i++){
          for (int j=0; j< height/gap; j++){
            
            float val= brightness (bild.get(int(gap*i),int(gap*j)))/255;
      
            noStroke();
            fill (10+val*255);
              pushMatrix();
              noFill();
              stroke (84,118,152,mouseX/4);
              strokeWeight(4);
              translate(0,0);
              translate(3,5);
              ellipse (gap*i,gap*j+val*10,val*15,val*15);
              strokeWeight(2);
              ellipse (gap*i,gap*j+val*10,val*5,val*5); 
              stroke (184,18,252,mouseY/4);
              strokeWeight(2);
              translate(10,10);
              translate(13,15);
              translate(-13,-15);
              ellipse (gap*i,gap*j+val*10,val*5,val*15);
              popMatrix();
          }
        } 
     }
    //wenn die 2 gedrückt wird
    if (key =='2'){
        background(0);
        noStroke();

  
         gap=10+mouseX/200.0;
         strokeWeight(2);
        
            for (int i=0; i< width/gap; i++){
              for (int j=0; j< height/gap; j++){
                
                float val= brightness (bild.get(int(gap*i),int(gap*j)))/255;

                noStroke();
                fill (10+val*255);
                rect (gap*i,gap*j,10*radians(val*mouseX),10*radians(val*mouseX));
                  pushMatrix();
                  noFill();
                  stroke (84,118,152,mouseX/4);
                  strokeWeight(random(2,4));
                  translate(0,0);
                  translate(3,5);
                  ellipse (gap*i,gap*j+val*10,val*15,val*15);
                  ellipse (gap*i,gap*j+val*10,val*5,val*5);
                  popMatrix();
            }
         }
      } 
   }
}


void drawStar(float x, float y, float starSize){
  noStroke();
  triangle(x + starSize/2, y, x + starSize, y + starSize/4*3, x, y + starSize/4*3);
  triangle(x, y + starSize/4, x + starSize, y + starSize/4, x + starSize/2, y + starSize);
}




