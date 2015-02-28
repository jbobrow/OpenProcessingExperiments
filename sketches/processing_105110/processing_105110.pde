
float R=0;
float G=0;
float B=0;
float ballX=width/2;
float ballY=height/2;
float dX;
float dY;


void setup(){
    size(600,400);
    background(255);
}



void draw(){
  
  noStroke();
  
  fill(0);
  rect(0,0,100,100);
  fill(255,0,0);
  rect(0,100,100,100);  
  fill(0,255,0);
  rect(0,200,100,100);  
  fill(0,0,255);
  rect(0,300,100,100);   
  fill(210);
  rect(500,0,100,400);
    


    //clear
    if(ballX>500 && ballX<=600 && ballY>0 && ballY<=400){
    background(255);
    
    fill(0);
    rect(0,0,100,100);
    fill(255,0,0);
    rect(0,100,100,100);  
    fill(0,255,0);
    rect(0,200,100,100);  
    fill(0,0,255);
    rect(0,300,100,100);   
    fill(180);
    rect(500,0,100,400);
    
    R=255;G=255;B=255;
      fill(R,G,B);
      noStroke();
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
    }

    //choose black
     if (ballX>0 && ballX<100 && ballY>0 && ballY<=100){
      R=0;G=0;B=0;
      fill(R,G,B);
      strokeWeight(2);
      stroke(255);
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
      }
      
      
    //choose red
     else if (ballX>0 && ballX<100 && ballY>100 && ballY<=200){
      R=255;G=0;B=0;
      fill(R,G,B);
      strokeWeight(2);
      stroke(255);
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
      }
      
      
    //choose green
     else if (ballX>0 && ballX<100 && ballY>200 && ballY<=300){
      R=0;G=255;B=0;
      fill(R,G,B);
      strokeWeight(2);
      stroke(255);
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
      }
      
      
    //choose blue
     else if (ballX>0 && ballX<100 && ballY>300 && ballY<=400){
      R=0;G=0;B=255;
      fill(R,G,B);
      strokeWeight(2);
      stroke(255);
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
      }
      
     else {
      fill(R,G,B);     
      noStroke();
        ellipse(ballX,ballY,20,20);
        dX=mouseX-ballX;
        dY=mouseY-ballY;
        ballX=dX/30+ballX;
        ballY=dY/30+ballY;
     }

}
