
// press mouse to pause
// press 's' to save jpg


PImage bild;
float gap = 5;

void setup(){
  size(480,640);
  smooth();
  
  bild = loadImage("me_002.jpg");

  
  
  
}


void draw(){
  background(0);
    noStroke();
    
  //image (bild,0,0);



  for (int i=0; i<width/gap; i++){
   for (int j=0; j<height/gap; j++){
     
     float val = brightness(bild.get(int(gap*i),int(gap*j)))/255;

     fill(bild.get(int(gap*i),int(gap*j)));
     
     if(keyPressed){
       if(key == '1'){
     ellipse(gap*i,gap*j,(mouseX*val)/5,(mouseY*val)/5);
       }
       if(key=='2'){        
     rect(gap*i,gap*j,mouseX*val/5,mouseY*val/5);
     
       }
      }
     }
   }
  }


  




boolean bStop;
void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.jpg");}
  if (key == '0') 
  {
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
        }
    }

