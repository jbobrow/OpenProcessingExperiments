
float[] posX=new float[9];
float[] posY=new float[9];
float[] velX=new float[9];
float startingTime=0;
float interval=1000;
float interval2=2000;
float interval3=3000;
boolean on = false;
int time1=3000;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
}



void draw() {

  background(200, 130, 40);

//  if (currentTime==interval1){
//    fill(0);
//    ellipse(width/2,height/2,20,20);
//    ellipse(width/2-10,height/2,20,20);
//    ellipse(width/2-20,height/2,20,20);
//  }
//    
   if (millis()-startingTime<interval) {
    ellipse(width/2, height/2, 80, 80);
   ellipse(width/2,height/2,40,40);
  ellipse(width/2,height/2,20,20);
   }
   
 
   if(millis()-startingTime>interval&& millis()-startingTime<interval2){
    ellipse(width/2, height/2, 40, 40);
   ellipse(width/2,height/2,20,20);
    } //if true, draw circle
 
   if(millis()-startingTime>interval2&& millis()-startingTime<interval3){
    ellipse(width/2, height/2, 20, 20);
    }
 

  
  
  
  if(millis()-startingTime>time1){
    
    for (int i=0; i<9;i++) {
    posX[i]=50*(1+i);
    ellipse(posX[i], posY[i], 10, 10);
    fill(0);
                           }
  

    for (int i=0; i<9;i++) {
    velX[i]=random(1, 10);
     }
    for (int i=0; i<9;i++) {
    posY[i]=posY[i]+velX[i];
     }
                        }

}

//  void mouseReleased() {
//  on=true;  //activates the if statement above. This is needed in order to prevent the circle from drawing when the sketch starts
//  startingTime=millis();  //sets starting time of "timed phenomenon" equal to the current number of milliseconds since the sketch has started
//}
    


